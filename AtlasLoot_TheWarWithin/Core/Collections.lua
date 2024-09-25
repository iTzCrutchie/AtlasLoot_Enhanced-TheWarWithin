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

-- change sortorder for factions
local ALLIANCE_DIFF, HORDE_DIFF
if UnitFactionGroup("player") == "Horde" then
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE)
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE)
else
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE)
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE)
end

local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")
local I_A_ITTYPE  = data:AddItemTableType("Item", "Achievement")
local PRICE_EXTRA_ITTYPE = data:AddExtraItemTableType("Price")
local QUEST_EXTRA_ITTYPE = data:AddExtraItemTableType("Quest")

local COLLECTION_CONTENT = data:AddContentType(AL["Collections"], ATLASLOOT_COLLECTION_COLOR)
--local FACTION_CONTENT = data:AddContentType(AL["Factions"], ATLASLOOT_FACTION_COLOR)
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

data["MOUNTS"] = {
	name = AL["Mounts"],
	ContentType = MOUNT_CONTENT,
	TableType = NORMAL_ITTYPE,
	items = {
		{
			name = "Delves",

			[NORMAL_DIFF] = {
				{ 1, 219391, "mount" }, -- Delver's Dirigible
				{ 2, 224415, "mount" }, -- Ivory Goliathus

			},
		},
		{
			name = "Dungeons",

			[NORMAL_DIFF] = {
				{ 1, 221765, "mount" }, -- Stonevault Mechsuit
				{ 2, 226357, "mount" }, -- Diamond Mechsuit
				{ 3, 225548, "mount" }, -- Wick's Lead
			}
		},
		{
			name = "Raids",

			[NORMAL_DIFF] = {
				{ 1, 224151, "mount" }, -- Ascendant Skyrazor
				{ 2, 224147, "mount" }, -- Sureki Skyrazor
			}
		},
		{
			name = "Rares",

			[NORMAL_DIFF] = {
				{ 1, 223270, "mount" }, -- Alunira
				{ 2, 223315, "mount" }, -- Beledar's Spawn
				{ 3, 223501, "mount" }, -- Regurgitated Mole Reins
			}
		},
		{
			name = "Renown",

			[NORMAL_DIFF] = {
				{ 1, 223505, "mount", [PRICE_EXTRA_ITTYPE] = "resonancecrystal:8125" }, -- Crimson Mudnose
				{ 2, 222989, "mount", [PRICE_EXTRA_ITTYPE] = "resonancecrystal:11375" }, -- Cyan Glowmite
				{ 3, 223317, "mount", [PRICE_EXTRA_ITTYPE] = "resonancecrystal:8125" }, -- Vermillion imperial Lynx
				{ 4, 223314, "mount", [PRICE_EXTRA_ITTYPE] = "resonancecrystal:11375" }, -- Shackled Shadow
				{ 5, 223571, "mount", [PRICE_EXTRA_ITTYPE] = "resonancecrystal:8125" }, -- Shale Ramolith
				{ 6, 221753, "mount", [PRICE_EXTRA_ITTYPE] = "resonancecrystal:11375" }, -- Smoldering Cinderbee
				{ 7, 223274, "mount", [PRICE_EXTRA_ITTYPE] = "kej:2815" }, -- Ferocious Jawcrawler
				{ 8, 223264, "mount", [PRICE_EXTRA_ITTYPE] = "kej:3940" }, -- Aquamarine Swarmite
				{ 9, 223278, "mount", [PRICE_EXTRA_ITTYPE] = "kej:2020" }, -- Heritage Undercrawler
				{ 10, 223279, "mount", [PRICE_EXTRA_ITTYPE] = "kej:2020" }, -- Royal Court Undercrawler
				{ 11, 223276, "mount", [PRICE_EXTRA_ITTYPE] = "kej:2020" }, -- Widow's Undercrawler
			},
		},
		{
			name = "PvP",

			[NORMAL_DIFF] = {
				{ 1, 223586, "mount" }, -- Fel Bat
				{ 2, 223158, "mount" }, -- Raging Cinderbee
			},
			[ALLIANCE_DIFF] = {
				{ 1, 223511, "mount" }, -- Vicious Skyflayer
			},
			[HORDE_DIFF] = {
				{ 1, 221813, "mount" }, -- Vicous Skyflayer
			},
		},
		{
			name = "Earthen Race Mounts",

			[NORMAL_DIFF] = {
				{ 1, 223572, "mount" }, -- Slatestone Ramolith
				{ 2, 453785}, -- Earthen Ordiant's Ramolith
			}
		},
		{
			name = "World Events",

			[NORMAL_DIFF] = {
				{ 1, 223318, "mount" }, -- Dauntless Imperial Lynx
				{ 2, 223286, "mount" }, -- Kah Legend of the Deep
				{ 3, 223269, "mount" }, -- Machine Defense Unit 1-11
			}
		},
		{
			name = "Pre-Patch",

			[ALLIANCE_DIFF] = {
				{ 1, 217985, "mount" }, -- Remembered Golden Gryphon
			},
			[HORDE_DIFF] = {
				{ 1, 217987, "mount" }, -- Remmebered Wind Rider
			},
		},
		{
			name = "In-Game Shop",

			[NORMAL_DIFF] = {
				{ 1, 219450, "mount" }, -- Charming Courier
				{ 2, 228751, "mount" }, -- Gigantic Grrloc
			}
		},
		{
			name = "Trading Post",

			[NORMAL_DIFF] = {
				{ 1, 226506, "mount" }, -- Hand of Reshkigaal
				{ 2, 226041, "mount" }, -- Keg Leg's Radiant Crocolisk
				{ 3, 226040, "mount" }, -- Plunderlord's Golden Crocolisk
				{ 4, 226042, "mount" }, -- Plunderlord's Midnight Crocolisk
				{ 5, 226044, "mount" }, -- Plunderlord's Weathered Crocolisk
			}
		},
	}
}

data["TABARDS"] = {
	name = AL["Tabards"],
	ContentType = COLLECTION_CONTENT,
	TableType = I_A_ITTYPE,
	items = {
		{ 
			name = AL["Tabards"],
			--CoinTexture = "Reputation",
			[ALLIANCE_DIFF] = {


			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,

			},
		},
	},
}

data["COMPANIONS"] = {
	name = COMPANIONS ,
	ContentType = COLLECTION_CONTENT,
	TableType = I_A_ITTYPE,
	items = {
		{ 
			name = COMPANIONS,
			--CoinTexture = "Reputation",
			[NORMAL_DIFF] = {

			},
		},
	},
}

data["TOYS"] = {
	name = TOY,
	ContentType = COLLECTION_CONTENT,
	TableType = I_A_ITTYPE,
	items = {
		{ 
			name = TOY,
			--CoinTexture = "Reputation",
			[NORMAL_DIFF] = {

			},
		},
	},
}

data["TIERSETS"] = {
	name = AL["Tier Sets"],
	ContentType = COLLECTION_CONTENT,
	items = {
		{ -- EVOKER
			name = ATLASLOOT_EVOKER_COLOR..ALIL["EVOKER"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- DEATHKNIGHT
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- DEMONHUNTER
			name = ATLASLOOT_DEMONHUNTER_COLOR..ALIL["DEMONHUNTER"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- DRUID
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- HUNTER
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- MAGE
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- MONK
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- PALADIN
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- PRIEST
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- ROGUE
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- SHAMAN
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- WARLOCK
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[NORMAL_DIFF] = {

			},
		},
		{ -- WARRIOR
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[NORMAL_DIFF] = {

			},
		},
	},
}
