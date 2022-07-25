local _, addonTable = ...

if not addonTable.M then
    addonTable.M = {}
end

addonTable.M.zone_text = {}
local M = addonTable.M.zone_text
local tooltips = addonTable.M.tooltips
local quests = addonTable.M.quests


tooltips.register_tooltip_hooks()
quests.register_quests_hooks()


