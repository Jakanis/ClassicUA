local _, addonTable = ...

if not addonTable.M then
    addonTable.M = {}
end

addonTable.M.quests = {}
local M = addonTable.M.quests
local common = addonTable.M.common

-- [ quests ]

local quest_title_font = "Interface\\AddOns\\ClassicUA\\assets\\Morpheus_UA.ttf"
local quest_text_font = "Interface\\AddOns\\ClassicUA\\assets\\FRIZQT_UA.ttf"

local quest_frame = nil
local questlog_frame = nil


local get_quest_frame = function ()
    if quest_frame then
        return quest_frame
    end

    local width, height = QuestFrame:GetSize()
    local frame = CreateFrame("frame", nil, QuestFrame, "BackdropTemplate")
    frame:SetFrameStrata("HIGH")
    frame:SetSize(width - 64, height - 160)
    frame:SetPoint("TOP", 0, -72)
    frame:SetPoint("RIGHT", frame:GetWidth() - 37, 0)

    common.setup_frame_background_and_border(frame)

    common.setup_frame_scrollbar_and_content(frame, { -- todo: take quest font sizes from config
        title = { quest_title_font, 18 },
        text = { quest_text_font, 13 },
        more_title = { quest_title_font, 18 },
        more_text = { quest_text_font, 13 }
    })

    frame:Show()

    quest_frame = frame
    return quest_frame
end

-- frame must have properties: title, text, more_title, more_text
local set_quest_content = function (frame, title, text, more_title, more_text)
    local h = 16

    frame.title:SetPoint("TOPLEFT", frame.content, 12, -h)
    frame.title:SetText(title)
    h = h + frame.title:GetHeight() + 12

    if text then
        frame.text:SetPoint("TOPLEFT", frame.content, 12, -h)
        frame.text:SetText(text)
        h = h + frame.text:GetHeight() + 12
    else
        frame.text:SetText("")
    end

    if more_title and more_text then
        frame.more_title:SetPoint("TOPLEFT", frame.content, 12, -h)
        frame.more_title:SetText(more_title)
        h = h + frame.more_title:GetHeight() + 12

        frame.more_text:SetPoint("TOPLEFT", frame.content, 12, -h)
        frame.more_text:SetText(more_text)
        h = h + frame.more_text:GetHeight() + 12
    else
        frame.more_title:SetText("")
        frame.more_text:SetText("")
    end

    common.setup_frame_scrollbar_values(frame, h)
end

local get_questlog_frame = function ()
    if questlog_frame then
        return questlog_frame
    end

    local width, height = QuestLogFrame:GetSize()
    local frame = CreateFrame("frame", nil, QuestLogFrame, "BackdropTemplate")
    frame:SetFrameStrata("HIGH")
    frame:SetSize(width - 64, height - 234)
    frame:SetPoint("TOP", 0, -166)
    frame:SetPoint("RIGHT", frame:GetWidth() - 41, 0)

    common.setup_frame_background_and_border(frame)

    common.setup_frame_scrollbar_and_content(frame, { -- todo: take quest font sizes from config
        title = { quest_title_font, 18 },
        text = { quest_text_font, 13 },
        more_title = { quest_title_font, 18 },
        more_text = { quest_text_font, 13 }
    })

    frame:Show()

    questlog_frame = frame
    return questlog_frame
end



function M.prepare_quests(is_alliance)
    -- init faction quests reference
    addonTable.quest_f = is_alliance and addonTable.quest_a or addonTable.quest_h
    -- drop opposite faction quests
    addonTable[ is_alliance and "quest_h" or "quest_a" ] = nil
end

function M.register_quests_hooks()
    QuestFrameDetailPanel:HookScript("OnShow", function (event)
        local frame = get_quest_frame()
        local entry = common.get_entry("quest", GetQuestID())
        if entry then
            set_quest_content(frame, entry[1], entry[2], common.get_text("Quest Objectives"), entry[3])
            frame:Show()
        else
            frame:Hide()
        end
    end)
    
    QuestFrameDetailPanel:HookScript("OnHide", function (event)
        local frame = get_quest_frame()
        frame:Hide()
    end)
    
    QuestFrameProgressPanel:HookScript("OnShow", function (event)
        local frame = get_quest_frame()
        local entry = common.get_entry("quest", GetQuestID())
        if entry then
            set_quest_content(frame, entry[1], entry[4])
            frame:Show()
        else
            frame:Hide()
        end
    end)
    
    QuestFrameProgressPanel:HookScript("OnHide", function (event)
        local frame = get_quest_frame()
        frame:Hide()
    end)
    
    QuestFrameRewardPanel:HookScript("OnShow", function (event)
        local frame = get_quest_frame()
        local entry = common.get_entry("quest", GetQuestID())
        if entry then
            set_quest_content(frame, entry[1], entry[5])
            frame:Show()
        else
            frame:Hide()
        end
    end)
    
    QuestFrameRewardPanel:HookScript("OnHide", function (event)
        local frame = get_quest_frame()
        frame:Hide()
    end)

    hooksecurefunc("SelectQuestLogEntry", function ()
        if not addonTable.quest_f then -- need to test quest_f, as prepare_quests() might not be called just yet
            return
        end
    
        local frame = get_questlog_frame()
        local selection = GetQuestLogSelection()
        if selection > 0 then
            local id = select(8, GetQuestLogTitle(selection))
            local entry = common.get_entry("quest", id)
            if entry then
                set_quest_content(frame, entry[1], entry[3], common.get_text("Description"), entry[2])
                frame:Show()
            else
                frame:Hide()
            end
        else
            frame:Hide()
        end
    end)

end


return M
