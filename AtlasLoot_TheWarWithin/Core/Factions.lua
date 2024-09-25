-- $Id: Collections.lua 27 2022-12-28 13:29:53Z arithmandar $
-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)
local select = _G.select
local string = _G.string
local format = string.format

-- WoW

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local _, private = ...
local AtlasLoot = _G.AtlasLoot
local data = private.data
local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales

local NORMAL_DIFF = data:AddDifficulty(AL["Normal"], "n", {
	Item = {
		item1bonus = "Scaling",
		addDifficultyBonus = true,
	},
}, 1)
local ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE, "alliance", nil, 1)
local HORDE_DIFF = data:AddDifficulty(FACTION_HORDE, "horde", nil, 1)

local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")
local I_A_ITTYPE  = data:AddItemTableType("Item", "Achievement")
local PRICE_EXTRA_ITTYPE = data:AddExtraItemTableType("Price")
local QUEST_EXTRA_ITTYPE = data:AddExtraItemTableType("Quest")

local COLLECTION_CONTENT = data:AddContentType(AL["Collections"], ATLASLOOT_COLLECTION_COLOR)
local FACTION_CONTENT = data:AddContentType(AL["Factions"], ATLASLOOT_FACTION_COLOR)
local MOUNT_CONTENT = data:AddContentType(AL["Mounts"], ATLASLOOT_COLLECTION_COLOR)

-- /////////////////////////////////
-- Faction
-- /////////////////////////////////
--[[
	-- rep info ("f1435rep3" = Unfriendly rep @ Shado-Pan Assault)
	1. Hated
	2. Hostile
	3. Unfriendly
	4. Neutral
	5. Friendly
	6. Honored
	7. Revered
	8. Exalted
	-- if rep index is in between 11 and 16, means it has friendship reputation
]]
--[[
data["DRAGONFACTIONS"] = {
	name = FACTION ,
	ContentType = FACTION_CONTENT,
	items = { 
		{ -- The Ascended
			FactionID = 2407,
			CoinTexture = "Reputation",
			[NORMAL_DIFF] = {
				{ 1, "f2407rep5" }, -- Friendly
				{ 2, 173051, }, -- Contract: The Ascended
				{ 3, 183098, [PRICE_EXTRA_ITTYPE] = "money:760" }, -- Technique: Codex of the Still Mind
				
				{ 5, "f2407rep6" }, -- Honored
				{ 6, 184756, [PRICE_EXTRA_ITTYPE] = "money:1816968" }, -- Smoothed Loop of Contemplation
				{ 7, 183094, [PRICE_EXTRA_ITTYPE] = "money:199500" }, -- Plans: Shadowsteel Helm
				
				{ 9, "f2407rep7" }, -- Revered
				{ 10, 183103, [PRICE_EXTRA_ITTYPE] = "money:17650000" }, -- Technique: Contract: The Ascended
				{ 11, 184732, [PRICE_EXTRA_ITTYPE] = "money:1556738" }, -- Manacles of Burden
				{ 12, 184734, [PRICE_EXTRA_ITTYPE] = "money:1567831" }, -- Bracers of Regret
				{ 13, 184735, [PRICE_EXTRA_ITTYPE] = "money:1573227" }, -- Wristclasps of Shame
				{ 14, 184733, [PRICE_EXTRA_ITTYPE] = "money:1562284" }, -- Wristclamps of Remorse
				
				{ 16, "f2407rep8" }, -- Exalted
				{ 17, 184351, [PRICE_EXTRA_ITTYPE] = "money:12500000" }, -- Illusion: Devoted Spirit
				{ 18, 183097, [PRICE_EXTRA_ITTYPE] = "money:38" }, -- Schematic: PHA7-YNX
				{ 19, 184729, [PRICE_EXTRA_ITTYPE] = "money:3091417" }, -- Masque of the Path
				{ 20, 184728, [PRICE_EXTRA_ITTYPE] = "money:3080285" }, -- Casque of the Path
				{ 21, 184730, [PRICE_EXTRA_ITTYPE] = "money:3102549" }, -- Cowl of the Path
				{ 22, 184731, [PRICE_EXTRA_ITTYPE] = "money:3113380" }, -- Gorget of the Path
				{ 23, 178991, [PRICE_EXTRA_ITTYPE] = "money:95000" }, -- Tabard of the Ascended
			},
		},
	}
}
]]
--[[
data["TWWFACTIONS"] = {
	name = EXPANSION_NAME10 ,
	ContentType = FACTION_CONTENT,
	items = { 

	}
}
]]
