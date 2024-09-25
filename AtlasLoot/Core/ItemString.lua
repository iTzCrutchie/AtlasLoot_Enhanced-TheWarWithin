local AtlasLoot = _G.AtlasLoot
local ItemString = {}
AtlasLoot.ItemString = ItemString

local BonusIDInfo = AtlasLoot.BonusIDInfo

local GetDetailedItemLevelInfo = GetDetailedItemLevelInfo

-- lua
local format = string.format
local tbl_concat = table.concat

local ITEM_FORMAT_STRING = "item:%d:0:0:0:0:0:0:0:0:0:0:0:0"
local ITEM_FORMAT_ALL_STRING = "item:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d:%s"
local ITEM_FORMAT_BONUS_STRING = "item:%d:::::::::::%s:%d:%s"
local ITEM_FORMAT_DIFF_STRING = "item:%d:::::::::::%s::"

local ITEM_LVL_BONUS = BonusIDInfo.GetBonusListLevelDelta()

local TITANFORGED_ADD = { 3442 }
local LEGION_MAX_UPGRADELVL = 255
local BFA_MAX_UPGRADELVL = 450
local TWW_MAX_UPGRADELVL = 636
local function GetPresetForTitanforged(baseLvl, maxLvl, extraBonus)
	baseLvl = baseLvl or maxLvl
	baseLvl = maxLvl - baseLvl
	local tab = {
		ITEM_LVL_BONUS[baseLvl] or nil
	}
	if extraBonus then
		for i = 1, #extraBonus do
			tab[#tab+1] = extraBonus[i]
		end
	end
	return tab
end

local GetScaledItem_Cache = {}
local function GetScaledItem(itemID, difficultyID, newLvl)
	local effectiveILvl, isPreview, baseILvl = GetDetailedItemLevelInfo(itemID)
	if not baseILvl then return end
	local cacheString = baseILvl..difficultyID..newLvl
	if not GetScaledItem_Cache[cacheString] then
		local difficultyBonusID, difficulty = BonusIDInfo.GetItemBonusIDByDiff(difficultyID)
		-- New effectiveILvl
		effectiveILvl, isPreview, baseILvl = GetDetailedItemLevelInfo(format( ITEM_FORMAT_BONUS_STRING, itemID, difficulty, #difficultyBonusID, difficultyBonusID[1] or ""))
		
		if effectiveILvl >= newLvl then
			GetScaledItem_Cache[cacheString] = difficultyBonusID
		else
			difficultyBonusID, difficulty = BonusIDInfo.GetItemBonusIDByDiff_Raw(difficultyID)

			GetScaledItem_Cache[cacheString] = difficulty == 0 and {} or difficultyBonusID
			
			if newLvl-effectiveILvl >= 15 then
				-- Titanforged
				GetScaledItem_Cache[cacheString][#GetScaledItem_Cache[cacheString] + 1] = 3442
			elseif newLvl-effectiveILvl > 0 then
				-- Warforged
				GetScaledItem_Cache[cacheString][#GetScaledItem_Cache[cacheString] + 1] = 3441
			end
			
			effectiveILvl = newLvl - baseILvl
			GetScaledItem_Cache[cacheString][#GetScaledItem_Cache[cacheString] + 1] = ITEM_LVL_BONUS[effectiveILvl] or 0
		end
	end

	return GetScaledItem_Cache[cacheString]
end

local C_ITEM_BONUS_PRESET = {
	["nil"] = {}
}
local ITEM_BONUS_PRESET = {
	["Scaling"] 			= { 3524 }, -- ...
	-- Dungeons
	["BSM"]					= { 3524, 518 },
	["ID"]					= { 3524, 519 },
	["Auch"]				= { 3524, 520 },
	["Skyreach"]				= { 3524, 521 },
	["Dungeon"]				= { 3524, 522 },
	["HCDungeon"]				= { 524 },
	["HCDungeonWarforged"]			= { 524, 448 },
	["MDungeon"]				= { 642 },
	["MDungeonWarforged"]			= { 642, 644 },
	-- ## Legion
	["LegionDungeon"]			= { 3524, 1826 },
	["LegionDungeonTitanforged"] 		= GetPresetForTitanforged(162, LEGION_MAX_UPGRADELVL, TITANFORGED_ADD),--{ 1826, 1522 },
	["LegionHCDungeon"]			= { 1726 },
	["LegionHCDungeonTitanforged"]		= GetPresetForTitanforged(162, LEGION_MAX_UPGRADELVL, TITANFORGED_ADD),--{ 1726, 1522 },
	["LegionMDungeon"] 			= { 1727 },
	["LegionMDungeonTitanforged"]		= GetPresetForTitanforged(162, LEGION_MAX_UPGRADELVL, TITANFORGED_ADD),--{ 1727, 1522 },
	["LegionMDungeon2"]			= { 3452 },
	["LegionMDungeon2Titanforged"]		= GetPresetForTitanforged(162, LEGION_MAX_UPGRADELVL, TITANFORGED_ADD),--{ 3452, 1522 },
	["LegionMaxItemLvl"] = function(itemID, difficultyID, baseLvl)
		return GetScaledItem(itemID, difficultyID, LEGION_MAX_UPGRADELVL)
	end,
	-- ## BFA
	["BfAMaxItemLvl"] = function(itemID, difficultyID, baseLvl)
		return GetScaledItem(itemID, difficultyID, BFA_MAX_UPGRADELVL)
	end,
	--["BfADungeon"]			= { 3524, 1826 },
	["BfADungeonTitanforged"] 		= GetPresetForTitanforged(300, BFA_MAX_UPGRADELVL, TITANFORGED_ADD),--{ 1826, 1522 },
	--["BfAHCDungeon"]			= { 1726 },
	["BfAHCDungeonTitanforged"]		= GetPresetForTitanforged(300, BFA_MAX_UPGRADELVL, TITANFORGED_ADD),--{ 1726, 1522 },
	--["BfAMDungeon"] 			= { 1727 },
	["BfAMDungeonTitanforged"]		= GetPresetForTitanforged(300, BFA_MAX_UPGRADELVL, TITANFORGED_ADD),--{ 1727, 1522 },
	--["BfAMDungeon2"]			= { 3452 },
	["BfAMDungeon2Titanforged"]		= GetPresetForTitanforged(300, BFA_MAX_UPGRADELVL, TITANFORGED_ADD),--{ 3452, 1522 },
	-- ## TWW
	["TWWMaxItemLvl"] = function(itemID, difficultyID, baseLvl)
		return GetScaledItem(itemID, difficultyID, TWW_MAX_UPGRADELVL)
	end,
	-- Raids
	["LFR"]					= { 451 },
	["SoOWarforged"]			= { 448 },
	["HeroicSoO"] 				= { 449 },
	["HeroicSoOWarforged"]			= { 449, 448 },
	["MythicSoO"] 				= { 450 },
	["MythicSoOWarforged"]			= { 450, 448 },
	["RaidWarforged"]			= { 560 },
	["HeroicRaid"] 				= { 566 },
	["HeroicRaidWarforged"]			= { 566, 561 },
	["MythicRaid"] 				= { 567 },
	["MythicRaidWarforged"]			= { 567, 562 },
	["LegionLFR"] 				= { 3379 },
	["LegionLFRTitanforged"] 		= { 1522, 3442 },
	["LegionRaid"]				= { 1807 },
	["LegionRaidTitanforged"]		= { 1522, 3442 },
	["LegionHeroicRaid"] 			= { 1805 },
	["LegionHeroicRaidTitanforged"] 	= { 1522, 3442 },
	["LegionMythicRaid"] 			= { 1806 },
	["LegionMythicRaidTitanforged"] 	= { 1522, 3442 },
	
	["LegionEmeraldNightmareTitanforged"] 	= { 1547, 3442 },
	["LegionNightholdTitanforged"] 		= { 1522, 3442 },
	
	["LegionMaxTitanforgedByBaseLvl"] = function(itemID, difficultyID, baseLvl)		-- set the baseLvl with "ItemBaseLvl = 000," in the Instance Table.
		if not baseLvl then return C_ITEM_BONUS_PRESET["nil"] end
		if not C_ITEM_BONUS_PRESET["LegionMaxTitanforgedByBaseLvl"..baseLvl] then
			C_ITEM_BONUS_PRESET["LegionMaxTitanforgedByBaseLvl"..baseLvl] = GetPresetForTitanforged(baseLvl, LEGION_MAX_UPGRADELVL, TITANFORGED_ADD) -- 3442 adds "Titanforged"
		end
		return C_ITEM_BONUS_PRESET["LegionMaxTitanforgedByBaseLvl"..baseLvl]
	end,
	
	-- Crafting
	["Stage1"]			= { 525 },
	["Stage2"]			= { 526 },
	["Stage3"]			= { 527 },
	["Stage4"]			= { 593 },
	["Stage5"]			= { 617 },
	["Stage6"]			= { 618 },
	["Stage2W"]			= { 558 },
	["Stage3W"]			= { 559 },
	["Stage4W"]			= { 594 },
	["Stage5W"]			= { 619 },
	["Stage6W"]			= { 620 },
	-- Heirloom
	["Stage2H"]			= { 582 },
	["Stage3H"]			= { 583 }
}

function ItemString.Create(itemID, extra)
	if extra then
		return format( ITEM_FORMAT_ALL_STRING,
			itemID,					-- itemID
			extra.enchant or 0,			-- extra.enchant
			extra.gem1 or 0,			-- extra.gem1
			extra.gem2 or 0,			-- extra.gem2
			extra.gem3 or 0,			-- extra.gem3
			extra.gem4 or 0,			-- extra.gem4
			extra.suffixID or 0,			-- extra.suffixID
			extra.uniqueID or 0,			-- extra.uniqueID
			extra.level or 0,			-- extra.level
			extra.upgradeId or 0,			-- extra.upgradeId
			extra.instanceDifficultyID or 0,	-- extra.instanceDifficultyID
			extra.bonus and #extra.bonus or 0,
			extra.bonus and tbl_concat(extra.bonus, ":") or ""
		)
	else
		return format( ITEM_FORMAT_STRING,
			itemID					-- itemID
		)
	end
end
--|cff0070dd|Hitem:151433::::::::110:581::1:1:3524:::|h[Thick Shellplate Shoulders]|h|r
function ItemString.AddBonus(itemID, bonus, difficultyID, baseLvl)
	bonus = bonus and (ITEM_BONUS_PRESET[bonus] or ITEM_BONUS_PRESET[bonus[1]]) or bonus
	if bonus and type(bonus) == "string" then print(bonus) elseif bonus and type(bonus) == "function" then bonus = bonus(itemID, difficultyID, baseLvl) end
	local difficulty
	if difficultyID then
		difficultyID, difficulty = BonusIDInfo.GetItemBonusIDByDiff(difficultyID)
		if bonus then
			--for i = 1,#bonus do
			--	difficultyID[#difficultyID+1] = bonus[i]
			--end
			difficultyID = bonus
		end
		bonus = difficultyID
	end
	return format( ITEM_FORMAT_BONUS_STRING,
			itemID,
			difficulty or 0,
			bonus and #bonus or 0,
			bonus and tbl_concat(bonus, ":") or ""
		) 
end

-- difficultyID = http://wow.gamepedia.com/DifficultyID
function ItemString.AddBonusByDifficultyID(itemID, difficultyID)
	if not itemID then return elseif not difficultyID then return ItemString.Create(itemID) end
	
	return format( ITEM_FORMAT_BONUS_STRING,
			itemID,
			1,
			BonusIDInfo.GetItemBonusIDByDiff(itemID, difficultyID) or 0
		) 
end

function AtlasLoot_ItemTest(...)
	print(GetItemInfo(ItemString.AddBonus(160678, {...})))
end
-- [1]="", 
-- [2]="", 
-- [3]="120", 
-- [4]="256", 
-- [5]="", 
-- [6]="5", 
-- [7]="4", 
-- [8]={ 
--   [1]="5125", - Aussehn
--   [2]="4802", - Sockel
--   [3]="1552", - ItemLvl + 80
--   [4]="4784" - Epic, Titanforged
-- }

function AltasLoot_PrintItemString(slot)
	itemString = GetInventoryItemLink("player",slot or INVSLOT_FEET)
	local _, itemID, enchantID, gemID1, gemID2, gemID3, gemID4, 
	suffixID, uniqueID, linkLevel, specializationID, upgradeTypeID, instanceDifficultyID, numBonusIDs = strsplit(":", itemString)
	local tempString, unknown1, unknown2, unknown3 = strmatch(itemString, "item:[-%d]-:[-%d]-:[-%d]-:[-%d]-:[-%d]-:[-%d]-:[-%d]-:[-%d]-:[-%d]-:[-%d]-:[-%d]-:[-%d]-:[-%d]-:([-:%d]+):([-%d]-):([-%d]-):([-%d]-)|")
	local bonusIDs, upgradeValue
	if upgradeTypeID and upgradeTypeID ~= "" then
		upgradeValue = tempString:match("[-:%d]+:([-%d]+)")
		bonusIDs = {strsplit(":", tempString:match("([-:%d]+):"))}
	else
		bonusIDs = {strsplit(":", tempString)}
	end
	return suffixID, uniqueID, linkLevel, specializationID, upgradeTypeID, instanceDifficultyID, numBonusIDs, bonusIDs
end
-- /run print(AtlasLoot.ItemString.AddBonusByDifficultyID(140914, 16))
-- /run print(GetItemInfo(AtlasLoot.ItemString.AddBonusByDifficultyID(140914, 16)))
