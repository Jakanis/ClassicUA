local _, addonTable = ...

if not addonTable.M then
    addonTable.M = {}
end

addonTable.M.world_map = {}
local M = addonTable.M.world_map
local common = addonTable.M.common


function M.world_map_dropdown_button_click(self)
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

local world_map_area_label_update = function (self)
    local text = self.Name:GetText()
    if text then
        local found = common.get_entry_text(text)
        if found then
            self.Name:SetText(common.capitalize(found))
        end
    end
end

function M.prepare_world_map()
    for provider, _ in pairs(WorldMapFrame.dataProviders) do
        if provider.setAreaLabelCallback and provider.Label and provider.Label.Name then
            local _, size, style = provider.Label.Name:GetFont()
            provider.Label.Name:SetFont("Interface\\AddOns\\ClassicUA\\assets\\FRIZQT_UA.ttf", size, style)
            provider.Label:HookScript("OnUpdate", world_map_area_label_update)
            break
        end
    end
end

return M
