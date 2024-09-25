-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------
-- Functions
local _G = getfenv(0)

-- Libraries
local assert, type, pairs, next = assert, type, pairs, next
local wipe = wipe
local table = table
local tinsert = table.insert
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local AtlasLoot = _G.AtlasLoot
local AL, GetAddOnInfo, GetAddOnEnableState = AtlasLoot.Locales, C_AddOns.GetAddOnInfo, function(a,b) return C_AddOns.GetAddOnEnableState(b,a) end

local LibStub = _G.LibStub
local LibDialog = LibStub("LibDialog-1.0")
local ALDB = LibStub("ALDB-1.0")

-- lua

-- WoW
-- DisableAddOn

local EventFrame = CreateFrame("FRAME")
EventFrame:RegisterEvent("ADDON_LOADED")

local function EventFrame_OnEvent(frame, event, arg1, ...)
	if event == "ADDON_LOADED" and arg1 and AtlasLoot.Init[arg1] then
		AtlasLoot:OnInitialize()
		-- init all other things
		if AtlasLoot.Init then
			for i = 1, #AtlasLoot.Init[arg1] do
				local func = AtlasLoot.Init[arg1][i]
				if func and type(func) == "function" then
					func()
				end
			end
			AtlasLoot.Init[arg1] = nil
		end
		if not next(AtlasLoot.Init) then
			EventFrame:UnregisterEvent("ADDON_LOADED")
		end
	end
end
EventFrame:SetScript("OnEvent", EventFrame_OnEvent)

function AtlasLoot:Print(msg)
	print("|cff33ff99AtlasLoot|r: "..(msg or ""))
end

function AtlasLoot:OnInitialize()
	if not AtlasLootCharDB.__addonrevision then --or AtlasLootDB.__addonrevision < AtlasLoot.__addonrevision then
		wipe(AtlasLootCharDB)
		AtlasLootCharDB.__addonrevision = AtlasLoot.__addonrevision
	end

	self.db = ALDB:Register(AtlasLootCharDB, AtlasLootDB, AtlasLoot.AtlasLootDBDefaults)
	
	
	-- bindings
	BINDING_HEADER_ATLASLOOT = AL["AtlasLoot"]
	BINDING_NAME_ATLASLOOT_TOGGLE = AL["Toggle AtlasLoot"]
	
	
	local _, _, _, _, reason = GetAddOnInfo("AtlasLoot_Loader")
	if reason ~=  "MISSING" then 
		DisableAddOn("AtlasLoot_Loader") 

		LibDialog:Register("ATLASLOOT_LOADER_ADDON_ERROR", {
			text = AL["AtlasLoot_Loader_is_no_longer_in_use"],
			buttons = {
				{
					text = OKAY,
				},
			},
			width = 500,
			is_exclusive = true,
			show_while_dead = true,
			hide_on_escape = true,
		})
		LibDialog:Spawn("ATLASLOOT_LOADER_ADDON_ERROR")

	end
end

function AtlasLoot:AddInitFunc(func, module)
	assert(type(func) == "function", "'func' must be a function.")
	if not EventFrame:IsEventRegistered("ADDON_LOADED") then
		EventFrame:RegisterEvent("ADDON_LOADED")
	end
	module = module or "AtlasLoot"
	if not AtlasLoot.Init[module] then AtlasLoot.Init[module] = {} end
	AtlasLoot.Init[module][#AtlasLoot.Init[module]+1] = func
end

-- Only instance related module will be handled
ATLASLOOT_INSTANCE_MODULE_LIST = {}

-- A list of officiel AtlasLoot modules
ATLASLOOT_MODULE_LIST = {
	{
		addonName = "AtlasLoot_TheWarWithin",
		icon = "Interface\\ICONS\\inv_achievement_raidnerubian_queenansurek",
		name = EXPANSION_NAME10,
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_BattleforAzeroth",
		icon = "Interface\\ICONS\\Inv_ChampionsOfAzeroth",
		name = EXPANSION_NAME7,
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_Legion",
		icon = "Interface\\ICONS\\Achievements_Zone_BrokenShore",
		name = EXPANSION_NAME6,
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_WarlordsofDraenor",
		icon = "Interface\\ICONS\\Achievement_Zone_Draenor_01",
		name = EXPANSION_NAME5,
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_MistsofPandaria",
		icon = "Interface\\ICONS\\INV_Pet_Achievement_Pandaria",
		name = EXPANSION_NAME4,
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_Cataclysm",
		icon = "Interface\\ICONS\\Achievement_Zone_Cataclysm",
		name = EXPANSION_NAME3,
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_WrathoftheLichKing",
		icon = "Interface\\ICONS\\Achievement_Zone_Northrend_01",
		name = EXPANSION_NAME2,
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_BurningCrusade",
		icon = "Interface\\ICONS\\Achievement_Zone_Outland_01",
		name = EXPANSION_NAME1,
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_Classic",
		--icon = 1120721,
		icon = "Interface\\ICONS\\Achievement_Zone_EasternKingdoms_01",
		name = EXPANSION_NAME0,
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_Collections",
		name = AL["Collections"],
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_Crafting",
		name = AL["Crafting"],
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_Factions",
		name = AL["Factions"],
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_PvP",
		name = AL["PvP"],
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	{
		addonName = "AtlasLoot_WorldEvents",
		name = AL["World Events"],
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	--[[
	{
		addonName = "AtlasLoot_Achievements",
		name = AL["Achievements"],
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
	},
	--]]
}

function AtlasLoot:RegisterModules(expansion, moduleMeta)
	if (expansion) then
		tinsert(ATLASLOOT_INSTANCE_MODULE_LIST, expansion)
	end
	if (moduleMeta) then
		tinsert(ATLASLOOT_MODULE_LIST, moduleMeta)
	end
end

-- if auto-select is enabled, pre-load all instance modules to save the first-time AL frame's loading time
function AtlasLoot:PreLoadModules()
	local db = AtlasLoot.db.GUI

	local o_moduleName = db.selected[1] or "AtlasLoot_Classic"
	local o_dataID = db.selected[2] or 1
	local o_bossID = db.selected[3] or 1
	local o_diffID = db.selected[4] or 1
	local o_page = db.selected[5] or 0
	local moduleName, dataID

	for i = 1, #ATLASLOOT_INSTANCE_MODULE_LIST do
		local enabled = GetAddOnEnableState(UnitName("player"), ATLASLOOT_INSTANCE_MODULE_LIST[i])
		if (enabled > 0) then
			AtlasLoot.GUI.frame.moduleSelect:SetSelected(ATLASLOOT_INSTANCE_MODULE_LIST[i])
			AtlasLoot.GUI.ItemFrame:Refresh(true)
		end
	end

	db.selected[1] = o_moduleName
	db.selected[2] = o_dataID
	db.selected[3] = o_bossID
	db.selected[4] = o_diffID
	db.selected[5] = o_page
end

function AtlasLoot:AutoSelect()
	local db = AtlasLoot.db.GUI

	local wowMapID, _ = MapUtil.GetDisplayableMapForPlayer()
	local o_moduleName = db.selected[1]
	local o_dataID = db.selected[2]
	local o_bossID = db.selected[3]
	local o_diffID = db.selected[4]
	local o_page = db.selected[5]
	local moduleName, dataID
	local refresh = false

	for i = 1, #ATLASLOOT_INSTANCE_MODULE_LIST do
		local enabled = GetAddOnEnableState(UnitName("player"), ATLASLOOT_INSTANCE_MODULE_LIST[i])
		if (enabled > 0) then
			AtlasLoot.GUI.frame.moduleSelect:SetSelected(ATLASLOOT_INSTANCE_MODULE_LIST[i])
			local moduleData = AtlasLoot.ItemDB:Get(ATLASLOOT_INSTANCE_MODULE_LIST[i])
			for ka, va in pairs(moduleData) do
				if (type(va) == "table" and moduleData[ka].MapID and moduleData[ka].MapID == wowMapID) then
					moduleName = ATLASLOOT_INSTANCE_MODULE_LIST[i]
					dataID = ka
					refresh = true
					break
				end
			end
		end
		if (dataID) then break end
	end
	
	if (refresh and (o_moduleName ~= moduleName or o_dataID ~= dataID)) then
		AtlasLoot.GUI.frame.moduleSelect:SetSelected(moduleName)
		AtlasLoot.GUI.frame.subCatSelect:SetSelected(dataID)
		AtlasLoot.GUI.ItemFrame:Refresh(true)
	else
		AtlasLoot.GUI.frame.moduleSelect:SetSelected(o_moduleName)
		AtlasLoot.GUI.frame.subCatSelect:SetSelected(o_dataID)
		AtlasLoot.GUI.frame.boss:SetSelected(o_bossID)
		AtlasLoot.GUI.frame.difficulty:SetSelected(o_diffID)
		AtlasLoot.GUI.ItemFrame:Refresh(true)
	end
end

