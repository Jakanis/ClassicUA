local _, addonTable = ...

if not addonTable.M then
    addonTable.M = {}
end

addonTable.M.tooltips = {}
local M = addonTable.M.tooltips
local common = addonTable.M.common

-- [ tooltips ]

local tooltip_entry_type = nil
local tooltip_entry_id = nil


local make_entry_text = function (text, tooltip, tooltip_matches_to_skip)
    if not text then
        return nil
    end

    text = { strsplit("#", text) }
    if #text == 1 then
        return text[1]
    end

    if not tooltip_matches_to_skip then
        tooltip_matches_to_skip = 0
    end

    local values = {}

    for i = 2, #text do
        local p = common.esc(text[i]):gsub("{(%d+)}", function (a) return "(%d+)" end)
        local match_number = 0
        for j = 1, tooltip:NumLines() do
            local t = getglobal(tooltip:GetName() .. "TextLeft" .. j):GetText()
            local v = { t:match(p) }
            if #v > 0 then
                match_number = match_number + 1
                if match_number > tooltip_matches_to_skip then
                    for k = 1, #v do values[#values + 1] = v[k] end
                    break
                end
            end
        end
    end

    return text[1]:gsub("{(%d+)}", function (a) return values[tonumber(a)] end)
end

-- content_index: default is 2 (description)
local add_entry_to_tooltip = function (tooltip, entry_type, entry_id, content_index)
    if tooltip_entry_type then
        return
    end

    local entry = common.get_entry(entry_type, entry_id)

    if not entry then -- todo: check if debug info should be shown
        entry = { entry_type .. "|cff999999#|r" .. entry_id }
    end

    if entry then
        tooltip:AddLine(" ")
        tooltip:AddLine("|TInterface\\AddOns\\ClassicUA\\assets\\ua:0|t " .. common.capitalize(entry[1]), 1, 1, 1)

        local content = make_entry_text(entry[content_index or 2], tooltip)
        if content then
            tooltip:AddLine(common.capitalize(content), 1, 1, 1, true)
        end

        if tooltip:IsShown() then
            tooltip:Show()
        end
    end

    tooltip_entry_type = entry_type
    tooltip_entry_id = entry_id
end

local add_talent_entry_to_tooltip = function (tooltip, tab_index, talent_index, rank, max_rank)
    local talent = addonTable.talent_tree[tab_index] and addonTable.talent_tree[tab_index][talent_index] or false
    if not talent then -- this can never be true (as we have full Classic talent tree)
        return
    end

    local rank_to_show = math.max(rank, 1)
    local next_rank_to_show = math.min(rank + 1, max_rank)

    if not talent[rank_to_show] or not talent[next_rank_to_show] then -- this can never be true (otherwise, bug in talent_tree)
        return
    end

    local entry = common.get_entry("spell", talent[rank_to_show])
    if not entry then
        entry = { "spell|cff999999#|r" .. talent[rank_to_show] }
    end

    tooltip:AddLine(" ")
    tooltip:AddLine("|TInterface\\AddOns\\ClassicUA\\assets\\ua:0|t " .. entry[1], 1, 1, 1)

    if entry[2] then
        tooltip:AddLine(make_entry_text(entry[2], tooltip), 1, 1, 1, true)
    end

    if rank_to_show ~= next_rank_to_show then
        local next_rank_desc = "spell|cff999999#|r" .. talent[next_rank_to_show]

        local entry = common.get_entry("spell", talent[next_rank_to_show])
        if entry and entry[2] then
            next_rank_desc = make_entry_text(entry[2], tooltip, 1)
        end

        tooltip:AddLine(" ")
        tooltip:AddLine(common.get_text("Next rank") .. ":", 1, 1, 1)
        tooltip:AddLine(next_rank_desc, 1, 1, 1, true)
    end

    if tooltip:IsShown() then
        tooltip:Show()
    end

    tooltip_entry_type = "spell"
    tooltip_entry_id = talent[rank_to_show]
end

local tooltip_set_item = function (self)
    local _, link = self:GetItem()
    if link then
        local _, _, id = link:find("Hitem:(%d+):")
        if id then
            add_entry_to_tooltip(self, "item", id)
        end
    end
end

local tooltip_set_spell = function (self)
    local _, id = self:GetSpell()
    if id then
        add_entry_to_tooltip(self, "spell", id)
    end
end

local tooltip_set_unit = function (self)
    local _, unit = self:GetUnit()
    if unit then
        local guid = UnitGUID(unit)
        local _, _, _, _, _, id, _ = strsplit("-", guid)
        if id then
            add_entry_to_tooltip(self, "npc", id)
        end
    end
end

local tooltip_cleared = function (self)
    tooltip_entry_type = false
    tooltip_entry_id = false
end

function M.register_tooltip_hooks()

    for _, tt in pairs { GameTooltip, ItemRefTooltip } do
        tt:HookScript("OnTooltipSetItem", tooltip_set_item)
        tt:HookScript("OnTooltipSetSpell", tooltip_set_spell)
        tt:HookScript("OnTooltipSetUnit", tooltip_set_unit)
        tt:HookScript("OnTooltipCleared", tooltip_cleared)
    end
    
    hooksecurefunc(GameTooltip, "SetTalent", function (self, tab_index, talent_index)
        local rank, max_rank, is_active = select(5, GetTalentInfo(tab_index, talent_index))
        if not is_active then -- skip active talent (they get shown as spell)
            -- print("talent", tab_index, talent_index, "rank", rank, max_rank)
            add_talent_entry_to_tooltip(self, tab_index, talent_index, rank, max_rank)
        end
    end)
    
    hooksecurefunc(GameTooltip, "SetUnitAura", function (self, unit, index, filter)
        local id = select(10, UnitAura(unit, index, filter))
        if id then
            add_entry_to_tooltip(self, "spell", id, 3)
        end
    end)
    
    hooksecurefunc(GameTooltip, "SetUnitBuff", function (self, unit, index)
        local id = select(10, UnitAura(unit, index, "HELPFUL"))
        if id then
            add_entry_to_tooltip(self, "spell", id, 3)
        end
    end)
    
    hooksecurefunc(GameTooltip, "SetUnitDebuff", function (self, unit, index)
        local id = select(10, UnitAura(unit, index, "HARMFUL"))
        if id then
            add_entry_to_tooltip(self, "spell", id, 3)
        end
    end)
    
    GameTooltip:HookScript("OnUpdate", function (self)
        local name, unit = self:GetUnit()
        if name == nil and unit == nil and not tooltip_entry_type then
            local text = GameTooltipTextLeft1:GetText()
            if text ~= tooltip_entry_id then
                local entry = common.get_entry_text(text)
                if entry then
                    if self:NumLines() > 1 then self:AddLine(" ") end
                    self:AddLine("|TInterface\\AddOns\\ClassicUA\\assets\\ua:0|t " .. common.capitalize(entry), 1, 1, 1)
    
                    if self:IsShown() then
                        self:Show()
                    end
                end
    
                tooltip_entry_type = "text"
                tooltip_entry_id = text
            end
        end
    end)

end


return M


