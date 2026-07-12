local _, addon_table = ...

local dev_log   = addon_table.use("dev_log") ---@class dev_log_class
local options   = addon_table.use("options") ---@class options_class
local subtitles = addon_table.use("subtitles") ---@class subtitles_class

local string_format = _G.string.format
local CreateFrame   = _G.CreateFrame

-- context of the currently playing video, used to attribute subtitle lines in dev log:
-- movies (PLAY_MOVIE) have an id, in-engine cinematics (CINEMATIC_START) do not
local current = {
    mode = false, -- "movie" | "cinematic" | false
    movie_id = false,
    order = 0,
}

local function translate_subtitle(message, sender)
    local text_uk = addon_table.subtitle and addon_table.subtitle[message]

    if not text_uk then
        if options.account.dev_mode then
            local context = "unknown"
            if current.mode == "movie" then
                context = "movie#" .. tostring(current.movie_id)
            elseif current.mode == "cinematic" then
                context = "cinematic"
            end
            dev_log.missing_subtitle(context, current.order, message, sender)
        end
        return
    end

    -- the default UI (Blizzard_Subtitles) handles SHOW_SUBTITLE before us and puts
    -- the formatted text into one of the SubtitlesFrame.Subtitles font strings;
    -- we find that font string by its current text and replace the text
    local frame = _G.SubtitlesFrame
    if not frame or not frame.Subtitles then
        return
    end

    local body_en = sender and string_format(_G.SUBTITLE_FORMAT, sender, message) or message
    local body_uk = sender and string_format(_G.SUBTITLE_FORMAT, sender, text_uk) or text_uk

    for i = 1, #frame.Subtitles do
        local font_string = frame.Subtitles[i]
        if font_string:IsShown() and font_string:GetText() == body_en then
            font_string:SetText(body_uk)
            break
        end
    end
end

subtitles.prepare = function ()
    if not options.account.translate_subtitles then
        return
    end

    local event_frame = CreateFrame("Frame")
    event_frame:RegisterEvent("PLAY_MOVIE")
    event_frame:RegisterEvent("STOP_MOVIE")
    event_frame:RegisterEvent("CINEMATIC_START")
    event_frame:RegisterEvent("CINEMATIC_STOP")
    event_frame:RegisterEvent("SHOW_SUBTITLE")

    event_frame:SetScript("OnEvent", function (_, event, ...)
        if event == "PLAY_MOVIE" then
            local movie_id = ...
            current.mode = "movie"
            current.movie_id = movie_id
            current.order = 0
        elseif event == "CINEMATIC_START" then
            current.mode = "cinematic"
            current.movie_id = false
            current.order = 0
        elseif event == "STOP_MOVIE" or event == "CINEMATIC_STOP" then
            current.mode = false
            current.movie_id = false
            current.order = 0
        elseif event == "SHOW_SUBTITLE" then
            current.order = current.order + 1
            translate_subtitle(...)
        end
    end)
end
