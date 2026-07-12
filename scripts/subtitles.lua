local _, addon_table = ...

local dev_log   = addon_table.use("dev_log") ---@class dev_log_class
local options   = addon_table.use("options") ---@class options_class
local subtitles = addon_table.use("subtitles") ---@class subtitles_class

local string_format = _G.string.format
local string_trim   = _G.string.trim
local C_CVar        = _G.C_CVar
local C_Map         = _G.C_Map
local C_Timer       = _G.C_Timer
local CreateFrame   = _G.CreateFrame
local GetTime       = _G.GetTime
local UnitLevel     = _G.UnitLevel
local UnitRace      = _G.UnitRace
local hooksecurefunc = _G.hooksecurefunc

-- context of the currently playing video, used to attribute subtitle lines in dev log:
-- movies (PLAY_MOVIE) have an id, in-engine cinematics (CINEMATIC_START) do not
local current = {
    mode = false, ---@type "movie"|"cinematic"|false
    movie_id = false, ---@type number|false
    order = 0,
}

local function translate_subtitle(message, sender)
    local data = addon_table.subtitle
    if not data then
        return
    end

    -- the client delivers subtitle lines with trailing whitespace, so entry keys are trimmed
    local message_key = string_trim(message)
    local text_uk

    -- movie lines are grouped by movie id and matched by subtitle order
    if current.mode == "movie" and data.movie then
        local movie = data.movie[current.movie_id]
        text_uk = movie and movie[current.order]
    end

    -- cinematics (and movie lines without an order match) use text keys
    if not text_uk and data.text then
        text_uk = data.text[message_key]
    end

    if not text_uk then
        if options.account.dev_mode then
            local context = "unknown"
            if current.mode == "movie" then
                context = "movie#" .. tostring(current.movie_id)
            elseif current.mode == "cinematic" then
                context = "cinematic"
            end
            dev_log.missing_subtitle(context, current.order, message_key, sender)
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

-- ---------------------------------------------------------------------------
-- race intro cinematics have no client subtitle data (narration is voice only,
-- text is sent as raid boss emotes on the very first login), so we render our
-- own subtitles from a per-race timed table
-- ---------------------------------------------------------------------------

local intro = {
    ticker = false,
    lines = false,
    started_at = 0,
    last_text = false,
}

local function intro_get_lines()
    local data = addon_table.subtitle
    local intro_data = data and data.intro
    if not intro_data then
        return
    end

    local _, race_file = UnitRace("player")
    local lines = intro_data[race_file]
    if not lines then
        return
    end

    -- race intros play for freshly created characters; the default level range
    -- also lets OpeningCinematic() replays work as a bonus (the client itself
    -- refuses to replay on higher levels). death knight intro will use 55+
    local level = UnitLevel("player")
    if level < (lines.level_min or 1) or level > (lines.level_max or 5) then
        return
    end

    -- race intros only ever play in the racial starting zone; the optional map
    -- guard keeps other in-engine cinematics from matching. on a brand new
    -- character the map may not be resolved yet (nil) or resolve only to the
    -- continent when the intro starts, so unknown maps and ancestors of the
    -- expected zone do not block
    local player_map = lines.map and C_Map.GetBestMapForUnit("player")
    if lines.map and player_map and lines.map ~= player_map then
        local map_info = C_Map.GetMapInfo(lines.map)
        while map_info and map_info.parentMapID and map_info.parentMapID > 0 do
            if map_info.parentMapID == player_map then
                return lines
            end
            map_info = C_Map.GetMapInfo(map_info.parentMapID)
        end
        return
    end

    return lines
end

-- shows the text through the default SubtitlesFrame, so our lines get the
-- original look: MovieSubtitleFont, auto-scaling, position and the subtitle
-- background type/opacity options from the game settings
local function intro_set_text(text)
    local frame = _G.SubtitlesFrame
    if not frame or not frame.AddSubtitle or not frame.HideSubtitles then
        return
    end

    frame:HideSubtitles()
    if text then
        frame:AddSubtitle(text)
    end
end

local function intro_update()
    local elapsed = GetTime() - intro.started_at
    local text

    for i = 1, #intro.lines do
        local line = intro.lines[i]
        if elapsed >= line[1] and elapsed < line[2] then
            text = line[3]
            break
        end
    end

    -- elapsed counter for subtitle timings calibration
    if options.account.dev_mode then
        local mark = "|cff88ccff" .. string_format("%.1f", elapsed) .. "|r"
        text = text and (mark .. " " .. text) or mark
    end

    if text ~= intro.last_text then
        intro.last_text = text
        intro_set_text(text)
    end
end

local function intro_start(lines)
    intro.lines = lines
    intro.started_at = GetTime()
    intro.last_text = false
    intro.ticker = C_Timer.NewTicker(0.1, intro_update)
end

local function intro_stop()
    if intro.ticker then
        intro.ticker:Cancel()
        intro.ticker = false
    end
    if intro.last_text then
        intro_set_text(nil)
        intro.last_text = false
    end
    intro.lines = false
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

    -- PLAY_MOVIE event does not fire when the movie is started directly
    -- (e.g. via MovieFrame_PlayMovie call), so the function is hooked too
    if _G.MovieFrame_PlayMovie then
        hooksecurefunc("MovieFrame_PlayMovie", function (_, movie_id)
            current.mode = "movie"
            current.movie_id = movie_id
            current.order = 0
        end)
    end

    event_frame:SetScript("OnEvent", function (_, event, ...)
        if event == "PLAY_MOVIE" then
            local movie_id = ...
            current.mode = "movie"
            current.movie_id = movie_id
            current.order = 0
        elseif event == "CINEMATIC_START" then
            local can_be_cancelled = ...
            current.mode = "cinematic"
            current.movie_id = false
            current.order = 0

            -- can_be_cancelled == false means a vehicle cinematic, never an intro;
            -- the movieSubtitle cvar is the game's own "show subtitles" setting
            if can_be_cancelled then
                local lines = C_CVar.GetCVarBool("movieSubtitle") and intro_get_lines()

                if options.account.dev_mode then
                    local _, race_file = UnitRace("player")
                    print("[ClassicUA] CINEMATIC_START:"
                        .. " race=" .. tostring(race_file)
                        .. " level=" .. tostring(UnitLevel("player"))
                        .. " map=" .. tostring(C_Map.GetBestMapForUnit("player"))
                        .. " subs_cvar=" .. tostring(C_CVar.GetCVarBool("movieSubtitle"))
                        .. " lines=" .. tostring(lines and #lines or nil))
                end

                if lines then
                    intro_start(lines)
                elseif options.account.dev_mode then
                    -- no data for this cinematic (or subtitles are disabled): show
                    -- just the elapsed counter, so subtitle timings can be measured
                    intro_start({})
                end
            end
        elseif event == "STOP_MOVIE" or event == "CINEMATIC_STOP" then
            current.mode = false
            current.movie_id = false
            current.order = 0
            intro_stop()
        elseif event == "SHOW_SUBTITLE" then
            current.order = current.order + 1
            translate_subtitle(...)
        end
    end)
end
