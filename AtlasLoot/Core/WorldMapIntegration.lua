-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------
-- Functions
local _G = getfenv(0)
local pairs, select = _G.pairs, _G.select
-- Libraries

-- WoW
local GetAddOnInfo, GetAddOnEnableState, UnitName, GetRealmName = _G.GetAddOnInfo, _G.GetAddOnEnableState, _G.UnitName, _G.GetRealmName
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local ALName, ALPrivate = ...

local AtlasLoot = _G.AtlasLoot
local WorldMap = {}
AtlasLoot.WorldMap = WorldMap
local AL = AtlasLoot.Locales
local GetAlTooltip = AtlasLoot.Tooltip.GetTooltip
local profile

AtlasLootWorldMapButtonMixin = {}

function AtlasLootWorldMapButtonMixin:OnLoad()
	self:SetFrameStrata("HIGH")
end

function AtlasLootWorldMapButtonMixin:OnEnter()
	local tooltip = GetAlTooltip()
	tooltip:ClearLines()
	if owner and type(owner) == "table" then
		tooltip:SetOwner(owner[1], owner[2], owner[3], owner[4])
	else
		tooltip:SetOwner(self, "ANCHOR_RIGHT", -(self:GetWidth() * 0.5), 5)
	end
	tooltip:AddLine(AL["Click to open AtlasLoot window"])
	tooltip:Show()
end

function AtlasLootWorldMapButtonMixin:OnLeave()
	GetAlTooltip():Hide()
end

function AtlasLootWorldMapButtonMixin:OnClick()
	if (not AtlasLoot.GUI.frame:IsVisible()) then
		AtlasLoot.GUI.frame:Show()
	end
	ToggleFrame(WorldMapFrame)
end

function AtlasLootWorldMapButtonMixin:Refresh()
	
end


local function AdjustOtherWorldMapButton(adjust)
	profile = AtlasLoot.db.WorldMap
end

local function ButtonBinding()
	local KButtons = LibStub("Krowi_WorldMapButtons-1.4")
	WorldMap.button = KButtons:Add("AtlasLootWorldMapButtonTemplate", "BUTTON")
end

function WorldMap.Init()
	profile = AtlasLoot.db.WorldMap

	WorldMap.ToggleButtonOnChange()
end
AtlasLoot:AddInitFunc(WorldMap.Init)

function WorldMap.ToggleButtonOnChange()
	if (not WorldMap.button) then ButtonBinding() end

	if (profile.showbutton) then
		WorldMap.button:Show()
	else
		WorldMap.button:Hide()
	end
end

