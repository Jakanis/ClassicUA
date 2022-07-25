local _, addonTable = ...

local common = addonTable.M.common
local books = addonTable.M.books
local quests = addonTable.M.quests
local tooltips = addonTable.M.tooltips
local world_map = addonTable.M.world_map
local zone_text = addonTable.M.zone_text

local globals = addonTable.V

local get_stats = function ()
    local stats = {}
    for _, v in ipairs({ "quest_a", "quest_h", "quest_n", "book", "item", "spell", "npc", "object", "zone" }) do
        stats[v] = 0
        for _, _ in pairs(addonTable[v]) do stats[v] = stats[v] + 1 end
    end
    return stats
end

local prepare_talent_tree = function (class)
    -- keep only player class tree
    addonTable.talent_tree = addonTable.talent_tree[class]
end

local prepare_codes = function (name, race, class, is_male)
    -- print("preparing codes for: " .. name .. " / " .. race .. " / " .. class .. " / " .. (is_male and "male" or "famale"))
    local at = addonTable
    local sex = is_male and 1 or 2
    local cases = { "н", "р", "д", "з", "о", "м", "к" }

    local codes = {
        ["{ім'я}"] = name,
        ["{Ім'я}"] = name,
        ["{ІМ'Я}"] = string.upper(name),
    }

    -- race

    for _, c in ipairs(cases) do
        local t = at.race[race][c][sex]
        codes["{раса:" .. c .. "}"] = t
        codes["{Раса:" .. c .. "}"] = common.capitalize(t)
        codes["{РАСА:" .. c .. "}"] = string.upper(t)
        if c == "н" then -- "н" is default grammatical case
            codes["{раса}"] = codes["{раса:н}"]
            codes["{Раса}"] = codes["{Раса:н}"]
            codes["{РАСА}"] = codes["{РАСА:н}"]
        end
    end

    -- class

    for _, c in ipairs(cases) do
        local t = at.class[class][c][sex]
        codes["{клас:" .. c .. "}"] = t
        codes["{Клас:" .. c .. "}"] = common.capitalize(t)
        codes["{КЛАС:" .. c .. "}"] = string.upper(t)
        if c == "н" then -- "н" is default grammatical case
            codes["{клас}"] = codes["{клас:н}"]
            codes["{Клас}"] = codes["{Клас:н}"]
            codes["{КЛАС}"] = codes["{КЛАС:н}"]
        end
    end

    -- sex

    -- only "стать" is needed, but we make possible to use any letter casing
    -- (even if it has nothing to do with the letter case of the result, as text gets shown as is)
    codes["{стать:(.-):(.-)}"] = function (a, b) return is_male and a or b end
    codes["{Стать:(.-):(.-)}"] = function (a, b) return is_male and a or b end
    codes["{СТАТЬ:(.-):(.-)}"] = function (a, b) return is_male and a or b end

    -- common.print_table(codes, "codes")
    at.codes = codes
end

local prepare_zones = function ()
    local z = addonTable.zone

    -- known aliases
    z["Crossroads"] = z["The Crossroads"]
    z["Crusader's Outpost"] = z["Crusader Outpost"]
    z["Dabyrie's Farmstead"] = z["Dabyrie Farmstead"]
    z["Stormwind City"] = z["Stormwind"]
    z["Stranglethorn"] = z["Stranglethorn Vale"]

    -- known taxi points
    local known_taxi_points = {
        "Aerie Peak, The Hinterlands",
        "Astranaar, Ashenvale",
        "Auberdine, Darkshore",
        "Bloodvenom Post, Felwood",
        "Booty Bay, Stranglethorn",
        "Brackenwall Village, Dustwallow Marsh",
        "Camp Mojache, Feralas",
        "Camp Taurajo, The Barrens",
        "Cenarion Hold, Silithus",
        "Chillwind Camp, Western Plaguelands",
        "Crossroads, The Barrens",
        "Darkshire, Duskwood",
        "Everlook, Winterspring",
        "Feathermoon, Feralas",
        "Flame Crest, Burning Steppes",
        "Freewind Post, Thousand Needles",
        "Gadgetzan, Tanaris",
        "Grom'gol, Stranglethorn",
        "Hammerfall, Arathi",
        "Ironforge, Dun Morogh",
        "Kargath, Badlands",
        "Lakeshire, Redridge",
        "Light's Hope Chapel, Eastern Plaguelands",
        "Marshal's Refuge, Un'Goro Crater",
        "Menethil Harbor, Wetlands",
        "Moonglade",
        "Morgan's Vigil, Burning Steppes",
        "Nethergarde Keep, Blasted Lands",
        "Nijel's Point, Desolace",
        "Orgrimmar, Durotar",
        "Ratchet, The Barrens",
        "Refuge Pointe, Arathi",
        "Revantusk Village, The Hinterlands",
        "Rut'theran Village, Teldrassil",
        "Sentinel Hill, Westfall",
        "Shadowprey Village, Desolace",
        "Southshore, Hillsbrad",
        "Splintertree Post, Ashenvale",
        "Stonard, Swamp of Sorrows",
        "Stonetalon Peak, Stonetalon Mountains",
        "Stormwind, Elwynn",
        "Sun Rock Retreat, Stonetalon Mountains",
        "Talonbranch Glade, Felwood",
        "Talrendis Point, Azshara",
        "Tarren Mill, Hillsbrad",
        "Thalanaar, Feralas",
        "The Sepulcher, Silverpine Forest",
        "Thelsamar, Loch Modan",
        "Theramore, Dustwallow Marsh",
        "Thorium Point, Searing Gorge",
        "Thunder Bluff, Mulgore",
        "Undercity, Tirisfal",
        "Valormok, Azshara",
        "Zoram'gar Outpost, Ashenvale",
    }

    for _, v in ipairs(known_taxi_points) do
        local loc, zone = strsplit(",", v)
        if loc and zone then
            loc = strtrim(loc)
            zone = strtrim(zone)
            if z[loc] and z[zone] then
                z[v] = z[loc] .. ", " .. z[zone]
            else
                print("[!] ClassicUA: Failed to prepare taxi zone \"" .. v .. "\"")
            end
        end
    end
end

local addon_load = function (self)
    local s = get_stats()
    local v = GetAddOnMetadata("ClassicUA", "Version")
    print("|TInterface\\AddOns\\ClassicUA\\assets\\ua:0|t ClassicUA v" .. v .. " loaded: "
        .. s.quest_a + s.quest_h + s.quest_n .. " quests, "
        .. s.book .. " books, "
        .. s.item .. " items, "
        .. s.spell .. " spells, "
        .. s.npc .. " NPCs, "
        .. s.object .. " objects, "
        .. s.zone .. " zones"
    )
    self:UnregisterEvent("ADDON_LOADED")
end

local player_login = function (self)
    local name = UnitName("player")
    local guid = UnitGUID("player")
    local _, class = UnitClass("player")
    local _, race = UnitRace("player")
    local sex = UnitSex("player")
    local faction = UnitFactionGroup("player")

    -- print("PLAYER_LOGIN", name, race, class, sex, faction)
    prepare_talent_tree(class)
    quests.prepare_quests(faction == "Alliance")
    prepare_codes(name, race, class, sex == 2) -- 2 for male
    prepare_zones()
    zone_text.prepare_zone_text()
    world_map.prepare_world_map()
end

-- [[ events ]]

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

WorldMapContinentDropDownButton:HookScript("OnClick", world_map.world_map_dropdown_button_click)
WorldMapZoneDropDownButton:HookScript("OnClick", world_map.world_map_dropdown_button_click)

tooltips.register_tooltip_hooks()
quests.register_quests_hooks()

local event_frame = CreateFrame("frame")

event_frame:RegisterEvent("ADDON_LOADED")
event_frame:RegisterEvent("PLAYER_LOGIN")
event_frame:RegisterEvent("ITEM_TEXT_BEGIN")
event_frame:RegisterEvent("ITEM_TEXT_READY")
event_frame:RegisterEvent("ITEM_TEXT_CLOSED")
event_frame:RegisterEvent("ZONE_CHANGED")
event_frame:RegisterEvent("ZONE_CHANGED_INDOORS")
event_frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")

event_frame:SetScript("OnEvent", function (self, event, ...)
    if event == "ADDON_LOADED" then
        addon_load(self)
    elseif event == "PLAYER_LOGIN" then
        player_login(self)
    elseif event == "ITEM_TEXT_BEGIN" then
        if globals.tooltip_entry_type == "item" then
            globals.book_item_id = globals.tooltip_entry_id
        end
    elseif event == "ITEM_TEXT_READY" then
        books.show_book()
    elseif event == "ITEM_TEXT_CLOSED" then
        books.hide_book()
    elseif event == "ZONE_CHANGED"
        or event == "ZONE_CHANGED_INDOORS"
        or event == "ZONE_CHANGED_NEW_AREA" then
        zone_text.update_zone_text()
    end
end)
