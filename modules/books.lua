local _, addonTable = ...

if not addonTable.M then
    addonTable.M = {}
end

addonTable.M.books = {}
local M = addonTable.M.books

local common = addonTable.M.common

-- [[ books ]]

local book_item_id = false
local book_text_font = "Interface\\AddOns\\ClassicUA\\assets\\Morpheus_UA.ttf"

local book_frame = nil
local get_book_frame = function ()
    if book_frame then
        return book_frame
    end

    local width, height = ItemTextFrame:GetSize()
    local frame = CreateFrame("frame", nil, ItemTextFrame, "BackdropTemplate")
    frame:SetFrameStrata("HIGH")
    frame:SetSize(width - 64, height - 160)
    frame:SetPoint("TOP", 0, -72)
    frame:SetPoint("RIGHT", frame:GetWidth() - 37, 0)

    common.setup_frame_background_and_border(frame)

    common.setup_frame_scrollbar_and_content(frame, { -- todo: take book font size from config
        text = { book_text_font, 15 }
    })

    frame:Show()

    book_frame = frame
    return book_frame
end

local set_book_content = function (text)
    local f = get_book_frame()
    local h = 16

    f.text:SetPoint("TOPLEFT", f.content, 12, -h)
    f.text:SetText(text)
    h = h + f.text:GetHeight() + 12

    common.setup_frame_scrollbar_values(f, h)
end

local show_book = function (text)
    local book = get_entry("book", book_item_id)
    if book then
        local page = ItemTextGetPage()
        if not book[page] and book[1] then
            book[page] = book[1]
        end
        set_book_content(book[page])
        get_book_frame():Show()
    end
end

local hide_book = function ()
    get_book_frame():Hide()
    book_item_id = false
end

return M