-- -------------------------------- --
-- AUTOGENERATED FILE. DO NOT EDIT. --
-- -------------------------------- --

local _, addonTable = ...

local gossip = { -- [npc_id] = { [code1] = text1, [code2] = text2, ... }
}

if addonTable.gossip then
    for k, v in pairs(gossip) do
        if type(addonTable.gossip[k]) == "table" and type(v) == "table" then
            for vk, vv in pairs(v) do
                addonTable.gossip[k][vk] = vv
            end
        else
            addonTable.gossip[k] = v
        end
    end
else
    addonTable.gossip = gossip
end