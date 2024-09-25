-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------
-- Functions
local _G = getfenv(0)
local next, pairs = _G.next, _G.pairs

-- Libraries


-- WoW
local C_TransmogCollection_GetItemInfo, C_TransmogCollection_PlayerCanCollectSource, C_TransmogCollection_PlayerHasTransmogItemModifiedAppearance  = C_TransmogCollection.GetItemInfo, C_TransmogCollection.PlayerCanCollectSource, C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance 
local C_TransmogCollection_GetSourceInfo, C_TransmogCollection_PlayerHasTransmog = C_TransmogCollection.GetSourceInfo, C_TransmogCollection.PlayerHasTransmog
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local ALName, ALPrivate = ...

local AtlasLoot = _G.AtlasLoot
local Transmog = {}
AtlasLoot.Transmog = Transmog
 
local Proto = {}

 
 --appearanceID, sourceID = C_TransmogCollection.GetItemInfo(158321)
 --isInfoReady, canCollect = C_TransmogCollection.PlayerCanCollectSource(sourceID)
 
 --Event -> 
 -- "TRANSMOG_SOURCE_COLLECTABILITY_UPDATE" event , sourceID, canCollect
 
 
 -- /console missingTransmogSourceInItemTooltips 1
 --C_TransmogCollection.GetSourceInfo(sourceID)
 
--[[ C_TransmogCollection.PlayerCanCollectSource
	SearchSize 
	GetAppearanceSourceInfoForTransmog 
	IsSearchDBLoading 
	GetIllusions 
	CanSetFavoriteInCategory 
	HasFavorites 
	GetInspectSources 
	GetCategoryAppearances 
	GetOutfitSources 
	GetIsAppearanceFavorite 
	PlayerHasTransmogItemModifiedAppearance 
	DeleteOutfit 
	SetIsAppearanceFavorite 
	GetSourceIcon 
	IsSearchInProgress 
	IsSourceTypeFilterChecked 
	ClearNewAppearance 
	GetLatestAppearance 
	GetShowMissingSourceInItemTooltips 
	GetAppearanceCameraIDBySource 
	SetSearch 
	SetShowMissingSourceInItemTooltips 
	EndSearch 
	GetAppearanceSourceInfo 
	GetNumTransmogSources 
	SetAllSourceTypeFilters 
	GetSourceInfo 
	GetAppearanceSourceDrops 
	SetSourceTypeFilter 
	GetUncollectedShown 
	GetCollectedShown 
	SaveOutfit 
	GetAppearanceSources 
	SetCollectedShown 
	SetSearchAndFilterCategory 
	SearchProgress 
	ClearSearch 
	GetAllAppearanceSources 
	GetSourceRequiredHoliday 
	IsCategoryValidForItem 
	PlayerCanCollectSource 
	ModifyOutfit 
	GetOutfitName 
	GetAppearanceInfoBySource 
	GetOutfits 
	PlayerKnowsSource 
	UpdateUsableAppearances 
	SetUncollectedShown 
	GetCategoryInfo 
	GetItemInfo(itemID, [itemModID]/itemLink/itemName) = appearanceID, sourceID
	GetAppearanceCameraID 
	GetCategoryCollectedCount 
	GetCategoryTotal 
	PlayerHasTransmog 
	GetNumMaxOutfits 
	GetIllusionSourceInfo 
	IsNewAppearance 
	GetIllusionFallbackWeaponSource
]]


local TRANSMOG_UPDATE_EVENT = "TRANSMOG_SOURCE_COLLECTABILITY_UPDATE"	-- sourceID, canCollect

--[[
	nil 	cannot collect
	false	can collect, not collected
	true	can collect, collected
]]
function Proto:IsItemUnlocked(itemID, sourceID, callbackFunc, callbackArg)
	if not itemID and not sourceID then return end
	local appearanceID, isInfoReady, canCollect
	if itemID then
		appearanceID, sourceID = C_TransmogCollection_GetItemInfo(itemID)
	end
	if not sourceID then return end
	isInfoReady, canCollect = C_TransmogCollection_PlayerCanCollectSource(sourceID)
	
	if isInfoReady then	
		if canCollect then
			canCollect = C_TransmogCollection_PlayerHasTransmogItemModifiedAppearance(sourceID)
		else
			canCollect = nil
		end
		if callbackFunc then
			callbackFunc(callbackArg, canCollect)
		else
			return canCollect
		end
	else
		self:AddUnknownItem(sourceID, callbackFunc, callbackArg)
	end
end

function Proto:AddUnknownItem(sourceID, callbackFunc, callbackArg)
	if not next(self.itemList) then
		self.frame:RegisterEvent(TRANSMOG_UPDATE_EVENT)
	end	
	self.itemList[sourceID] = { callbackFunc, callbackArg }
end

function Proto:Clear()
	self.itemList = {}
	self.frame:UnregisterEvent(TRANSMOG_UPDATE_EVENT)
end

local function OnEvent(self, event, sourceID, canCollect)
	if sourceID and self.obj.itemList[sourceID] then
		self.obj:IsItemUnlocked(nil, sourceID, self.obj.itemList[sourceID][1], self.obj.itemList[sourceID][2])
		self.obj.itemList[sourceID] = nil
	end
	if not next(self.obj.itemList) then
		self:UnregisterEvent(TRANSMOG_UPDATE_EVENT)
	end
end


function Transmog:New()
	local tab = {}

	-- Add protos
	for k,v in pairs(Proto) do
		tab[k] = v
	end
	
	tab.itemList = {}
	
	
	tab.frame = CreateFrame("FRAME")
	tab.frame.obj = tab
	tab.frame:SetScript("OnEvent", OnEvent)
	
	return tab
end
