local _, addonTable = ...

local settingsFrame = CreateFrame("FRAME", "ClassicUASettings");
settingsFrame.refresh = function (self) print("settings refresh") end;
settingsFrame.name = "ClassicUA";
InterfaceOptions_AddCategory(settingsFrame);

local settingsFrame = CreateFrame("FRAME", "ClassicUASettings1", settingsFrame);
settingsFrame.refresh = function (self) print("settings1 refresh") end;
settingsFrame.name = "ClassicUA1";
settingsFrame.parent = "ClassicUASettings"
InterfaceOptions_AddCategory(settingsFrame);

