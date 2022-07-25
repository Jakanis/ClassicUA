local _, addonTable = ...

if not addonTable.M then
    addonTable.M = {}
end

addonTable.M.world_map = {}
local M = addonTable.M.world_map
local common = addonTable.M.common

-- [[ world map ]]

local world_map_original_set_map_id = WorldMapFrame.SetMapID
local world_map_dds = { WorldMapContinentDropDown, WorldMapZoneDropDown }

WorldMapFrame.SetMapID = function (self, mapID)
    world_map_original_set_map_id(self, mapID)

    for _, v in ipairs(world_map_dds) do
        local text = v.Text:GetText()
        local found = common.get_entry_text(text)
        if found then
            v.Text:SetText(common.capitalize(found))
        end
    end
end

local world_map_dropdown_button_click = function (self)
    local dd = DropDownList1
    if dd:IsShown() then
        local texts = {}
        local buttons = {}

        for i = 1, dd.numButtons do
            local button = _G["DropDownList1Button" .. i]
            local text = button:GetText()
            local found = common.get_entry_text(text)
            if found then
                local t = common.capitalize(found)
                texts[#texts + 1] = t
                buttons[t] = button
                button:SetText(t)
            end
        end

        sort(texts)
        local h = DropDownList1Button1:GetHeight()
        for i = 1, #texts do
            buttons[texts[i]]:SetPoint("TOPLEFT", 16, - i * h)
        end
    end
end

WorldMapContinentDropDownButton:HookScript("OnClick", world_map_dropdown_button_click)
WorldMapZoneDropDownButton:HookScript("OnClick", world_map_dropdown_button_click)

function M.world_map_area_label_update(self)
    local text = self.Name:GetText()
    if text then
        local found = common.get_entry_text(text)
        if found then
            self.Name:SetText(common.capitalize(found))
        end
    end
end

return M
