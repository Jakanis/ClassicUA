local _, addonTable = ...

if not addonTable.M then
    addonTable.M = {}
end

addonTable.M.common = {}
local M = addonTable.M.common


function M.setup_frame_background_and_border(frame)
    local texture = frame:CreateTexture(nil, "BACKGROUND")
    texture:SetTexture("Interface\\QuestFrame\\QuestBG")
    texture:SetTexCoord(0.0, 0.58, 0.0, 0.65)
    texture:SetPoint("TOPLEFT", 4, -8)
    texture:SetPoint("BOTTOMRIGHT", -4, 8)

    frame:SetBackdrop({
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 24
    })
end

function M.setup_frame_scrollbar_and_content(frame, areas)
    local scrollframe = CreateFrame("ScrollFrame", nil, frame)
    scrollframe:SetPoint("TOPLEFT", 8, -9)
    scrollframe:SetPoint("BOTTOMRIGHT", -8, 9)
    frame.scrollframe = scrollframe

    local content = CreateFrame("Frame", nil, scrollframe)
    content:SetSize(scrollframe:GetWidth() - 60, 0)
    scrollframe:SetScrollChild(content)
    frame.content = content

    for k, v in pairs(areas) do
        local a = content:CreateFontString(nil, "OVERLAY")
        a:SetWidth(frame:GetWidth() - 60)
        a:SetJustifyH("LEFT")
        a:SetJustifyV("TOP")
        a:SetTextColor(0, 0, 0)
        if type(v) == "table" and #v == 2 then
            a:SetFont(v[1], v[2])
        end
        frame[k] = a
    end

    local scrollbar = CreateFrame("Slider", nil, scrollframe, "UIPanelScrollBarTemplate")
    scrollbar:SetPoint("TOPLEFT", frame, "TOPRIGHT", -26, -27)
    scrollbar:SetPoint("BOTTOMLEFT", frame, "BOTTOMRIGHT", 0, 26)
    scrollbar:SetValueStep(40)
    scrollbar.scrollStep = 100
    scrollbar:SetValue(1)
    scrollbar:SetWidth(16)
    scrollbar:SetScript("OnValueChanged", function (self, value)
        self:GetParent():SetVerticalScroll(value)
    end)
    frame.scrollbar = scrollbar

    frame:EnableMouse(true)
    frame:EnableMouseWheel(true)
    frame:SetScript("OnMouseWheel", function(self, delta)
        local v = scrollbar:GetValue()
        scrollbar:SetValue(v - delta * self.scrollbar.scrollStep)
    end)
end

function M.setup_frame_scrollbar_values(frame, height)
    local delta = height - frame:GetHeight() + 24
    if delta > 0 then
        frame.scrollbar:SetMinMaxValues(1, delta)
    else
        frame.scrollbar:SetMinMaxValues(1, 1)
    end

    frame.scrollbar:SetValue(1)
    frame.content:SetSize(frame.content:GetWidth(), height)
end

function M.capitalize(text)
    local b1 = strbyte(text, 1)
    if b1 >= 208 and b1 <= 210 then -- this is utf8 character, 2 bytes long
        local b2 = strbyte(text, 2)
        if b1 == 209 and b2 == 148 then
            return 'Є' .. text:sub(3)
        elseif b1 == 209 and b2 == 150 then
            return 'І' .. text:sub(3)
        elseif b1 == 209 and b2 == 151 then
            return 'Ї' .. text:sub(3)
        elseif b1 == 210 and b2 == 145 then
            return 'Ґ' .. text:sub(3)
        else -- run out of special cases -- let default upper() handle it
            return text:sub(1, 2):upper() .. text:sub(3)
        end
    else
        return text:sub(1, 1):upper() .. text:sub(2)
    end
end

-- todo: add another loop to try different "'s", e.g. "XXX's" and "XXXs'" are considered to be equal
function M.get_entry_text(entry_key)
    local at = addonTable

    if entry_key then
        for i = 1, 2 do
            if i == 2 then
                -- if failed to find original entry_key, try one more time with/out starting "The "
                if entry_key:find("^The ") then
                    -- remove starting "The "
                    if #entry_key > 5 then
                        entry_key = entry_key:sub(5)
                    else
                        break
                    end
                else
                    -- add starting "The "
                    entry_key = "The " .. entry_key
                end
            end

            local object = at.object[entry_key]
            if object then
                return object
            end

            local zone = at.zone[entry_key]
            if zone then
                return zone
            end
        end
    end

    return false
end

function M.get_text(entry_key)
    local at = addonTable

    if entry_key and at.text[entry_key] then
        return at.text[entry_key]
    else
        return entry_key
    end
end

function M.get_entry(entry_type, entry_id)
    local at = addonTable

    if entry_type and entry_id then
        entry_id = tonumber(entry_id)

        if entry_type == "quest" then
            local quest = nil

            if at.quest_f[entry_id] then
                quest = at.quest_f[entry_id]
            elseif at.quest_n[entry_id] then
                quest = at.quest_n[entry_id]
            end

            if quest then
                return make_text_array(quest)
            end
        end

        if entry_type == "book" then
            local book = at.book[entry_id]
            if book then
                return make_text_array(book)
            end
        end

        if at[entry_type] and at[entry_type][entry_id] then
            local entry = at[entry_type][entry_id]

            if entry.ref and (entry_type == "spell" or entry_type == "item") then
                local entry_ref = at[entry_type][entry.ref]
                if entry_ref then
                    -- todo: maybe add caching of the result table
                    return copy_table(copy_table({}, entry_ref), entry)
                else
                    return copy_table({ entry_type .. "|cff999999#|r" .. entry_id .. "|cff999999=>|r" .. entry.ref }, entry)
                end
            end

            return entry
        end
    end

    return false
end


return M