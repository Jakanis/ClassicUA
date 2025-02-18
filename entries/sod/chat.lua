-- -------------------------------- --
-- AUTOGENERATED FILE. DO NOT EDIT. --
-- -------------------------------- --

local _, addonTable = ...

local chat = { -- [npc_name_en] = { [1] = npc_name_uk (optional), [code1] = text1, [code2] = text2, ... }
["Alonso"] = { "Алонсо",
-- Come, squire, my moment of triumph is at hand!
["cesemymtofthisathd"] = [===[Ходімо, зброєносцю, на нас чекає мій тріумф!]===],
-- Huzzah! The great dragon is slain
["hhtegtdnissn"] = [===[Ура! Великого дракона вбито!]===],
-- Squire! I am in need of aid!
["seiiaminndofad"] = [===[Зброєносцю! Мені потрібна допомога!]===],
-- Show yourself, o' mighty dragon!!
["swyfoomydn"] = [===[Покажися, о могутній драконе!!!]===],
},
["Bashana Runetotem"] = {
-- Denizens of Kalimdor, the dread beast Aku'mai has been slain and Ashenvale has been cleansed of the blight of the Old Gods' influence. Feel the boon of Blackfathom, and bask in the warmth of the Earth Mother's gaze!
["dsofkrteddbtaumihsbnsnadaehsbncdoftebtofteodgsiefltebnofbmadbkintewhofteehmrssge"] = [===[Жителі Калімдору, жахливе чудовисько Аку'май було вбито, а Ясенеділ очищено від впливу Старих Богів. Відчуйте благословення Чорноводдя і зогрійтесь в теплі Матері-Землі!]===],
},
["High Tinker Mekkatorque"] = { "Верховний штукар Меккакруть",
-- Citizens of the great cities of both Gnomeregan and Ironforge, gather round and take heed! This mighty adventurer has done the impossible and ended the threat of Sicco Thermaplugg once and for all and has saved Dun Morogh from a fiery fate! Gather and be inspired, one and all!
["csoftegtcsofbhgnadiegrrdadtehdtsmyarhsdeteieadedtettofsotgoeadfraladhssddnmhfmaafyfegradbeidoeadal"] = [===[Мешканці великих міст Гномреґану та Залізогарту, збирайтеся та слухайте! Цей могутній шукач пригод зробив неможливе, раз і назавжди поклав край загрозі Сіко Термоштепселя й врятував Дун-Морог від страшної долі! Збирайтеся і надихайтеся, всі без винятку!]===],
},
["Nogg"] = {
-- Alright everyone listen up. Some stooge... uh, I mean "brave adventurer" brought me a whole huge pile of secret gnomish tech and once we finish applying our superior goblin ingenuity to it we are going to use it to BLOW SO MUCH STUFF UP. Gather 'round and let's party!
["ateelnupseseuhiimnbearbtmeaawehepeofstghthadoewefhagorsrgniytoitweaeggtoueittobwsomhsfupgrrdadltsspy"] = [===[Гаразд, слухайте сюди. Один найманець... гм, тобто "відважний шукач пригод" приніс мені цілу купу секретних технологій гномів, і коли ми додамо до них нашу неперевершену гоблінську винахідливість, ми використаємо їх, щоб ПІДІРВАТИ ВСІЛЯКІ ШТУКИ! Збирайтеся і нумо веселитися!]===],
},
}

if addonTable.chat then
    for k, v in pairs(chat) do
        if type(addonTable.chat[k]) == "table" and type(v) == "table" then
            for vk, vv in pairs(v) do
                addonTable.chat[k][vk] = vv
            end
        else
            addonTable.chat[k] = v
        end
    end
else
    addonTable.chat = chat
end
