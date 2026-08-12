-- OpenIt.lua
-- https://github.com/ticstyle/WoW-OpenIt

-- luacheck: globals OpenItDB CreateFrame UIParent C_Container C_Item C_TooltipInfo
-- luacheck: globals C_ToyBox C_QuestLog C_CurrencyInfo Settings InCombatLockdown
-- luacheck: globals IsShiftKeyDown GameTooltip GameTooltip_Hide SlashCmdList SLASH_OPENIT1
-- luacheck: globals Enum time pairs ipairs table math print _G ITEM_OPENABLE
-- luacheck: globals ITEM_SPELL_TRIGGER_ONUSE tonumber tostring ITEM_QUALITY_COLORS PlaySound SOUNDKIT type

local addonName, addon = ...
addon.frame = CreateFrame("Frame")

-- Local state variables
local currentItem = nil
local optionsCategory = nil

-- Default configuration structure
local defaultDB = {
	blacklist = {},
	snoozed = {},
	position = {},
	isLocked = false,
	buttonSize = 48,
	buttonAlpha = 1.0,
	minQuality = 0, -- Default: 0 (Poor / Junk)
}

-- Print helper for addon chat output
function addon.Print(_, msg)
	print("|cff9966ffOpenIt:|r " .. msg)
end

-------------------------------------------------------------------------------
-- Database Cleanup & Maintenance
-------------------------------------------------------------------------------

-- Remove expired 3-hour snooze timers on login to keep SavedVariables clean
local function PurgeExpiredSnoozes()
	if not OpenItDB or not OpenItDB.snoozed then
		return
	end
	local now = time()
	for itemID, expireTime in pairs(OpenItDB.snoozed) do
		if now >= expireTime then
			OpenItDB.snoozed[itemID] = nil
		end
	end
end

-------------------------------------------------------------------------------
-- Blacklist & State Helpers
-------------------------------------------------------------------------------

-- Check if an item is blacklisted (handles both string and numeric keys)
local function IsBlacklisted(itemID)
	if not OpenItDB or not OpenItDB.blacklist or not itemID then
		return false
	end
	local numID = tonumber(itemID)
	local strID = tostring(itemID)
	return (numID and OpenItDB.blacklist[numID]) or (strID and OpenItDB.blacklist[strID]) or false
end

-- Add an item to the user blacklist
local function AddToBlacklist(itemID)
	if not OpenItDB then
		return
	end
	OpenItDB.blacklist = OpenItDB.blacklist or {}
	local numID = tonumber(itemID)
	if numID then
		OpenItDB.blacklist[numID] = true
		OpenItDB.blacklist[tostring(numID)] = true
	end
end

-- Remove an item from the user blacklist
local function RemoveFromBlacklist(itemID)
	if not OpenItDB or not OpenItDB.blacklist then
		return
	end
	local numID = tonumber(itemID)
	if numID then
		OpenItDB.blacklist[numID] = nil
		OpenItDB.blacklist[tostring(numID)] = nil
	end
end

-- Strip color codes and escape sequences from tooltip text
local function CleanTooltipText(text)
	if not text then
		return ""
	end
	return text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|T.-|t", "")
end

-- Check RGB values for red requirement warning colors
local function IsRedColor(r, g, b)
	if type(r) == "table" then
		local c = r
		r, g, b = c.r, c.g, c.b
	end
	if not r or not g or not b then
		return false
	end

	-- Normalize 0-255 integer ranges if present
	if r > 1 or g > 1 or b > 1 then
		r = r / 255
		g = g / 255
		b = b / 255
	end

	return (r > 0.70 and g < 0.45 and b < 0.45)
end

-- Parse hex color codes in raw text strings for red requirement warnings
local function ContainsRedColorCode(text)
	if not text or text == "" then
		return false
	end
	for hex in text:gmatch("|c(%x%x%x%x%x%x%x%x)") do
		local r = tonumber(hex:sub(3, 4), 16) or 0
		local g = tonumber(hex:sub(5, 6), 16) or 0
		local b = tonumber(hex:sub(7, 8), 16) or 0
		if IsRedColor(r / 255, g / 255, b / 255) then
			return true
		end
	end
	return false
end

-------------------------------------------------------------------------------
-- Advanced Requirement & Reagent Validation
-------------------------------------------------------------------------------

local function HasUnmetRequirements(bag, slot, itemID, info)
	-- Check Cooldowns
	local _, duration = C_Container.GetContainerItemCooldown(bag, slot)
	if duration and duration > 1.5 then
		return true
	end

	-- Check Minimum Quality Threshold
	local quality = (info and info.quality) or select(3, C_Item.GetItemInfo(itemID))
	local minQuality = OpenItDB.minQuality or 0
	if quality and quality < minQuality then
		return true
	end

	-- Check Already Collected Toys
	if C_ToyBox and C_ToyBox.IsToyCollected and C_ToyBox.IsToyCollected(itemID) then
		return true
	end

	-- Check Quest Start Items (Completed or Active in Log)
	local questID = (C_Item and C_Item.GetItemQuestMetaData) and C_Item.GetItemQuestMetaData(itemID)
	if questID then
		if
			(C_QuestLog.IsQuestFlaggedCompleted and C_QuestLog.IsQuestFlaggedCompleted(questID))
			or (C_QuestLog.GetLogIndexForQuestID and C_QuestLog.GetLogIndexForQuestID(questID))
		then
			return true
		end
	end

	-- Tooltip Inspection
	if not C_TooltipInfo or not C_TooltipInfo.GetBagItem then
		return false
	end

	local tooltipData = C_TooltipInfo.GetBagItem(bag, slot)
	if not tooltipData or not tooltipData.lines or #tooltipData.lines == 0 then
		return false
	end

	local totalItemCount = (C_Item and C_Item.GetItemCount) and C_Item.GetItemCount(itemID)
		or (info and info.stackCount)
		or 1

	for _, lineData in ipairs(tooltipData.lines) do
		local left = lineData.leftText or ""
		local right = lineData.rightText or ""

		-- Direct line color check
		if lineData.leftColor and IsRedColor(lineData.leftColor) then
			return true
		end
		if lineData.rightColor and IsRedColor(lineData.rightColor) then
			return true
		end

		local lineTextAccumulator = left .. " " .. right

		-- Deep scan argument colors and string/numeric values inside component lists
		if lineData.args then
			for _, arg in ipairs(lineData.args) do
				if arg.color and IsRedColor(arg.color) then
					return true
				end
				if arg.stringVal then
					lineTextAccumulator = lineTextAccumulator .. " " .. tostring(arg.stringVal)
				elseif arg.intVal then
					lineTextAccumulator = lineTextAccumulator .. " " .. tostring(arg.intVal)
				elseif arg.floatVal then
					lineTextAccumulator = lineTextAccumulator .. " " .. tostring(arg.floatVal)
				end
			end
		end

		-- Currency Overcap Protection
		local currencyID = lineTextAccumulator:match("|Hcurrency:(%d+)")
		if currencyID then
			local cID = tonumber(currencyID)
			if cID and C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo then
				local cInfo = C_CurrencyInfo.GetCurrencyInfo(cID)
				if cInfo and cInfo.maxQuantity and cInfo.maxQuantity > 0 and (cInfo.quantity >= cInfo.maxQuantity) then
					return true
				end
			end
		end

		-- Red Color Warnings
		if ContainsRedColorCode(lineTextAccumulator) then
			return true
		end

		local cleanLine = CleanTooltipText(lineTextAccumulator)
		local lowerLine = cleanLine:lower()

		-- Check fraction progress counters (e.g. "0/1" or "10/15")
		for cur, maxVal in cleanLine:gmatch("(%d+)%s*/%s*(%d+)") do
			local numCur = tonumber(cur)
			local numMax = tonumber(maxVal)
			if numCur and numMax and numCur < numMax then
				return true
			end
		end

		-- Exclude standard stat/health/mana consumables and gear enchants
		if
			lowerLine:find("restores %d+ health")
			or lowerLine:find("restores %d+ mana")
			or lowerLine:find("must remain seated")
			or lowerLine:find("permanently enchant")
			or lowerLine:find("attaches an enchantment")
		then
			return true
		end

		-- Already Collected Mounts & Pets
		if
			lowerLine:find("already known")
			or lowerLine:find("already collected")
			or lowerLine:find("<already known>")
		then
			return true
		end

		-- Filter readable books/ledgers
		if lowerLine:find("right click to read") or lowerLine:find("<right click to read>") then
			return true
		end

		-- Compare required amounts in "Use:" text against total bag count
		if cleanLine:find("Use:") or cleanLine:find("Använda:") then
			for reqCount in cleanLine:gmatch("(%d+)") do
				local req = tonumber(reqCount)
				if req and req > 1 and req > totalItemCount then
					return true
				end
			end
		end
	end

	return false
end

-------------------------------------------------------------------------------
-- Fast Pre-Filter Logic
-------------------------------------------------------------------------------

local function FastCanBeOpenable(itemID, info)
	-- Instant lookup for known openable items
	if addon.knownItems and addon.knownItems[itemID] then
		return true
	end

	-- Engine container loot flag
	if info and info.hasLoot then
		return true
	end

	-- Filter out equippable gear, armor, weapons, and gems
	local classID = select(12, C_Item.GetItemInfo(itemID))
	if classID then
		if
			classID == Enum.ItemClass.Armor
			or classID == Enum.ItemClass.Weapon
			or classID == Enum.ItemClass.Recipe
			or classID == Enum.ItemClass.Gem
		then
			return false
		end
	end

	return true
end

-------------------------------------------------------------------------------
-- Item Detection Core Logic
-------------------------------------------------------------------------------

-- Determine if an item in bags can be opened or used as a container
local function IsItemOpenable(bag, slot, info)
	if not info or not info.itemID then
		return false
	end

	local itemID = tonumber(info.itemID)
	if not itemID then
		return false
	end

	-- Fast Check 1: Skip permanently/hardcoded blacklisted items (Data/Blacklist.lua)
	if addon.hardcodedBlacklist and addon.hardcodedBlacklist[itemID] then
		return false
	end

	-- Fast Check 2: Skip user-blacklisted items
	if IsBlacklisted(itemID) then
		return false
	end

	-- Fast Check 3: Skip snoozed items until timer expires
	local snoozeUntil = OpenItDB.snoozed[itemID]
	if snoozeUntil then
		if time() < snoozeUntil then
			return false
		else
			OpenItDB.snoozed[itemID] = nil
		end
	end

	-- Fast Check 4: Never trigger on equippable gear with "Use:" effects
	if C_Item.IsEquippableItem(itemID) then
		return false
	end

	-- Pre-filter non-usable item classes
	if not FastCanBeOpenable(itemID, info) then
		return false
	end

	-- Reject items failing smart requirement checks
	if HasUnmetRequirements(bag, slot, itemID, info) then
		return false
	end

	-- Tooltip inspection for container/loot/knowledge triggers
	if C_TooltipInfo and C_TooltipInfo.GetBagItem then
		local tooltipData = C_TooltipInfo.GetBagItem(bag, slot)
		if tooltipData and tooltipData.lines then
			for _, lineData in ipairs(tooltipData.lines) do
				local text = lineData.leftText
				if text and text ~= "" then
					local cleanText = CleanTooltipText(text)
					local lowerText = cleanText:lower()

					-- Match standard engine openable strings
					if ITEM_OPENABLE and cleanText:find(ITEM_OPENABLE, 1, true) then
						return true
					end

					-- Match explicit green/formatted click triggers
					if lowerText:find("right click") or cleanText:find("<Right Click") then
						if
							lowerText:find("open")
							or lowerText:find("combine")
							or lowerText:find("assemble")
							or lowerText:find("use")
							or lowerText:find("extract")
							or lowerText:find("unwrap")
						then
							return true
						end
					end

					-- Match profession knowledge and reward triggers ("Use: Study to increase...")
					if cleanText:find("Use:") or cleanText:find("Använda:") then
						if
							lowerText:find("study to increase")
							or lowerText:find("knowledge")
							or lowerText:find("grant")
							or lowerText:find("receive")
							or lowerText:find("obtain")
							or lowerText:find("open")
							or lowerText:find("combine")
							or lowerText:find("assemble")
						then
							return true
						end
					end

					if ITEM_SPELL_TRIGGER_ONUSE and cleanText:find(ITEM_SPELL_TRIGGER_ONUSE, 1, true) then
						if lowerText:find("knowledge") or lowerText:find("study") then
							return true
						end
					end
				end
			end
		end
	end

	return false
end

-- Scan player inventory for the first openable item
function addon.ScanBags(_)
	for bag = 0, 5 do
		local numSlots = C_Container.GetContainerNumSlots(bag) or 0
		for slot = 1, numSlots do
			local info = C_Container.GetContainerItemInfo(bag, slot)
			if info and IsItemOpenable(bag, slot, info) then
				return {
					bag = bag,
					slot = slot,
					itemID = tonumber(info.itemID),
					icon = info.iconFileID,
					count = info.stackCount or 1,
					hyperlink = info.hyperlink,
				}
			end
		end
	end
	return nil
end

-------------------------------------------------------------------------------
-- Main Frame & Button Construction
-------------------------------------------------------------------------------

local button = CreateFrame("Button", "OpenItButton", UIParent, "SecureActionButtonTemplate, BackdropTemplate")
button:SetSize(48, 48)
button:SetMovable(true)
button:EnableMouse(true)
button:SetClampedToScreen(true)

-- Allow dragging and button release execution
button:RegisterForClicks("AnyUp", "AnyDown")
button:SetAttribute("useondown", false)
button:RegisterForDrag("LeftButton")
button:Hide()

-- Texture inset within frame border to prevent spilling
button.icon = button:CreateTexture(nil, "BACKGROUND")
button.icon:SetPoint("TOPLEFT", button, "TOPLEFT", 3, -3)
button.icon:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -3, 3)
button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)

-- Native hover highlight texture
button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
local highlight = button:GetHighlightTexture()
if highlight then
	highlight:SetPoint("TOPLEFT", button, "TOPLEFT", 3, -3)
	highlight:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -3, 3)
	highlight:SetBlendMode("ADD")
end

-- Native pushed down texture
button:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
local pushed = button:GetPushedTexture()
if pushed then
	pushed:SetPoint("TOPLEFT", button, "TOPLEFT", 3, -3)
	pushed:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -3, 3)
end

-- Stack count overlay
button.count = button:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
button.count:SetPoint("BOTTOMRIGHT", -2, 2)

-- Border backdrop styling
button:SetBackdrop({
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true,
	tileSize = 16,
	edgeSize = 12,
	insets = { left = 2, right = 2, top = 2, bottom = 2 },
})
button:SetBackdropBorderColor(0.6, 0.4, 1.0, 1)

-- Drag handling (Respects isLocked setting)
button:SetScript("OnDragStart", function(_)
	if not InCombatLockdown() and not OpenItDB.isLocked then
		button:StartMoving()
	end
end)

button:SetScript("OnDragStop", function(_)
	button:StopMovingOrSizing()
	local point, _, relativePoint, x, y = button:GetPoint()
	OpenItDB.position = {
		point = point,
		relativePoint = relativePoint,
		x = x,
		y = y,
	}
end)

-- Refresh tooltip live when hovering or when bag contents change
local function RefreshTooltip(self)
	if not self:IsMouseOver() then
		return
	end

	if currentItem then
		GameTooltip:SetOwner(self, "ANCHOR_TOP")
		GameTooltip:SetBagItem(currentItem.bag, currentItem.slot)
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("|cff00ff00Left-Click:|r Open / Use item", 1, 1, 1)
		GameTooltip:AddLine("|cffffcc00Right-Click:|r Snooze for 3 hours", 1, 1, 1)
		GameTooltip:AddLine("|cffff3333Shift + Right-Click:|r Blacklist item", 1, 1, 1)
		if not OpenItDB.isLocked then
			GameTooltip:AddLine("|cff888888Drag to move button|r", 0.7, 0.7, 0.7)
		end
		GameTooltip:AddLine("Item ID: " .. currentItem.itemID, 0.5, 0.5, 0.5)
		GameTooltip:Show()
	else
		GameTooltip_Hide()
	end
end

-- Handle Right-Click (Snooze) and Shift + Right-Click (Blacklist)
button:SetScript("PreClick", function(_, btn)
	if btn ~= "RightButton" or not currentItem then
		return
	end

	local itemID = tonumber(currentItem.itemID)
	if not itemID then
		return
	end

	local itemName = C_Item.GetItemInfo(itemID) or currentItem.hyperlink or ("Item #" .. itemID)

	if IsShiftKeyDown() then
		AddToBlacklist(itemID)
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF or 857)
		addon:Print("Blacklisted " .. itemName .. " (ID: " .. itemID .. ")")
		if addon.optionsFrame and addon.optionsFrame.RefreshList and addon.optionsFrame:IsShown() then
			addon.optionsFrame:RefreshList()
		end
	else
		-- Snooze for 3 hours
		OpenItDB.snoozed[itemID] = time() + (3 * 3600)
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or 856)
		addon:Print("Snoozed " .. itemName .. " for 3 hours.")
	end

	addon:Update()
end)

-- Tooltip display handlers
button:SetScript("OnEnter", function(self)
	RefreshTooltip(self)
end)

button:SetScript("OnLeave", function()
	GameTooltip_Hide()
end)

-------------------------------------------------------------------------------
-- Addon Core Logic & Settings Application
-------------------------------------------------------------------------------

function addon.ApplyVisualSettings(_)
	local size = OpenItDB.buttonSize or 48
	local alpha = OpenItDB.buttonAlpha or 1.0

	button:SetSize(size, size)
	button:SetAlpha(alpha)
end

function addon.Update(_)
	if InCombatLockdown() then
		addon.pendingUpdate = true
		return
	end
	addon.pendingUpdate = false

	addon:ApplyVisualSettings()

	local item = addon:ScanBags()
	if item then
		currentItem = item
		button.icon:SetTexture(item.icon)

		if item.count > 1 then
			button.count:SetText(item.count)
			button.count:Show()
		else
			button.count:Hide()
		end

		-- Configure left-click macro action to use bag slot on release
		local macroCmd = "/use " .. item.bag .. " " .. item.slot
		button:SetAttribute("useondown", false)
		button:SetAttribute("type", "macro")
		button:SetAttribute("macrotext", macroCmd)
		button:SetAttribute("type1", "macro")
		button:SetAttribute("macrotext1", macroCmd)
		button:Show()
	else
		currentItem = nil
		button:Hide()
	end

	-- Force tooltip refresh if cursor is hovering over the button during update
	RefreshTooltip(button)
end

local function RestorePosition()
	if OpenItDB and OpenItDB.position and OpenItDB.position.x then
		local pos = OpenItDB.position
		button:ClearAllPoints()
		button:SetPoint(pos.point or "CENTER", UIParent, pos.relativePoint or "CENTER", pos.x, pos.y or 0)
	else
		-- Calculate default position: halfway to the left from screen center
		local defaultX = -(UIParent:GetWidth() / 4)
		button:ClearAllPoints()
		button:SetPoint("CENTER", UIParent, "CENTER", defaultX, 0)
	end
end

-------------------------------------------------------------------------------
-- Retail Options Panel Construction
-------------------------------------------------------------------------------

local function CreateOptionsPanel()
	local panel = CreateFrame("Frame", "OpenItOptionsPanel", UIParent)
	panel.name = "OpenIt"
	addon.optionsFrame = panel

	-- Title
	local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", 16, -16)
	title:SetText("OpenIt Settings")

	-- Lock Checkbox
	local lockCB = CreateFrame("CheckButton", "OpenItLockCheckbox", panel, "UICheckButtonTemplate")
	lockCB:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -12)
	lockCB.text = lockCB:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	lockCB.text:SetPoint("LEFT", lockCB, "RIGHT", 4, 0)
	lockCB.text:SetText("Lock button position")
	lockCB:SetScript("OnClick", function(cb)
		OpenItDB.isLocked = cb:GetChecked()
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or 856)
	end)

	-- Size Slider
	local sizeSlider = CreateFrame("Slider", "OpenItSizeSlider", panel, "OptionsSliderTemplate")
	sizeSlider:SetPoint("TOPLEFT", lockCB, "BOTTOMLEFT", 4, -24)
	sizeSlider:SetMinMaxValues(24, 96)
	sizeSlider:SetValueStep(2)
	if sizeSlider.SetObeyStepOnDrag then
		sizeSlider:SetObeyStepOnDrag(true)
	end
	_G[sizeSlider:GetName() .. "Text"]:SetText("Button Size")
	_G[sizeSlider:GetName() .. "Low"]:SetText("24")
	_G[sizeSlider:GetName() .. "High"]:SetText("96")

	sizeSlider.valText = sizeSlider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	sizeSlider.valText:SetPoint("TOP", sizeSlider, "BOTTOM", 0, -2)

	sizeSlider:SetScript("OnValueChanged", function(_, value)
		value = math.floor(value)
		OpenItDB.buttonSize = value
		sizeSlider.valText:SetText(value .. " px")
		addon:ApplyVisualSettings()
	end)

	-- Opacity Slider
	local opacitySlider = CreateFrame("Slider", "OpenItOpacitySlider", panel, "OptionsSliderTemplate")
	opacitySlider:SetPoint("LEFT", sizeSlider, "RIGHT", 40, 0)
	opacitySlider:SetMinMaxValues(0.1, 1.0)
	opacitySlider:SetValueStep(0.05)
	if opacitySlider.SetObeyStepOnDrag then
		opacitySlider:SetObeyStepOnDrag(true)
	end
	_G[opacitySlider:GetName() .. "Text"]:SetText("Opacity")
	_G[opacitySlider:GetName() .. "Low"]:SetText("10%")
	_G[opacitySlider:GetName() .. "High"]:SetText("100%")

	opacitySlider.valText = opacitySlider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	opacitySlider.valText:SetPoint("TOP", opacitySlider, "BOTTOM", 0, -2)

	opacitySlider:SetScript("OnValueChanged", function(_, value)
		value = math.floor(value * 100 + 0.5) / 100
		OpenItDB.buttonAlpha = value
		opacitySlider.valText:SetText(math.floor(value * 100) .. "%")
		addon:ApplyVisualSettings()
	end)

	-- Minimum Quality Slider
	local qualityNames = { [0] = "Junk", [1] = "Common", [2] = "Uncommon", [3] = "Rare", [4] = "Epic" }
	local qualitySlider = CreateFrame("Slider", "OpenItQualitySlider", panel, "OptionsSliderTemplate")
	qualitySlider:SetPoint("TOPLEFT", sizeSlider, "BOTTOMLEFT", 0, -28)
	qualitySlider:SetMinMaxValues(0, 4)
	qualitySlider:SetValueStep(1)
	if qualitySlider.SetObeyStepOnDrag then
		qualitySlider:SetObeyStepOnDrag(true)
	end
	_G[qualitySlider:GetName() .. "Text"]:SetText("Minimum Item Quality")
	_G[qualitySlider:GetName() .. "Low"]:SetText("Junk")
	_G[qualitySlider:GetName() .. "High"]:SetText("Epic")

	qualitySlider.valText = qualitySlider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	qualitySlider.valText:SetPoint("TOP", qualitySlider, "BOTTOM", 0, -2)

	qualitySlider:SetScript("OnValueChanged", function(_, value)
		value = math.floor(value)
		OpenItDB.minQuality = value
		qualitySlider.valText:SetText(qualityNames[value] or "Junk")
		addon:Update()
	end)

	-- Blacklist Section Title
	local blacklistTitle = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	blacklistTitle:SetPoint("TOPLEFT", qualitySlider, "BOTTOMLEFT", -4, -36)
	blacklistTitle:SetText("User Blacklisted Items")

	local desc = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	desc:SetPoint("TOPLEFT", blacklistTitle, "BOTTOMLEFT", 0, -4)
	desc:SetPoint("RIGHT", panel, "RIGHT", -16, 0)
	desc:SetJustifyH("LEFT")
	desc:SetText("Items blacklisted via Shift + Right-Click. Click the red X to remove an item from the blacklist.")

	-- Blacklist Scroll Frame
	local scrollFrame = CreateFrame("ScrollFrame", "OpenItOptionsScrollFrame", panel, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -12)
	scrollFrame:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -32, 16)

	local scrollChild = CreateFrame("Frame", "OpenItOptionsScrollChild", scrollFrame)
	scrollChild:SetSize(450, 1)
	scrollFrame:SetScrollChild(scrollChild)

	panel.rows = {}

	function panel.RefreshList(_)
		-- Sync form values
		lockCB:SetChecked(OpenItDB.isLocked or false)
		sizeSlider:SetValue(OpenItDB.buttonSize or 48)
		sizeSlider.valText:SetText((OpenItDB.buttonSize or 48) .. " px")

		opacitySlider:SetValue(OpenItDB.buttonAlpha or 1.0)
		opacitySlider.valText:SetText(math.floor((OpenItDB.buttonAlpha or 1.0) * 100) .. "%")

		qualitySlider:SetValue(OpenItDB.minQuality or 0)
		qualitySlider.valText:SetText(qualityNames[OpenItDB.minQuality or 0] or "Junk")

		-- Hide existing rows
		for _, row in ipairs(panel.rows) do
			row:Hide()
		end

		local blacklistedIDs = {}
		local seen = {}

		if OpenItDB and OpenItDB.blacklist then
			for itemID in pairs(OpenItDB.blacklist) do
				local numID = tonumber(itemID)

				-- Exclude items present in the permanent/hardcoded blacklist
				if numID and not seen[numID] and not (addon.hardcodedBlacklist and addon.hardcodedBlacklist[numID]) then
					seen[numID] = true
					table.insert(blacklistedIDs, numID)
				end
			end
		end

		-- Sort user blacklist alphabetically (A-Z) by item name
		table.sort(blacklistedIDs, function(a, b)
			local nameA = C_Item.GetItemInfo(a) or ("Item #" .. a)
			local nameB = C_Item.GetItemInfo(b) or ("Item #" .. b)
			return nameA:lower() < nameB:lower()
		end)

		if #blacklistedIDs == 0 then
			if not panel.emptyText then
				panel.emptyText = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontDisable")
				panel.emptyText:SetPoint("TOPLEFT", 10, -10)
				panel.emptyText:SetText("No blacklisted items.")
			end
			panel.emptyText:Show()
			scrollChild:SetHeight(40)
			return
		elseif panel.emptyText then
			panel.emptyText:Hide()
		end

		local rowHeight = 32
		local yOffset = 0

		for i, itemID in ipairs(blacklistedIDs) do
			local row = panel.rows[i]
			if not row then
				row = CreateFrame("Frame", nil, scrollChild)
				row:SetSize(430, rowHeight)

				row.icon = row:CreateTexture(nil, "ARTWORK")
				row.icon:SetSize(24, 24)
				row.icon:SetPoint("LEFT", 8, 0)

				row.deleteBtn = CreateFrame("Button", nil, row)
				row.deleteBtn:SetSize(24, 24)
				row.deleteBtn:SetPoint("RIGHT", row, "RIGHT", -8, 0)

				row.name = row:CreateFontString(nil, "ARTWORK", "GameFontNormal")
				row.name:SetPoint("LEFT", row.icon, "RIGHT", 8, 0)
				row.name:SetPoint("RIGHT", row.deleteBtn, "LEFT", -8, 0)
				row.name:SetJustifyH("LEFT")

				row.deleteBtn.text = row.deleteBtn:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
				row.deleteBtn.text:SetPoint("CENTER", 0, 0)
				row.deleteBtn.text:SetText("X")
				row.deleteBtn.text:SetTextColor(1, 0.2, 0.2)

				row.deleteBtn:SetScript("OnEnter", function(btn)
					btn.text:SetTextColor(1, 0.5, 0.5)
				end)
				row.deleteBtn:SetScript("OnLeave", function(btn)
					btn.text:SetTextColor(1, 0.2, 0.2)
				end)

				panel.rows[i] = row
			end

			row:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 0, -yOffset)
			row:Show()

			local itemName, _, itemQuality, _, _, _, _, _, _, itemTexture = C_Item.GetItemInfo(itemID)
			row.icon:SetTexture(itemTexture or C_Item.GetItemIconByID(itemID) or 134400)

			if itemName then
				local displayName = itemName
				if itemQuality and ITEM_QUALITY_COLORS and ITEM_QUALITY_COLORS[itemQuality] then
					displayName = ITEM_QUALITY_COLORS[itemQuality].hex .. itemName .. "|r"
				end
				row.name:SetText(displayName .. " |cff888888(ID: " .. itemID .. ")|r")
			else
				row.name:SetText("Item #" .. itemID .. " |cff888888(ID: " .. itemID .. ")|r")
				C_Item.RequestLoadItemDataByID(itemID)
			end

			row.deleteBtn:SetScript("OnClick", function()
				RemoveFromBlacklist(itemID)
				PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF or 857)
				panel:RefreshList()
				addon:Update()
			end)

			yOffset = yOffset + rowHeight
		end

		scrollChild:SetHeight(math.max(yOffset, 40))
	end

	panel:SetScript("OnShow", function(_)
		panel:RefreshList()
	end)

	local category = Settings.RegisterCanvasLayoutCategory(panel, "OpenIt")
	Settings.RegisterAddOnCategory(category)
	optionsCategory = category
end

-------------------------------------------------------------------------------
-- Event Listeners & Slash Commands
-------------------------------------------------------------------------------

addon.frame:RegisterEvent("ADDON_LOADED")
addon.frame:RegisterEvent("BAG_UPDATE_DELAYED")
addon.frame:RegisterEvent("PLAYER_REGEN_ENABLED")

addon.frame:SetScript("OnEvent", function(_, event, arg1)
	if event == "ADDON_LOADED" and arg1 == addonName then
		if not OpenItDB then
			OpenItDB = {}
		end
		for k, v in pairs(defaultDB) do
			if OpenItDB[k] == nil then
				OpenItDB[k] = v
			end
		end

		PurgeExpiredSnoozes()
		RestorePosition()
		CreateOptionsPanel()
		addon:Update()
	elseif event == "BAG_UPDATE_DELAYED" then
		addon:Update()
	elseif event == "PLAYER_REGEN_ENABLED" then
		if addon.pendingUpdate then
			addon:Update()
		end
	end
end)

SLASH_OPENIT1 = "/openit"
SlashCmdList["OPENIT"] = function(msg)
	msg = msg and msg:lower():gsub("^%s*(.-)%s*$", "%1") or ""
	if msg == "reset" then
		local defaultX = -(UIParent:GetWidth() / 4)
		OpenItDB.position = { point = "CENTER", relativePoint = "CENTER", x = defaultX, y = 0 }
		RestorePosition()
		addon:Print("Position reset to default.")
	else
		if optionsCategory then
			Settings.OpenToCategory(optionsCategory:GetID())
		end
	end
end
