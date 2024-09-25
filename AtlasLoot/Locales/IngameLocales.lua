local _G = getfenv(0)

local AtlasLoot = _G.AtlasLoot

-- lua
local GetMapInfo = C_Map.GetMapInfo
local rawget = rawget
local _, tmp1
local months = {
	MONTH_JANUARY,
	MONTH_FEBRUARY,
	MONTH_MARCH,
	MONTH_APRIL,
	MONTH_MAY,
	MONTH_JUNE,
	MONTH_JULY,
	MONTH_AUGUST,
	MONTH_SEPTEMBER,
	MONTH_OCTOBER,
	MONTH_NOVEMBER,
	MONTH_DECEMBER,
}

local GetAchievementInfo, UnitSex, GetFactionInfoByID = _G.GetAchievementInfo, _G.UnitSex, function(faction_id) return C_Reputation.GetFactionDataByID(faction_id).name end

local function GetSpecNameById(id)
	_, tmp1 = GetSpecializationInfoByID(id)
	return tmp1
end

local function GetAchievementName(id)
	_, tmp1 = GetAchievementInfo(id)
	return tmp1
end

local function GetBuildingName(id)
	_, tmp1 = C_Garrison.GetBuildingInfo(id)
	return tmp1
end

local function AtlasLoot_GetClassName(class)
	if (not LOCALIZED_CLASS_NAMES_MALE[class]) then
		return nil;
	end
	if (UnitSex("player") == "3") then
		return LOCALIZED_CLASS_NAMES_FEMALE[class];
	else
		return LOCALIZED_CLASS_NAMES_MALE[class];
	end
end

local IngameLocales = {
	-- ######################################################################
	-- Factions
	-- ######################################################################
	-- Legion
	["Bizmo's Brawlpub"] = GetFactionInfoByID(2011),
	["Brawl'gar Arena"] = GetFactionInfoByID(2010),
	-- Warlords of Draenor
--	["Bizmo's Brawlpub"] = GetFactionInfoByID(1691),
--	["Brawl'gar Arena"] = GetFactionInfoByID(1690),
	-- Mists of Pandaria
	["Nat Pagle"] = GetFactionInfoByID(1358),
	["Old Hillpaw"] = GetFactionInfoByID(1276),
	["Sho"] = GetFactionInfoByID(1278),
	["The August Celestials"] = GetFactionInfoByID(1341),

	-- ######################################################################
	-- Months
	-- ######################################################################
	["January"] = months[1],
	["February"] = months[2],
	["March"] = months[3],
	["April"] = months[4],
	["May"] = months[5],
	["June"] = months[6],
	["July"] = months[7],
	["August"] = months[8],
	["September"] = months[9],
	["October"] = months[10],
	["November"] = months[11],
	["December"] = months[12],

	-- ######################################################################
	-- Class Specs
	-- ######################################################################
	["Balance"] = GetSpecNameById(102),
	["Feral"] = GetSpecNameById(103),
	["Guardian"] = GetSpecNameById(104),
	["Restoration"] = GetSpecNameById(105),
	["Blood"] = GetSpecNameById(250),
	["Frost"] = GetSpecNameById(251),
	["Unholy"] = GetSpecNameById(252),
	["Brewmaster"] = GetSpecNameById(268),
	["Mistweaver"] = GetSpecNameById(270),
	["Windwalker"] = GetSpecNameById(269),
	["Discipline"] = GetSpecNameById(256),
	["Holy"] = GetSpecNameById(257),
	["Shadow"] = GetSpecNameById(258),
	["Protection"] = GetSpecNameById(66),
	["Retribution"] = GetSpecNameById(70),
	["Elemental"] = GetSpecNameById(262),
	["Enhancement"] = GetSpecNameById(263),
	["Arms"] = GetSpecNameById(71),
	["Fury"] = GetSpecNameById(72),

	-- ######################################################################
	-- Zones
	-- ######################################################################
	-- Classic
	["Ahn'Qiraj"] = GetMapInfo(319).name,
	["Blackrock Depths"] = GetMapInfo(242).name,
	["Blackwing Lair"] = GetMapInfo(287).name,
	["Lower Blackrock Spire"] = GetAchievementName(643),
	["Molten Core"] = GetMapInfo(232).name,
	["Orgrimmar"] = GetMapInfo(85).name,
	["Ruins of Ahn'Qiraj"] = GetMapInfo(247).name,
	["Shadowfang Keep"] = GetMapInfo(310).name,
	["Stormwind City"] = GetMapInfo(84).name,
	["Upper Blackrock Spire"] = GetAchievementName(1307),

	-- Burning Crusade
	["Black Temple"] = GetMapInfo(339).name,
	["Gruul's Lair"] = GetMapInfo(330).name,
	["Hyjal Summit"] = GetMapInfo(329).name,
	["Karazhan"] = GetMapInfo(350).name,
	["Magtheridon's Lair"] = GetMapInfo(331).name,
	["Outland"] = GetMapInfo(101).name,
	["Serpentshrine Cavern"] = GetMapInfo(332).name,
	["Shattrath City"] = GetMapInfo(111).name,
	["Sunwell Plateau"] = GetMapInfo(335).name,
	["Tempest Keep"] = GetMapInfo(334).name,
	["The Slave Pens"] = GetMapInfo(265).name,

	-- Wrath of the Lich King
	["Dalaran"] = GetMapInfo(125).name,
	["Icecrown"] = GetMapInfo(118).name,
	["Icecrown Citadel"] = GetMapInfo(186).name,
	["Naxxramas"] = GetMapInfo(162).name,
	["Northrend"] = GetMapInfo(113).name,
	["Onyxia's Lair"] = GetMapInfo(248).name,
	["The Eye of Eternity"] = GetMapInfo(141).name,
	["The Obsidian Sanctum"] = GetMapInfo(155).name,
	["The Ruby Sanctum"] = GetMapInfo(200).name,
	["Trial of the Crusader"] = GetMapInfo(172).name,
	["Ulduar"] = GetMapInfo(147).name,
	["Vault of Archavon"] = GetMapInfo(156).name,

	-- Cataclysm
	["Molten Front"] = GetMapInfo(338).name,

	-- Mists of Pandaria
	["Scarlet Monastery"] = GetMapInfo(435).name,
	["Timeless Isle"] = GetMapInfo(554).name,

	-- ######################################################################
	-- Garrison Buildings
	-- ######################################################################
	["DBWM"] = GetBuildingName(10),	-- Client autoselection
	["Enchanter's Study"] = GetBuildingName(126),
	["Engineering Works"] = GetBuildingName(124),
	["Fishing Shack"] = GetBuildingName(135),
	["GGGW"] = GetBuildingName(164),	-- Client autoselection
	["LIFT"] = GetBuildingName(36),	-- Client autoselection
	["Salvage Yard"] = GetBuildingName(141),
	["Stables"] = GetBuildingName(67),
	["The Tannery"] = GetBuildingName(122),
	
	-- data from Core/ItemInfo.lua is generated after loading

	-- ######################################################################
	-- Class
	-- ######################################################################
	["DEATHKNIGHT"]	= AtlasLoot_GetClassName("DEATHKNIGHT"),
	["DEMONHUNTER"]	= AtlasLoot_GetClassName("DEMONHUNTER"),
	["DRUID"] 	= AtlasLoot_GetClassName("DRUID"),
	["HUNTER"] 	= AtlasLoot_GetClassName("HUNTER"),
	["MAGE"] 	= AtlasLoot_GetClassName("MAGE"),
	["MONK"] 	= AtlasLoot_GetClassName("MONK"),
	["PALADIN"] 	= AtlasLoot_GetClassName("PALADIN"),
	["PRIEST"] 	= AtlasLoot_GetClassName("PRIEST"),
	["ROGUE"] 	= AtlasLoot_GetClassName("ROGUE"),
	["SHAMAN"] 	= AtlasLoot_GetClassName("SHAMAN"),
	["WARLOCK"] 	= AtlasLoot_GetClassName("WARLOCK"),
	["WARRIOR"] 	= AtlasLoot_GetClassName("WARRIOR"),
	["EVOKER"] 		= AtlasLoot_GetClassName("EVOKER"),
}
AtlasLoot.IngameLocales = IngameLocales

setmetatable(IngameLocales, { __index = function(tab, key) return rawget(tab, key) or key end } )
