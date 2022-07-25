local _, addonTable = ...

if not addonTable.M then
    addonTable.M = {}
end

addonTable.M.zone_text = {}
local M = addonTable.M.zone_text
local common = addonTable.M.common


-- [[ zone text and minimap ]]

local zone_text_lookup = {
    -- { FontString object, lookup function }
    { ZoneTextString, common.get_entry_text },
    { SubZoneTextString, common.get_entry_text },
    { MinimapZoneText, common.get_entry_text },
    { PVPInfoTextString, common.get_text },
    { PVPArenaTextString, common.get_text },
}

function M.update_zone_text()
    local text, found
    for _, lookup in ipairs(zone_text_lookup) do
        text = lookup[1]:GetText()
        if text then
            local found = lookup[2](text)
            if found then
                lookup[1]:SetText(common.capitalize(found))
            end
        end
    end
end

function M.prepare_zone_text()
    for _, lookup in ipairs(zone_text_lookup) do
        local _, size, style = lookup[1]:GetFont()
        lookup[1]:SetFont("Interface\\AddOns\\ClassicUA\\assets\\FRIZQT_UA.ttf", size, style)
    end
    M.update_zone_text()
end

return M


