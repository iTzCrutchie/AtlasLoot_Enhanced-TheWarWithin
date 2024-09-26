-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)
local select = _G.select
local string = _G.string
local format = string.format

-- WoW
local GetAchievementInfo = GetAchievementInfo
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...
local addonname = FOLDER_NAME
local AtlasLoot = _G.AtlasLoot
local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales
local data = private.data

local NORMAL_DIFF = data:AddDifficulty(AL["Normal"], "n", {
	Item = {
		item1bonus = "Scaling",
		addDifficultyBonus = true,
	},
}, 1)

local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")
local AC_ITTYPE = data:AddItemTableType("Achievement", "Item")

local PROFESSION_CONTENT = data:AddContentType(AL["Primary Professions"], ATLASLOOT_PRIMPROFESSION_COLOR)

-- 	------------------	--
--	Shared Loot Tables	--
--	------------------	--


-- 	------------------	--
--	Crafted Gear Tables	--
--	------------------	--

--[[
data["CraftedGear"] = {
    name = "Crafted Gear"
	ContentType = PROFESSION_CONTENT,
	TableType = MORMAL_ITTYPE,
	items = 
	{
		{ -- Profession
			EncounterJournalID = 1111,
			[NORMAL_RAID_DIFF] = {
			},
		},
	}
}
]]

data["CraftedGear"] = {
    name = "Crafted Gear",
	ContentType = PROFESSION_CONTENT,
	TableType = MORMAL_ITTYPE,
	items = 
	{
		{ -- Alchemy

            name = "Alchemy",

            [NORMAL_DIFF] = {

            }

		},
	}
}