-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)
local select, type = select, type
local string = _G.string
local format = string.format

-- WoW
local UnitFactionGroup = UnitFactionGroup
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local addonname = ...

local AtlasLoot = _G.AtlasLoot
local data, GetSpellInfo = AtlasLoot.ItemDB:Add(addonname), function(a) local v = C_Spell.GetSpellInfo(a); return v.name, nil, v.iconID; end

local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales

local RF_DIFF = data:AddDifficulty(AL["Raid Finder"], "rf", nil, 17)
local NORMAL_DIFF = data:AddDifficulty(AL["Normal"], "n", nil, 14)
local HEROIC_DIFF = data:AddDifficulty(AL["Heroic"], "h", nil, 15)
local P25_DIFF = data:AddDifficulty(AL["25 Player"], "p25", nil, 4)
local P25H_DIFF = data:AddDifficulty(AL["25 Player Heroic"], "p25h", nil, 6)
local MYTHIC_DIFF = data:AddDifficulty(AL["Mythic"], "m", nil, 16)

local LEGENDARY_DIFF = data:AddDifficulty(ITEM_QUALITY5_DESC)

local LEGION_DIFF = data:AddDifficulty(EXPANSION_NAME6)
local WOD_DIFF = data:AddDifficulty(EXPANSION_NAME5)
local MOP_DIFF = data:AddDifficulty(EXPANSION_NAME4)
local CATA_DIFF = data:AddDifficulty(EXPANSION_NAME3)
local WOTLK_DIFF = data:AddDifficulty(EXPANSION_NAME2)
local BC_DIFF = data:AddDifficulty(EXPANSION_NAME1)
local CLASSIC_DIFF = data:AddDifficulty(EXPANSION_NAME0)

local HORDE_DIFF, ALLIANCE_DIFF
if UnitFactionGroup("player") == "Horde" then
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE)
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE)
else
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE)
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE)
end

local NEUTRAL_DIFF = data:AddDifficulty(FACTION_STANDING_LABEL4)

local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")
local RAID_ITTYPE = data:AddItemTableType("Item", "Item") -- Normal, Thunder-/Warforged...
local SET_ITTYPE = data:AddItemTableType("Set", "Item") -- Normal, Thunder-/Warforged...
local I_A_ITTYPE  = data:AddItemTableType("Item", "Achievement")

local PRICE_EXTRA_ITTYPE = data:AddExtraItemTableType("Price")
local QUEST_EXTRA_ITTYPE = data:AddExtraItemTableType("Quest")

local COLLECTION_CONTENT = data:AddContentType(AL["Collections"], ATLASLOOT_COLLECTION_COLOR)

data["ARTIFACTS"] = {
	name = SPLASH_LEGION_BOX_FEATURE2_TITLE,
	ContentType = COLLECTION_CONTENT,
	items = {
		{
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[NORMAL_DIFF] = {
				{  1, 128292 },
				{  2, 128402 },
				{  3, 128403 },
				{  5, 140538, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  6, 140554, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  8, 136796, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 16, 139673, [PRICE_EXTRA_ITTYPE] = "money:5000000"  },
				{ 17, 139674, [PRICE_EXTRA_ITTYPE] = "money:5000000"  },
				{ 18, 139675, [PRICE_EXTRA_ITTYPE] = "money:5000000"  },
				{ 19, 139676, [PRICE_EXTRA_ITTYPE] = "money:5000000"  },
				{ 20, 139677, [PRICE_EXTRA_ITTYPE] = "money:5000000"  },
				{ 21, 139678, [PRICE_EXTRA_ITTYPE] = "money:5000000"  },
				{ 22, 139679, [PRICE_EXTRA_ITTYPE] = "money:5000000"  },
				{ 23, 139680, [PRICE_EXTRA_ITTYPE] = "money:5000000"  },
				{ 25, 140962, [PRICE_EXTRA_ITTYPE] = "orderresources:500" },
				{ 26, 140935, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140963, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
		{
			name = ATLASLOOT_DEMONHUNTER_COLOR..ALIL["DEMONHUNTER"],
			[NORMAL_DIFF] = {
				{  1, 127829 },
				{  2, 128832 },
				{  4, 140560, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{ 16, 139715, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 17, 139716, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 18, 139717, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 19, 139718, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 20, 139719, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 21, 139720, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 22, 139721, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 23, 139722, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 25, 140964, [PRICE_EXTRA_ITTYPE] = "orderresources:500" },
				{ 26, 140936, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140965, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
		{
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[NORMAL_DIFF] = {
				{  1, 128306 },
				{  2, 128821 },
				{  3, 128860 },
				{  4, 128858 },
				{  6, 140540, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  7, 140542, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  8, 140549, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{ 10, 136787, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 11, 136789, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 12, 136790, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 13, 136794, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 14, 136795, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 16, 139723, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 17, 139724, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 18, 139725, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 19, 139726, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 20, 139727, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 21, 139728, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 22, 139729, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 23, 139730, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 25, 140966, [PRICE_EXTRA_ITTYPE] = "orderresources:500" },
				{ 26, 140937, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140967, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
		{
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[NORMAL_DIFF] = {
				{  1, 128808 },
				{  2, 128826 },
				{  3, 128861 },
				{  5, 140539, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  6, 140544, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  7, 140548, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  9, 136780, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 10, 136781, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 11, 136855, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 16, 139707, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 17, 139708, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 18, 139709, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 19, 139710, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 20, 139711, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 21, 139712, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 22, 139713, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 23, 139714, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 25, 140968, [PRICE_EXTRA_ITTYPE] = "orderresources:500" },
				{ 26, 140938, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140969, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
		{
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[NORMAL_DIFF] = {
				{  1, 127857 },
				{  2, 128862 },
				{  3, 128820 },
				{  5, 140550, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{ 16, 139747, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 17, 139748, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 18, 139749, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 19, 139750, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 20, 139751, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 21, 139752, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 22, 139753, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 23, 139754, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 25, 140970, [PRICE_EXTRA_ITTYPE] = "orderresources:500"  },
				{ 26, 140939, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140971, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
		{
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[NORMAL_DIFF] = {
				{  1, 128940 },
				{  2, 128937 },
				{  3, 128938 },
				{  5, 140543, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  6, 140551, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  7, 140564, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  9, 136800, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 16, 139731, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 17, 139732, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 18, 139733, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 19, 139734, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 20, 139735, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 21, 139736, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 22, 139737, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 23, 139738, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 25, 140972, [PRICE_EXTRA_ITTYPE] = "orderresources:500"  },
				{ 26, 140940, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140973, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
		{
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[NORMAL_DIFF] = {
				{  1, 120978 },
				{  2, 128823 },
				{  3, 128866 },
				{  5, 140535, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  6, 140547, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  7, 140555, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  8, 140558, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{ 10, 136801, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 16, 139690, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 17, 139691, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 18, 139692, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 19, 139693, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 20, 139694, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 21, 139695, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 22, 139696, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 23, 139697, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 25, 140974, [PRICE_EXTRA_ITTYPE] = "orderresources:500"  },
				{ 26, 140941, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140975, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
		{
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[NORMAL_DIFF] = {
				{  1, 128825 },
				{  2, 128868 },
				{  3, 128827 },
				{  5, 140552, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{ 16, 139755, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 17, 139756, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 18, 139757, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 19, 139758, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 20, 139759, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 21, 139760, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 22, 139761, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 23, 139762, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 25, 140976, [PRICE_EXTRA_ITTYPE] = "orderresources:500" },
				{ 26, 140942, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140977, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
		{
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[NORMAL_DIFF] = {
				{  1, 128476 },
				{  2, 128870 },
				{  3, 128872 },
				{  5, 140541, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  6, 140556, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  8, 136803, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 16, 139739, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 17, 139740, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 18, 139741, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 19, 139742, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 20, 139743, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 21, 139744, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 22, 139745, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 23, 139746, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 25, 140978, [PRICE_EXTRA_ITTYPE] = "orderresources:500" },
				{ 26, 140943, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140979, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
		{
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[NORMAL_DIFF] = {
				{  1, 128935 },
				{  2, 128819 },
				{  3, 128911 },
				{  5, 140536, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  6, 140545, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  7, 140546, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  9, 136934, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 10, 136935, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 11, 136937, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 12, 136938, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 13, 138490, [PRICE_EXTRA_ITTYPE] = "money:500000" },
				{ 16, 139698, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 17, 139699, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 18, 139700, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 19, 139701, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 20, 139702, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 21, 139703, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 22, 139704, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 23, 139705, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 25, 140980, [PRICE_EXTRA_ITTYPE] = "orderresources:500" },
				{ 26, 140944, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140981, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
		{
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[NORMAL_DIFF] = {
				{  1, 128943 },
				{  2, 128941 },
				{  3, 128942 },
				{  5, 140553, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{ 16, 139763, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 17, 139764, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 18, 139765, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 19, 139766, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 20, 139767, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 21, 139768, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 22, 139769, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 23, 139770, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 25, 140982, [PRICE_EXTRA_ITTYPE] = "orderresources:500" },
				{ 26, 140945, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140983, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
		{
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[NORMAL_DIFF] = {
				{  1, 128289 },
				{  2, 128908 },
				{  3, 128910 },
				{  5, 140537, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  6, 140557, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{  7, 140559, [PRICE_EXTRA_ITTYPE] = "money:1000000" },
				{ 16, 139681, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 17, 139682, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 18, 139683, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 19, 139684, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 20, 139685, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 21, 139686, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 22, 139687, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 23, 139688, [PRICE_EXTRA_ITTYPE] = "money:5000000" },
				{ 25, 140984, [PRICE_EXTRA_ITTYPE] = "orderresources:500" },
				{ 26, 140946, [PRICE_EXTRA_ITTYPE] = "orderresources:2000" },
				{ 27, 140985, [PRICE_EXTRA_ITTYPE] = "orderresources:4000" },
			},
		},
	},
}

data["TIMEWALKINGEVENT"] = {
	name = AL["Timewalking Dungeon Event"],
	ContentType = COLLECTION_CONTENT,
	items = {
		--[[
		{-- Warlords of Draenor
			name = EXPANSION_NAME5,
			[NORMAL_DIFF] = {
			},
		},]]
		{-- Mists of Pandaria
			name = EXPANSION_NAME4,
			[NORMAL_DIFF] = {
				{ 1, 143953, "pet2017", [PRICE_EXTRA_ITTYPE] = "timewarped:2200" }, -- Infinite Hatchling, pet2017
				{ 2, 143954, "pet2018", [PRICE_EXTRA_ITTYPE] = "timewarped:2200" }, -- Infinite Hatchling, pet2018
				{ 4, 87775, "mount", [PRICE_EXTRA_ITTYPE] = "timewarped:5000" }, -- Yu'lei, Daughter of Jade, mount476
				{ 6, 144393, [PRICE_EXTRA_ITTYPE] = "timewarped:500" }, -- Portable Yak Wash
				{ 7, 144072, [PRICE_EXTRA_ITTYPE] = "timewarped:1000" }, -- Adopted Puppy Crate, toy
				{ 9, 143948, [PRICE_EXTRA_ITTYPE] = "timewarped:25" }, -- Chilled Satchel of Vegetables
				{ 10, 88995, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Shado-Pan Dragon Gun
				{ 12, 143935, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of The Klaxxi
				{ 13, 143936, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Shado-Pan
				{ 14, 143937, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Golden Lotus
				{ 15, 143938, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of The August Celestials
				{ 16, 143939, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Sunreaver Onslaught
				{ 17, 143940, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Kirin Tor Offensive
				{ 18, 143941, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of The Tillers
				{ 19, 143942, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Order of the Cloud Serpent
				{ 20, 143943, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Dominance Offensive
				{ 21, 143944, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of Operation: Shieldwall
				{ 22, 143945, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Shado-Pan Assault
				{ 23, 143946, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of The Anglers
				{ 24, 143947, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of Emperor Shaohao
				{ 26, 104228 },
				{ 28, "ac6927", 87769},
				{ 30, 143776 }, -- Shrouded Timewarped Coin
			},
		},
		{-- Cataclysm
			name = EXPANSION_NAME3,
			[NORMAL_DIFF] = {
				{ 1, 133511, [PRICE_EXTRA_ITTYPE] = "timewarped:1500" }, -- Gurboggle's Gleaming Bauble
				{ 3, 67414, [PRICE_EXTRA_ITTYPE] = "timewarped:150" }, -- Bag of Shiny Things
				{ 5, 122338, [PRICE_EXTRA_ITTYPE] = "timewarped:750" }, -- Ancient Heirloom Armor Casing
				{ 6, 122340, [PRICE_EXTRA_ITTYPE] = "timewarped:1000" }, -- Timeworn Heirloom Armor Casing
				{ 8, 133160, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of Therazane
				{ 9, 133154, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Ramkahen
				{ 10, [ATLASLOOT_IT_HORDE] = 133150, [ATLASLOOT_IT_ALLIANCE] = 133151, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Wildhammer Clan / Commendation of the Dragonmaw Clan
				{ 16, 133542, [PRICE_EXTRA_ITTYPE] = "timewarped:3000" }, -- Tosselwrench's Mega-Accurate Simulation Viewfinder
				{ 18, [ATLASLOOT_IT_HORDE] = 133545, [ATLASLOOT_IT_ALLIANCE] = 49602, [PRICE_EXTRA_ITTYPE] = "timewarped:10" }, -- Earl Black Tea / "New!" Kaja'Cola
				{ 20, 122339, [PRICE_EXTRA_ITTYPE] = "timewarped:900" }, -- Ancient Heirloom Scabbard
				{ 21, 122341, [PRICE_EXTRA_ITTYPE] = "timewarped:1200" }, -- Timeworn Heirloom Scabbard
				{ 23, 133159, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of The Earthen Ring
				{ 24, 133152, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Guardians of Hyjal
			},
		},
		{-- Wrath of the Lich King
			name = EXPANSION_NAME2,
			[NORMAL_DIFF] = {
				{ 1, 129922, "mount", [PRICE_EXTRA_ITTYPE] = "timewarped:5000" }, -- Bridle of the Ironbound Wraithcharger
				{ 3, 129938, [PRICE_EXTRA_ITTYPE] = "timewarped:1500" }, -- Will of Northrend
				{ 5, 44113, [PRICE_EXTRA_ITTYPE] = "timewarped:25" }, -- Small Spice Bag
				{ 7, 122338, [PRICE_EXTRA_ITTYPE] = "timewarped:750" }, -- Ancient Heirloom Armor Casing
				{ 8, 122340, [PRICE_EXTRA_ITTYPE] = "timewarped:1000" }, -- Timeworn Heirloom Armor Casing
				{ 10, 129940, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Kirin Tor
				{ 11, 129941, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Ebon Blade
				{ 12, [ATLASLOOT_IT_HORDE] = 129954, [ATLASLOOT_IT_ALLIANCE] = 129955, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Alliance Vanguard / Commendation of the Horde Expedition
				{ 16, 129965, [PRICE_EXTRA_ITTYPE] = "timewarped:750" }, -- Grizzlesnout's Fang
				{ 18, 129952, [PRICE_EXTRA_ITTYPE] = "timewarped:2000" }, -- Hourglass of Eternity
				{ 20, 46007, [PRICE_EXTRA_ITTYPE] = "timewarped:150" }, -- Bag of Fishing Treasures
				{ 22, 122339, [PRICE_EXTRA_ITTYPE] = "timewarped:900" }, -- Ancient Heirloom Scabbard
				{ 23, 122341, [PRICE_EXTRA_ITTYPE] = "timewarped:1200" }, -- Timeworn Heirloom Scabbard
				{ 25, 129942, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Argent Crusade
				{ 26, 129943, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Sons of Hodir
				{ 27, 129944, [PRICE_EXTRA_ITTYPE] = "timewarped:50" }, -- Commendation of the Wyrmrest Accord

			},
		},
		{-- The Burning Crusade
			name = EXPANSION_NAME1,
			[NORMAL_DIFF] = {
				{ 1, 129923, "mount", [PRICE_EXTRA_ITTYPE] = "timewarped:5000", }, -- Reins of the Eclipse Dragonhawk
				-- Toy
				{ 3, 129929, [PRICE_EXTRA_ITTYPE] = "timewarped:500", }, -- Ever-Shifting Mirror
				{ 4, 129926, [PRICE_EXTRA_ITTYPE] = "timewarped:1250", }, -- Mark of the Ashtongue
				{ 5, 151184, [PRICE_EXTRA_ITTYPE] = "timewarped:500", }, -- Verdant Throwing Sphere
				{ 6, 151016, [PRICE_EXTRA_ITTYPE] = "timewarped:750", }, -- Fractured Necrolyte Skull
				-- Two Hands
				{ 8 , 129829, [PRICE_EXTRA_ITTYPE] = "timewarped:100", }, -- Staff of the Forest Lord
				{ 9 , 129827, [PRICE_EXTRA_ITTYPE] = "timewarped:100", }, -- The Blade of Harbingers
				{ 10, 129828, [PRICE_EXTRA_ITTYPE] = "timewarped:100", }, -- Staff of the Soul-Eater
				-- Ranged
				{ 12, 129845, [PRICE_EXTRA_ITTYPE] = "timewarped:100", }, -- Crossbow of Relentless Strikes
				-- One Hand
				{ 14, 129931, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- The Mutilator
				{ 15, 129861, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Sword of Unyielding Force
				{ 16, 129856, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Vanir's Fist of Brutality
				{ 17, 129858, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Gavel of Naaru Blessings
				{ 18, 129857, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Scryer's Blade of Focus
				-- Off Hand
				{ 20, 129839, [PRICE_EXTRA_ITTYPE] = "timewarped:35", }, -- Talisman of Kalecgos
				{ 21, 129846, [PRICE_EXTRA_ITTYPE] = "timewarped:35", }, -- Mazthoril Honor Shield
				{ 22, 129847, [PRICE_EXTRA_ITTYPE] = "timewarped:35", }, -- Azure-Shield of Coldarra
				-- Trinket
				{ 24, 129848, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Bloodlust Brooch
				{ 25, 129851, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Essence of the Martyr
				{ 26, 129849, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Gnomeregan Auto-Blocker 601
				{ 27, 129937, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Emblem of Fury
				{ 28, 129850, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Icon of the Silver Crescent
				-- Cloak
				{ 101, 129832, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Blood Knight War Cloak
				{ 102, 129833, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Shawl of Shifting Probabilities
				{ 103, 129831, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Dory's Embrace
				{ 104, 129830, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Farstrider Defender's Cloak
				{ 105, 129834, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Bishop's Cloak
				-- Head
				{ 107, 129837, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Cowl of Naaru Blessings
				{ 108, 129836, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Mask of the Deceiver
				{ 109, 129835, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Faceguard of Determination
				{ 110, 129838, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Storm Master's Helmet
				-- Legs
				{ 112, 129840, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Rushing Storm Kilt
				{ 113, 129842, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Legplates of Unending Fury
				{ 114, 129841, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Trousers of the Scryers' Retainer
				{ 115, 129843, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Corrupted Soulcloth Pantaloons
				-- Waist
				{ 116, 129854, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Girdle of Seething Rage
				{ 117, 129852, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Belt of the Silent Path
				{ 118, 129855, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Voodoo-Woven Belt
				{ 119, 129853, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Aftershock Waistguard

				{ 121, 122338, [PRICE_EXTRA_ITTYPE] = "timewarped:750", }, -- Ancient Heirloom Armor Casing
				{ 122, 122339, [PRICE_EXTRA_ITTYPE] = "timewarped:900", }, -- Ancient Heirloom Scabbard
				{ 123, 122340, [PRICE_EXTRA_ITTYPE] = "timewarped:1000", }, -- Timeworn Heirloom Armor Casing
				{ 124, 122341, [PRICE_EXTRA_ITTYPE] = "timewarped:1200", }, -- Timeworn Heirloom Scabbard
				{ 125, 151614, [PRICE_EXTRA_ITTYPE] = "timewarped:1000", }, -- Weathered Heirloom Armor Casing
				{ 126, 151615, [PRICE_EXTRA_ITTYPE] = "timewarped:1200", }, -- Weathered Heirloom Scabbard

				{ 201, [ATLASLOOT_IT_HORDE] = 129947, [ATLASLOOT_IT_ALLIANCE] = 129948, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Commendation of Thrallmar / Commendation of Thrallmar
				{ 202, 129945, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Commendation of The Consortium
				{ 203, 129946, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Commendation of The Sha'tar
				{ 204, 129949, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Commendation of the Cenarion Expedition
				{ 205, 129950, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Commendation of the Keepers of Time
				{ 206, 129951, [PRICE_EXTRA_ITTYPE] = "timewarped:50", }, -- Commendation of Lower City

				{ 216, 33844, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Barrel of Fish
				{ 217, 33857, [PRICE_EXTRA_ITTYPE] = "timewarped:25", }, -- Crate of Meat
				{ 218, 35348, [PRICE_EXTRA_ITTYPE] = "timewarped:150", }, -- Bag of Fishing Treasures
			},
		},
	},
}

data["APEXISCRYSTALGEAR"] = {
	name = AL["Apexis Crystal"].." "..AL["Vendors"],
	ContentType = COLLECTION_CONTENT,
	items = {
		{
			name = string.format(AL["ilvl %d"], 650).." "..AL["Armor"],
			[NORMAL_DIFF] = {
				{ 1, 128225, [PRICE_EXTRA_ITTYPE] = "apexis:20000" }, -- Empowered Apexis Fragment
				{ 3, 124554, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Hood
				{ 4, 124556, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Spaulders
				{ 5, 124560, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Cloak
				{ 6, 124551, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Tunic
				{ 7, 124550, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Bracers
				{ 8, 124553, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Gauntlets
				{ 9, 124557, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Girdle
				{ 10, 124555, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Leggings
				{ 11, 124552, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Treads
				{ 18, 124559, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Choker
				{ 19, 124558, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Ring
				{ 20, 124561, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Baleful Trinket
				{ 22, 124562, [PRICE_EXTRA_ITTYPE] = "apexis:10000" }, -- Baleful Armament
			},
		},
--[[
		{
			name = string.format(AL["ilvl %d"], 675).." "..AL["Armor"],
			[NORMAL_DIFF] = {
				{ 1, 122329, [PRICE_EXTRA_ITTYPE] = "116969:1:apexis:14500" }, -- Ethereal Crystal-Edged Bladecloak
				{ 2, 122330, [PRICE_EXTRA_ITTYPE] = "116970:1:apexis:14500" }, -- Ethereal Crystalclasp Stormcloak
				{ 3, 122331, [PRICE_EXTRA_ITTYPE] = "116971:1:apexis:14500" }, -- Ethereal Refractory Heartcloak
				{ 4, 122332, [PRICE_EXTRA_ITTYPE] = "116972:1:apexis:14500" }, -- Ethereal Crystal Reinforced Doomcloak
				{ 5, 122328, [PRICE_EXTRA_ITTYPE] = "116951:1:apexis:14500" }, -- Ethereal Shard-Covered Dreadcloak

				{ 7, 122308, [PRICE_EXTRA_ITTYPE] = "115396:1:apexis:20000" }, -- Ethereal Windcrystal Hood
				{ 8, 122309, [PRICE_EXTRA_ITTYPE] = "115397:1:apexis:20000" }, -- Ethereal Crystalhide Cowl
				{ 9, 122310, [PRICE_EXTRA_ITTYPE] = "115398:1:apexis:20000" }, -- Ethereal Crystal-Leaf Helm
				{ 10, 122311, [PRICE_EXTRA_ITTYPE] = "115399:1:apexis:20000" }, -- Ethereal Crystal-Plated Greathelm

				{ 12, 122312, [PRICE_EXTRA_ITTYPE] = "115400:1:apexis:14500" }, -- Ethereal Windcrystal Bracers
				{ 13, 122313, [PRICE_EXTRA_ITTYPE] = "115401:1:apexis:14500" }, -- Ethereal Crystalhide Bracers
				{ 14, 122314, [PRICE_EXTRA_ITTYPE] = "115402:1:apexis:14500" }, -- Ethereal Crystal-Leaf Bracers
				{ 15, 122315, [PRICE_EXTRA_ITTYPE] = "115403:1:apexis:14500" }, -- Ethereal Crystal-Plated Bracers

				{ 16, 122324, [PRICE_EXTRA_ITTYPE] = "116947:1:apexis:17000" }, -- Ethereal Windcrystal Wraps
				{ 17, 122325, [PRICE_EXTRA_ITTYPE] = "116948:1:apexis:17000" }, -- Ethereal Crystalhide Grips
				{ 18, 122326, [PRICE_EXTRA_ITTYPE] = "116949:1:apexis:17000" }, -- Ethereal Crystal-Leaf Gloves
				{ 19, 122327, [PRICE_EXTRA_ITTYPE] = "116950:1:apexis:17000" }, -- Ethereal Crystal-Plated Gauntlets

				{ 21, 122320, [PRICE_EXTRA_ITTYPE] = "116939:1:apexis:17000" }, -- Ethereal Windcrystal Cord
				{ 22, 122321, [PRICE_EXTRA_ITTYPE] = "116940:1:apexis:17000" }, -- Ethereal Crystalhide Belt
				{ 23, 122322, [PRICE_EXTRA_ITTYPE] = "116941:1:apexis:17000" }, -- Ethereal Crystal-Leaf Chain
				{ 24, 122323, [PRICE_EXTRA_ITTYPE] = "116942:1:apexis:17000" }, -- Ethereal Crystal-Plated Greatbelt

				{ 26, 122316, [PRICE_EXTRA_ITTYPE] = "116931:1:apexis:20000" }, -- Ethereal Windcrystal Leggings
				{ 27, 122317, [PRICE_EXTRA_ITTYPE] = "116932:1:apexis:20000" }, -- Ethereal Crystalhide Legguards
				{ 28, 122318, [PRICE_EXTRA_ITTYPE] = "116933:1:apexis:20000" }, -- Ethereal Crystal-Leaf Legguards
				{ 29, 122319, [PRICE_EXTRA_ITTYPE] = "116934:1:apexis:20000" }, -- Ethereal Crystal-Plated Legplates
			},
		},
		{

			name = string.format(AL["ilvl %d"], 655).." "..AL["Armor"],
			[NORMAL_DIFF] = {
				{ 1, 116969, [PRICE_EXTRA_ITTYPE] = "115391:1:apexis:14500" },	-- Flawless Crystal-Edged Bladecloak
				{ 2, 116970, [PRICE_EXTRA_ITTYPE] = "115392:1:apexis:14500" },	-- Flawless Crystalclasp Stormcloak
				{ 3, 116971, [PRICE_EXTRA_ITTYPE] = "115393:1:apexis:14500" },	-- Flawless Refractory Heartcloak
				{ 4, 116972, [PRICE_EXTRA_ITTYPE] = "115394:1:apexis:14500" },	-- Flawless Crystal Reinforced Doomcloak
				{ 5, 116951, [PRICE_EXTRA_ITTYPE] = "115395:1:apexis:14500" },	-- Flawless Shard-Covered Dreadcloak

				{ 7, 115396, [PRICE_EXTRA_ITTYPE] = "116957:1:apexis:20000" },	-- Flawless Windcrystal Hood
				{ 8, 115397, [PRICE_EXTRA_ITTYPE] = "116958:1:apexis:20000" },	-- Flawless Crystalhide Cowl
				{ 9, 115398, [PRICE_EXTRA_ITTYPE] = "116959:1:apexis:20000" },	-- Flawless Crystal-Leaf Helm
				{ 10, 115399, [PRICE_EXTRA_ITTYPE] = "116960:1:apexis:20000" },	-- Flawless Crystal-Plated Greathelm

				{ 12, 115400, [PRICE_EXTRA_ITTYPE] = "116961:1:apexis:14500" },	-- Flawless Windcrystal Bracers
				{ 13, 115401, [PRICE_EXTRA_ITTYPE] = "116962:1:apexis:14500" },	-- Flawless Crystalhide Bracers
				{ 14, 115402, [PRICE_EXTRA_ITTYPE] = "116963:1:apexis:14500" },	-- Flawless Crystal-Leaf Bracers
				{ 15, 115403, [PRICE_EXTRA_ITTYPE] = "116964:1:apexis:14500" },	-- Flawless Crystal-Plated Bracers

				{ 16, 116947, [PRICE_EXTRA_ITTYPE] = "115387:1:apexis:17000" },	-- Flawless Windcrystal Wraps
				{ 17, 116948, [PRICE_EXTRA_ITTYPE] = "115388:1:apexis:17000" },	-- Flawless Crystalhide Grips
				{ 18, 116949, [PRICE_EXTRA_ITTYPE] = "115389:1:apexis:17000" },	-- Flawless Crystal-Leaf Gloves
				{ 19, 116950, [PRICE_EXTRA_ITTYPE] = "115390:1:apexis:17000" },	-- Flawless Crystal-Plated Gauntlets

				{ 21, 116939, [PRICE_EXTRA_ITTYPE] = "116935:1:apexis:17000" },	-- Flawless Windcrystal Cord
				{ 22, 116940, [PRICE_EXTRA_ITTYPE] = "116936:1:apexis:17000" },	-- Flawless Crystalhide Belt
				{ 23, 116941, [PRICE_EXTRA_ITTYPE] = "116937:1:apexis:17000" },	-- Flawless Crystal-Leaf Chain
				{ 24, 116942, [PRICE_EXTRA_ITTYPE] = "116938:1:apexis:17000" },	-- Flawless Crystal-Plated Greatbelt

				{ 26, 116931, [PRICE_EXTRA_ITTYPE] = "116927:1:apexis:20000" },	-- Flawless Windcrystal Leggings
				{ 27, 116932, [PRICE_EXTRA_ITTYPE] = "116928:1:apexis:20000" },	-- Flawless Crystalhide Legguards
				{ 28, 116933, [PRICE_EXTRA_ITTYPE] = "116929:1:apexis:20000" },	-- Flawless Crystal-Leaf Legguards
				{ 29, 116934, [PRICE_EXTRA_ITTYPE] = "116930:1:apexis:20000" },	-- Flawless Crystal-Plated Legplates
			},
		},
		{
			name = string.format(AL["ilvl %d"], 645).." "..AL["Armor"],
			[NORMAL_DIFF] = {
				{ 1, 115391, [PRICE_EXTRA_ITTYPE] = "116973:1:apexis:9000" },	-- Exceptional Crystal-Edged Bladecloak
				{ 2, 115392, [PRICE_EXTRA_ITTYPE] = "116974:1:apexis:9000" },	-- Exceptional Crystalclasp Stormcloak
				{ 3, 115393, [PRICE_EXTRA_ITTYPE] = "116975:1:apexis:9000" },	-- Exceptional Refractory Heartcloak
				{ 4, 115394, [PRICE_EXTRA_ITTYPE] = "116976:1:apexis:9000" },	-- Exceptional Crystal Reinforced Doomcloak
				{ 5, 115395, [PRICE_EXTRA_ITTYPE] = "116952:1:apexis:9000" },	-- Exceptional Shard-Covered Dreadcloak

				{ 7, 116957, [PRICE_EXTRA_ITTYPE] = "116953:1:apexis:11500" },	-- Exceptional Windcrystal Hood
				{ 8, 116958, [PRICE_EXTRA_ITTYPE] = "116954:1:apexis:11500" },	-- Exceptional Crystalhide Cowl
				{ 9, 116959, [PRICE_EXTRA_ITTYPE] = "116955:1:apexis:11500" },	-- Exceptional Crystal-Leaf Helm
				{ 10, 116960, [PRICE_EXTRA_ITTYPE] = "116956:1:apexis:11500" },	-- Exceptional Crystal-Plated Greathelm

				{ 12, 116961, [PRICE_EXTRA_ITTYPE] = "116965:1:apexis:9000" },	-- Exceptional Windcrystal Bracers
				{ 13, 116962, [PRICE_EXTRA_ITTYPE] = "116966:1:apexis:9000" },	-- Exceptional Crystalhide Bracers
				{ 14, 116963, [PRICE_EXTRA_ITTYPE] = "116967:1:apexis:9000" },	-- Exceptional Crystal-Leaf Bracers
				{ 15, 116964, [PRICE_EXTRA_ITTYPE] = "116968:1:apexis:9000" },	-- Exceptional Crystal-Plated Bracers

				{ 16, 115387, [PRICE_EXTRA_ITTYPE] = "116943:1:apexis:10500" },	-- Exceptional Windcrystal Wraps
				{ 17, 115388, [PRICE_EXTRA_ITTYPE] = "116944:1:apexis:10500" },	-- Exceptional Crystalhide Grips
				{ 18, 115389, [PRICE_EXTRA_ITTYPE] = "116945:1:apexis:10500" },	-- Exceptional Crystal-Leaf Gloves
				{ 19, 115390, [PRICE_EXTRA_ITTYPE] = "116946:1:apexis:10500" },	-- Exceptional Crystal-Plated Gauntlets

				{ 21, 116935, [PRICE_EXTRA_ITTYPE] = "115378:1:apexis:10500" },	-- Exceptional Windcrystal Cord
				{ 22, 116936, [PRICE_EXTRA_ITTYPE] = "115379:1:apexis:10500" },	-- Exceptional Crystalhide Belt
				{ 23, 116937, [PRICE_EXTRA_ITTYPE] = "115380:1:apexis:10500" },	-- Exceptional Crystal-Leaf Chain
				{ 24, 116938, [PRICE_EXTRA_ITTYPE] = "115381:1:apexis:10500" },	-- Exceptional Crystal-Plated Greatbelt

				{ 26, 116927, [PRICE_EXTRA_ITTYPE] = "115374:1:apexis:11500" },	-- Exceptional Windcrystal Leggings
				{ 27, 116928, [PRICE_EXTRA_ITTYPE] = "115375:1:apexis:11500" },	-- Exceptional Crystalhide Legguards
				{ 28, 116929, [PRICE_EXTRA_ITTYPE] = "115376:1:apexis:11500" },	-- Exceptional Crystal-Leaf Legguards
				{ 29, 116930, [PRICE_EXTRA_ITTYPE] = "115377:1:apexis:11500" },	-- Exceptional Crystal-Plated Legplates
			},
		},
		{
			name = string.format(AL["ilvl %d"], 630).." "..AL["Armor"],
			[NORMAL_DIFF] = {
				{ 1, 116973, [PRICE_EXTRA_ITTYPE] = "apexis:3000" },	-- Crystal-Edged Bladecloak
				{ 2, 116974, [PRICE_EXTRA_ITTYPE] = "apexis:3000" },	-- Crystalclasp Stormcloak
				{ 3, 116975, [PRICE_EXTRA_ITTYPE] = "apexis:3000" },	-- Refractory Heartcloak
				{ 4, 116976, [PRICE_EXTRA_ITTYPE] = "apexis:3000" },	-- Crystal Reinforced Doomcloak
				{ 5, 116952, [PRICE_EXTRA_ITTYPE] = "apexis:3000" },	-- Shard-Covered Dreadcloa

				{ 7, 116953, [PRICE_EXTRA_ITTYPE] = "apexis:5000" },	-- Windcrystal Hood
				{ 8, 116954, [PRICE_EXTRA_ITTYPE] = "apexis:5000" },	-- Crystalhide Cowl
				{ 9, 116955, [PRICE_EXTRA_ITTYPE] = "apexis:5000" },	-- Crystal-Leaf Helm
				{ 10, 116956, [PRICE_EXTRA_ITTYPE] = "apexis:5000" },	-- Crystal-Plated Greathelm

				{ 12, 116965, [PRICE_EXTRA_ITTYPE] = "apexis:3000" },	-- Windcrystal Bracers
				{ 13, 116966, [PRICE_EXTRA_ITTYPE] = "apexis:3000" },	-- Crystalhide Bracers
				{ 14, 116967, [PRICE_EXTRA_ITTYPE] = "apexis:3000" },	-- Crystal-Leaf Bracers
				{ 15, 116968, [PRICE_EXTRA_ITTYPE] = "apexis:3000" },	-- Crystal-Plated Bracers

				{ 16, 116943, [PRICE_EXTRA_ITTYPE] = "apexis:4000" },	-- Windcrystal Wraps
				{ 17, 116944, [PRICE_EXTRA_ITTYPE] = "apexis:4000" },	-- Crystalhide Grips
				{ 18, 116945, [PRICE_EXTRA_ITTYPE] = "apexis:4000" },	-- Crystal-Leaf Gloves
				{ 19, 116946, [PRICE_EXTRA_ITTYPE] = "apexis:4000" },	-- Crystal-Plated Gauntlets

				{ 21, 115378, [PRICE_EXTRA_ITTYPE] = "apexis:4000" },	-- Windcrystal Cord
				{ 22, 115379, [PRICE_EXTRA_ITTYPE] = "apexis:4000" },	-- Crystalhide Belt
				{ 23, 115380, [PRICE_EXTRA_ITTYPE] = "apexis:4000" },	-- Crystal-Leaf Chain
				{ 24, 115381, [PRICE_EXTRA_ITTYPE] = "apexis:4000" },	-- Crystal-Plated Greatbelt

				{ 26, 115374, [PRICE_EXTRA_ITTYPE] = "apexis:5000" },	-- Windcrystal Leggings
				{ 27, 115375, [PRICE_EXTRA_ITTYPE] = "apexis:5000" },	-- Crystalhide Legguards
				{ 28, 115376, [PRICE_EXTRA_ITTYPE] = "apexis:5000" },	-- Crystal-Leaf Legguards
				{ 29, 115377, [PRICE_EXTRA_ITTYPE] = "apexis:5000" },	-- Crystal-Plated Legplates
			},
		},
]]
		{
			name = AL["Miscellaneous"],
			[NORMAL_DIFF] = {
				{ 1, 123974, "mount", [PRICE_EXTRA_ITTYPE] = "apexis:150000" }, 	-- Reins of the Corrupted Dreadwing
				{ 2, 116785, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" },	-- Swift Frostwolf
				{ 3, 116665, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" },	-- Armored Irontusk
				{ 4, 116775, "mount", [PRICE_EXTRA_ITTYPE] = "money:40000000:apexis:5000" },	-- Breezestrider Stallion
				{ 5, 116672, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" },	-- Domesticated Razorback
				{ 6, 116664, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" },	-- Dusty Rockhide
				{ 7, 116782, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" },	-- Ironside Warwolf
				{ 8, 116768, "mount", [PRICE_EXTRA_ITTYPE] = "money:500000000:apexis:5000" },	-- Mosshide Riverwallow
				{ 9, 116776, "mount", [PRICE_EXTRA_ITTYPE] = "money:40000000:apexis:5000" },	-- Pale Thorngrazer
				{ 10, 116772, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" },	-- Shadowmane Charger
				{ 16, 128478, "pet1693", [PRICE_EXTRA_ITTYPE] = "apexis:2000" },	-- Blazing Firehawk
				{ 17, 119146, "pet1458", [PRICE_EXTRA_ITTYPE] = "money:10000000:apexis:2000" },	-- Bone Wasp
				{ 18, 119149, "pet1430", [PRICE_EXTRA_ITTYPE] = "money:10000000:apexis:2000" },	-- Captured Forest Sproutling
				{ 19, 119142, "pet1450", [PRICE_EXTRA_ITTYPE] = "money:10000000:apexis:2000" },	-- Draenei Micro Defender
				{ 20, 119141, "pet1542", [PRICE_EXTRA_ITTYPE] = "money:10000000:apexis:2000" },	-- Frostwolf Pup
				{ 21, 119148, "pet1571", [PRICE_EXTRA_ITTYPE] = "money:10000000:apexis:2000" },	-- Indentured Albino River Calf
				{ 22, 119143, "pet1574", [PRICE_EXTRA_ITTYPE] = "money:10000000:apexis:2000" },	-- Son of Sethe
				{ 24, 127774, [PRICE_EXTRA_ITTYPE] = "apexis:3000" }, -- Gemcutter Module: Multistrike
				{ 26, 128441, [PRICE_EXTRA_ITTYPE] = "apexis:1000" }, -- Contract: Solar Priest Vayx
				{ 27, 119821, [PRICE_EXTRA_ITTYPE] = "apexis:5000" }, -- Contract: Dawnseeker Rukaryx
				{ 29, 122283, [PRICE_EXTRA_ITTYPE] = "apexis:50000" }, -- Rukhmar's Sacred Memory
				{ 101, 118673, [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:1000" },	-- Golden Visage of the Laughing Skull
				{ 102, 118672, [PRICE_EXTRA_ITTYPE] = "money:10000000:apexis:1000" },	-- Bloody Visage of the Laughing Skul
				{ 103, 118671, [PRICE_EXTRA_ITTYPE] = "money:10000000:apexis:1000" },	-- Frozen Visage of the Laughing Skull
				{ 104, 118674, [PRICE_EXTRA_ITTYPE] = "money:10000000:apexis:1000" },	-- Visage of the Laughing Skull
				{ 106, 118666, [PRICE_EXTRA_ITTYPE] = "money:50000:apexis:1" },	-- Arakkoa Elixir
				{ 107, 118665, [PRICE_EXTRA_ITTYPE] = "money:50000:apexis:1" },	-- Exarch Elixir
				{ 108, 118664, [PRICE_EXTRA_ITTYPE] = "money:50000:apexis:1" },	-- Frostwolf Elixir
				{ 109, 118668, [PRICE_EXTRA_ITTYPE] = "money:50000:apexis:1" },	-- Laughing Skull Elixir
				{ 110, 118669, [PRICE_EXTRA_ITTYPE] = "money:50000:apexis:1" },	-- Sha'tari Elixir
				{ 111, 118667, [PRICE_EXTRA_ITTYPE] = "money:50000:apexis:1" },	-- Steamwheedle Elixir
			},
		},
	},
}

data["BOEWORLDEPICS"] = {
	name = AL["BoE World Epics"],
	ContentType = COLLECTION_CONTENT,
	items = {
		{ -- Warlords of Draenor
			name = EXPANSION_NAME5,
			[NORMAL_DIFF] = {
				{ 1, 118814 },	-- Berserker's Windwrap
				{ 2, 118812 },	-- Flamelicked Cloak of Kaufebyrd
				{ 3, 118816 },	-- Gorenscale Mesh Cloak
				{ 4, 118808 },	-- Highmaul Magi Scarf
				{ 5, 118810 },	-- Rinnila's Regal Cloak
				{ 16, 118893 },	-- Lylirra's Shining Circlet
				{ 17, 118889 },	-- Ephew's Enlightened Mantle
				{ 18, 118885 },	-- Gem-Inlaid Velvet Cinch
				{ 19, 118894 },	-- Toria's Perseverance
				{ 20, 118890 },	-- Studded Frostboar Leather Spaulders
				{ 21, 118886 },	-- Waistgirdle of the Mountain
				{ 22, 118895 },	-- Plume Adorned Headdress
				{ 23, 118891 },	-- Dunestalker's Mantle
				{ 24, 118887 },	-- Cloudcaller's Linked Belt
				{ 25, 118896 },	-- Helmet of Vile Indignation
				{ 26, 118892 },	-- Botani-Barbed Pauldrons
				{ 27, 118888 },	-- Ashelia's Adorned Waistguard
				{ 101, 118848 },	-- Battle Hardened Gorget
				{ 102, 118842 },	-- Dorian's Cipher Key
				{ 103, 118840 },	-- Firecrystal Chain
				{ 104, 118846 },	-- Gorget of Primal Might
				{ 105, 118844 },	-- Osseric's Ossified Chained Orb
				{ 106, 118864 },	-- Aryu's Puzzle Ring
				{ 107, 118862 },	-- Knobbly Ancient's Tendril
				{ 108, 118868 },	-- Ransacker's Ring of Plunder
				{ 109, 118866 },	-- Seal of Yen Ta
				{ 110, 118870 },	-- Signet of the Traitor General
				{ 116, 118878 },	-- Copeland's Clarity
				{ 117, 118880 },	-- Everburning Candle
				{ 118, 118884 },	-- Kyb's Foolish Perseverance
				{ 119, 118876 },	-- Lucky Double-Sided Coin
				{ 120, 118882 },	-- Scabbard of Kyanos
				{ 122, 118852 },	-- Erorus' Ledger of Trade
				{ 123, 118851 },	-- Genesaur Braid
				{ 124, 118874 },	-- Blackrock Bulwark
				{ 125, 118872 },	-- Disc of the Third Moon
			},
		},
		{ -- Mists of Pandaria
			name = EXPANSION_NAME4,
			[NORMAL_DIFF] = {
				{ 1, 90580 },	-- Cristof's Crushing Cloak
				{ 2, 90589 },	-- Dirl's Drafty Drape
				{ 3, 90586 },	-- Dory's Pageantry
				{ 4, 90578 },	-- Zom's Rain-Stained Cloak
				{ 5, 90573 },	-- Wang's Unshakable Smile
				{ 6, 90587 },	-- Natli's Fireheart Robe
				{ 7, 90574 },	-- Etoshia's Elegant Gloves
				{ 8, 90588 },	-- Rittsyn's Ruinblasters
				{ 9, 90585 },	-- Vulajin's Vicious Breastplate
				{ 10, 90572 },	-- Kilt of Pandaren Promises
				{ 11, 90570 },	-- Legguards of Sleeting Arrows
				{ 12, 87695 },	-- Treads of Edward the Odd
				{ 13, 90576 },	-- Spaulders of the Scorned
				{ 14, 90577 },	-- Boblet's Bouncing Hauberk
				{ 15, 90579 },	-- Legplates of Durable Dreams
				{ 16, 90582 },	-- Buc-Zakai Memento
				{ 17, 90583 },	-- Don Guerrero's Glorious Choker
				{ 18, 90590 },	-- Dorian's Necklace of Burgeoning Dreams
				{ 20, 90581 },	-- Jan-Ho's Unwavering Seal
				{ 21, 90584 },	-- Perculia's Peculiar Signet
				{ 22, 90591 },	-- Ring of the Shipwrecked Prince
				{ 24, 90571 },	-- Scroll of Whispered Secrets
				{ 25, 90575 },	-- Sutiru's Brazen Bulwark
				{ 27, 88165, nil, nil, GetSpellInfo(921) },	-- Vine-Cracked Junkbox
				{ 28, 88149 },	-- The Gloaming Blade
				{ 29, 88150 },	-- Krol Scimitar
				{ 101, 90721 },	-- Cournith Waterstrider's Silken Finery
				{ 102, 90725 },	-- Gaarn's Leggings of Infestation
				{ 103, 90720 },	-- Silent Leggings of the Ghostpaw
				{ 104, 90724 },	-- Spriggin's Sproggin' Leggin'
				{ 105, 90723 },	-- Arness's Scaled Leggings
				{ 106, 90719 },	-- Go-Kan's Golden Trousers
				{ 107, 90722 },	-- Torik-Ethis' Gilded Legplates
				{ 108, 90717 },	-- Qu'nas' Apocryphal Legplates
				{ 109, 90718 },	-- Torik-Ethis' Bloodied Legguards
				{ 116, 87650 },	-- Fishsticker Crossbow
				{ 117, 87641 },	-- Yaungol Battle Barrier
			},
		},
		{ -- Cataclysm
			name = EXPANSION_NAME3,
			[NORMAL_DIFF] = {
				{ 1, 67134 },	-- Dory's Finery
				{ 2, 67140 },	-- Drape of Inimitable Fate
				{ 3, 67131 },	-- Ritssyn's Ruminous Drape
				{ 4, 67142 },	-- Zom's Electrostatic Cloak
				{ 5, 67147 },	-- Je'Tze's Sparkling Tiara
				{ 6, 67133 },	-- Dizze's Whirling Robe
				{ 7, 67132 },	-- Grips of the Failed Immortal
				{ 8, 67146 },	-- Woundsplicer Handwraps
				{ 9, 67135 },	-- Morrie's Waywalker Wrap
				{ 10, 67150 },	-- Arrowsinger Legguards
				{ 11, 67148 },	-- Kilt of Trollish Dreams
				{ 12, 67144 },	-- Pauldrons of Edward the Odd
				{ 13, 67143 },	-- Icebone Hauberk
				{ 14, 67141 },	-- Corefire Legplates
				{ 16, 67138 },	-- Buc-Zakai Choker
				{ 17, 67137 },	-- Don Rodrigo's Fabulous Necklace
				{ 18, 67130 },	-- Dorian's Lost Necklace
				{ 20, 67139 },	-- Blauvelt's Family Crest
				{ 21, 67136 },	-- Gilnean Ring of Ruination
				{ 22, 67129 },	-- Signet of High Arcanist Savor
				{ 24, 67149 },	-- Heartbound Tome
				{ 25, 67145 },	-- Blockade's Lost Shield
				{ 27, 63349, nil, nil, GetSpellInfo(921) },	-- Flame-Scarred Junkbox
				{ 28, 68163 },	-- The Twilight Blade
				{ 29, 68161 },	-- Krol Decapitator
			},
		},
		{ -- Wrath of the Lich King
			name = EXPANSION_NAME2,
			[NORMAL_DIFF] = {
				{ 1, 44309 },	-- Sash of Jordan
				{ 2, 44312 },	-- Wapach's Spaulders of Solidarity
				{ 4, 44308 },	-- Signet of Edward the Odd
				{ 5, 37835 },	-- Je'Tze's Bell
				{ 16, 44310 },	-- Namlak's Supernumerary Sticker
				{ 17, 44311 },	-- Avool's Sword of Jin
				{ 18, 44313 },	-- Zom's Crackling Bulwark
				{ 20, 43575, nil, nil, GetSpellInfo(921) },	-- Reinforced Junkbox
				{ 21, 43613 },	-- The Dusk Blade
				{ 22, 43611 },	-- Krol Cleaver
			},
		},
		{ -- The Burning Crusade
			name = EXPANSION_NAME1,
			[NORMAL_DIFF] = {
				{ 1, 31329 },	-- Lifegiving Cloak
				{ 2, 31340 },	-- Will of Edward the Odd
				{ 3, 31343 },	-- Kamaei's Cerulean Skirt
				{ 4, 31333 },	-- The Night Watchman
				{ 5, 31335 },	-- Kilt of Living Growth
				{ 6, 31330 },	-- Lightning Crown
				{ 7, 31328 },	-- Leggings of Beast Mastery
				{ 8, 31320 },	-- Chestguard of Exile
				{ 10, 31338 },	-- Charlotte's Ivy
				{ 11, 31321 },	-- Choker of Repentance
				{ 13, 31319 },	-- Band of Impenetrable Defenses
				{ 14, 31339 },	-- Lola's Eve
				{ 15, 31326 },	-- Truestrike Ring
				{ 16, 31331 },	-- The Night Blade
				{ 17, 31342 },	-- The Ancient Scepter of Sue-Min
				{ 18, 31336 },	-- Blade of Wizardry
				{ 19, 31332 },	-- Blinkstrike
				{ 20, 31318 },	-- Singing Crystal Axe
				{ 21, 31322 },	-- The Hammer of Destiny
				{ 22, 31334 },	-- Staff of Natural Fury
				{ 23, 31323 },	-- Don Santos' Famous Hunting Rifle
			},
		},
		{ -- Classic
			name = EXPANSION_NAME0,
			[NORMAL_DIFF] = {
				{ 1, 3475 },	-- Cloak of Flames
				{ 2, 14553 },	-- Sash of Mercy
				{ 3, 2245 },	-- Helm of Narv
				{ 4, 14552 },	-- Stockade Pauldrons
				{ 5, 14554 },	-- Cloudkeeper Legplates
				{ 7, 1443 },	-- Jeweled Amulet of Cainwyn
				{ 8, 14558 },	-- Lady Maye's Pendant
				{ 9, 2246 },	-- Myrmidon's Signet
				{ 10, 833 },	-- Lifestone
				{ 11, 14557 },	-- The Lion Horn of Stormwind
				{ 16, 14555 },	-- Alcor's Sunrazor
				{ 17, 811 },	-- Axe of the Deep Woods
				{ 18, 2243 },	-- Hand of Edward the Odd
				{ 19, 2244 },	-- Krol Blade
				{ 20, 1728 },	-- Teebu's Blazing Longsword
				{ 21, 1263 },	-- Brain Hacker
				{ 22, 2801 },	-- Blade of Hanna
				{ 23, 647 },	-- Destiny
				{ 24, 944 },	-- Elemental Mage Staff
				{ 25, 2099 },	-- Dwarven Hand Cannon
				{ 26, 1168 },	-- Skullflame Shield
				{ 101, 3075 },	-- Eye of Flame
				{ 102, 940 },	-- Robes of Insight
				{ 103, 14551 },	-- Edgemaster's Handguards
				{ 104, 17007 },	-- Stonerender Gauntlets
				{ 105, 14549 },	-- Boots of Avoidance
				{ 107, 1315 },	-- Lei of Lilies
				{ 108, 942 },	-- Freezing Band
				{ 109, 1447 },	-- Ring of Saviors
				{ 116, 2164 },	-- Gut Ripper
				{ 117, 2163 },	-- Shadowblade
				{ 118, 871 },	-- Flurry Axe
				{ 119, 810 },	-- Hammer of the Northern Wind
				{ 120, 809 },	-- Bloodrazor
				{ 121, 2291 },	-- Kang the Decapitator
				{ 122, 2915 },	-- Taran Icebreaker
				{ 123, 812 },	-- Glowing Brightwood Staff
				{ 124, 943 },	-- Warden Staff
				{ 125, 2824 },	-- Hurricane
				{ 126, 2100 },	-- Precisely Calibrated Boomstick
				{ 127, 1169 },	-- Blackskull Shield
				{ 128, 1979 },	-- Wall of the Dead
				{ 201, 867 },	-- Gloves of Holy Might
				{ 202, 1981 },	-- Icemail Jerkin
				{ 204, 1980 },	-- Underworld Band
				{ 216, 868 },	-- Ardent Custodian
				{ 217, 869 },	-- Dazzling Longsword
				{ 218, 870 },	-- Fiery War Axe
				{ 219, 1982 },	-- Nightblade
				{ 220, 873 },	-- Staff of Jordan
				{ 221, 2825 },	-- Bow of Searing Arrows
				{ 222, 1204 },	-- The Green Tower
			},
		},
	},
}

-- Challenge Mode Gear
data["CMGEAR"] = {
	name = AL["Challenge Mode Gear"],
	ContentType = COLLECTION_CONTENT,
	items = {
		{ -- Warlords of Draenor
			name = EXPANSION_NAME5,
			[NORMAL_DIFF] = {
				{ 1, "ac8899" },	-- Challenge Warlord: Gold
				{ 2, 118408 },	-- Elemental Crescent
				{ 3, 118399 },	-- Sunblade
				{ 4, 118398 },	-- Soul Eater
				{ 5, 118395 },	-- Claws of Creation
				{ 6, 118396 },	-- Bloodmaw Gargoyle
				{ 7, 118397 },	-- Equus
				{ 8, 118405 },	-- Shifting Felblade
				{ 9, 118413 },	-- Flamegrinder
				{ 10, 118412 },	-- Greatsword of the Inferno
				{ 12, "ac8898", "mount171848" },	-- Challenge Warlord: Silver / Challenger's War Yeti
				{ 14, "ac8897" },	-- Challenge Warlord: Bronze
				{ 17, 118401 },	-- Arcana Shard Spire
				{ 18, 118402 },	-- Greatstaff of Infinite Knowledge
				{ 19, 118403 },	-- Dimension-Ripper's Staff
				{ 20, 118409 },	-- Cloudsong Glaive
				{ 21, 118404 },	-- Living Longbow
				{ 22, 118411 },	-- Crystal-Shot Longrifle
				{ 23, 118410 },	-- Tesseract Timepiece
				{ 24, 118407 },	-- Face of the Guardian
				{ 25, 118406 },	-- Furnace of the Great Machine
			},
		},
		{ -- Mists of Pandaria
			name = EXPANSION_NAME4,
			[NORMAL_DIFF] = {
				{ 1, "setCMMoP:dk:n" },
				{ 3, "setCMMoP:druid:n" },
				{ 5, "setCMMoP:hunter:n" },
				{ 7, "setCMMoP:mage:n" },
				{ 9, "setCMMoP:monk:n" },
				{ 11, "setCMMoP:paladin:n" },
				{ 16, "setCMMoP:priest:n" },
				{ 18, "setCMMoP:rogue:n" },
				{ 20, "setCMMoP:shaman:n" },
				{ 22, "setCMMoP:warlock:n" },
				{ 24, "setCMMoP:warrior:n" },
			},
		},
	},
}

data["MOUNTS"] = {
	name = AL["Mounts"],
	ContentType = COLLECTION_CONTENT,
	TableType = NORMAL_ITTYPE,
	items = 
	{
		{ -- Achievements
			name = AL["Achievements"],
			CoinTexture = "Achievement",
			[NORMAL_DIFF] = {
				-- Alliance
				{ 1, 93385, "ac7928" }, -- Grand Gryphon
				{ 2, 120968, "ac9909" }, -- Chauffeured Chopper
				{ 3, 44843, "ac2536" }, -- Blue Dragonhawk, Mountain o' Mounts
				{ 4, 89785, "ac6828" }, -- Pandaren Kite String, Pandaren Ambassador
				{ 5, 44223, "ac614" }, -- Reins of the Black War Bear, For the Alliance!
				{ 6, 98259, "ac8304" }, -- Armored Blue Dragonhawk, Mount Parade
				{ 7, 62298, "ac4912" }, -- Reins of the Golden King
				{ 8, 69226, "ac9598" }, -- Felfirehawk
				{ 9, 91802, "ac7860" }, -- Jade Pandaren Kite String
				{ 10, 70909, "ac5328" }, -- Reins of the Vicious War Steed
				-- Horde
				{ 16, 93386, "ac7929" }, -- Grand Wyvern2
				{ 17, 122703, "ac9909" }, -- Chauffeured Chopper
				{ 18, 44842, "ac2537" }, -- Red Dragonhawk2
				{ 19, 81559, "ac6827" }, -- Pandaren Kite String2
				{ 20, 44224, "ac619" }, -- Reins of the Black War Bear2
				{ 21, 98104, "ac8302" }, -- Armored Red Dragonhawk2
				{ 22, 67107, "ac5492" }, -- Reins of the Kor'kron Annihilator2
				{ 23, 69226, "ac9599" }, -- Felfirehawk2
				{ 24, 91802, "ac7862" }, -- Jade Pandaren Kite String2
				{ 25, 70910, "ac5325" }, -- Horn of the Vicious War Wolf2

				{ 12, 87769, "ac6927" }, -- Reins of the Crimson Cloud Serpent
				{ 13, 87773, "ac6932" }, -- Reins of the Heavenly Crimson Cloud Serpent
				{ 14, 93662, "ac8124" }, -- Reins of the Armored Skyscreamer
				{ 15, 104208, "ac8454" }, -- Reins of Galakras
				
				{ 27, 44178, "ac2143" }, -- Reins of the Albino Drake
				{ 28, 77068, "ac6169" }, -- Reins of the Twilight Harbinger
				{ 29, 44160, "ac2136" }, -- Reins of the Red Proto-Drake
				{ 101, 128282, "ac10110" }, -- Warmongering Gladiator's Felblood Gronnling
				{ 102, 44177, "ac2144" }, -- Reins of the Violet Proto-Drake
				{ 116, 45801, "ac2958" }, -- Reins of the Ironbound Proto-Drake
				{ 117, 45802, "ac2957" }, -- Reins of the Rusted Proto-Drake
				{ 118, 51954, "ac4602" }, -- Reins of the Bloodbathed Frostbrood Vanquisher
				{ 119, 51955, "ac4603" }, -- Reins of the Icebound Frostbrood Vanquisher
				{ 104, 62900, "ac4845" }, -- Reins of the Volcanic Stone Drake
				{ 105, 62901, "ac4853" }, -- Reins of the Drake of the East Wind
				{ 106, 69213, "ac5866" }, -- Flameward Hippogryph
				{ 107, 69230, "ac5828" }, -- Corrupted Egg of Millagazor
				{ 109, 63125, "ac4988" }, -- Reins of the Dark Phoenix
				{ 110, 85666, "ac6682" }, -- Reins of the Thundering Jade Cloud Serpent
				{ 111, 118676, "ac9713" }, -- Reins of the Emerald Drake
				{ 112, 115484, "ac9550" }, -- Core Hound Chain
				{ 113, 116383, "ac8985" }, -- Gorestrider Gronnling
				{ 121, 127140, "ac10149" }, -- Infernal Direwolf
				{ 122, 116666, "ac9669" }, -- Blacksteel Battleboar
				{ 123, 116668, "ac9539" }, -- Armored Frostboar
				{ 124, 116670, "ac9396" }, -- Frostplains Battleboar
				{ 125, 116781, "ac9540" }, -- Armored Frostwolf
				{ 126, 116791, "ac8898" }, -- Challenger's War Yeti
				{ 127, 98618, "ac8345" }, -- Hearthsteed
			},
		},
		{ -- Faction
			name = AL["Factions"],
			CoinTexture = "Reputation",
			[ALLIANCE_DIFF] = {
				-- Stormwind , Classic
				{ 1 , "f72rep5" },
				{ 2 , 18776, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Palomino
				{ 3 , 18777, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Brown Steed
				{ 4 , 18778, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift White Steed
				{ 5 , 25473, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Swift Blue Gryphon
				{ 6 , 25527, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Swift Red Gryphon
				{ 7 , 25528, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Swift Green Gryphon
				{ 8 , 25529, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Swift Purple Gryphon
				{ 9 , 2411, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Black Stallion Bridle
				{ 10, 2414, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Pinto Bridle
				{ 11, 5655, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Chestnut Mare Bridle
				{ 12, 5656, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Brown Horse Bridle
				{ 13, 25470, "mount", [PRICE_EXTRA_ITTYPE] = "money:500000" }, -- Golden Gryphon
				{ 14, 25471, "mount", [PRICE_EXTRA_ITTYPE] = "money:500000" }, -- Ebon Gryphon
				{ 15, 25472, "mount", [PRICE_EXTRA_ITTYPE] = "money:500000" }, -- Snowy Gryphon
				{ 16, 102514, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Reins of the Vicious Warsaber
				{ 17, 116777, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Ram
				{ 18, 124089, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Mechanostrider
				{ 19, 140350, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Elekk
				{ 20, 142234, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Bear
				{ 21, 142237, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Lion
				{ 22, 143648, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Turtle
				{ 23, 140353, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious Gilnean Warhorse
				{ 24, 116789, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000000" }, -- Champion's Treadblade, alliance only
				-- Wintersaber Trainers, Classic
				{ 26, "f589rep8" },
				{ 27, 13086, "mount" }, -- Reins of the Winterspring Frostsaber
				-- Ironforge, Classic
				{ 101, "f47rep5" },
				{ 102, 18785, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift White Ram
				{ 103, 18786, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Brown Ram
				{ 104, 18787, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Gray Ram
				{ 105, 5864, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Gray Ram
				{ 106, 5872, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Brown Ram
				{ 107, 5873, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- White Ram
				-- Gnomeregan, Classic
				{ 109, "f54rep5" },
				{ 110, 18772, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Green Mechanostrider
				{ 111, 18773, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift White Mechanostrider
				{ 112, 18774, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Yellow Mechanostrider
				{ 113, 8563, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Red Mechanostrider
				{ 114, 8595, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Blue Mechanostrider
				{ 115, 13321, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Green Mechanostrider
				{ 116, 13322, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Unpainted Mechanostrider
				-- Darnassus, Classic
				{ 118, "f69rep5" },
				{ 119, 18766, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Swift Frostsaber
				{ 120, 18767, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Swift Mistsaber
				{ 121, 18902, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Swift Stormsaber
				{ 122, 8632, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Spotted Frostsaber
				{ 123, 47100, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Striped Dawnsaber
				{ 124, 8631, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Striped Frostsaber
				{ 125, 8629, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Striped Nightsaber
				-- Exodar, BC
				{ 201, "f930rep5" },
				{ 202, 29745, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Great Blue Elekk
				{ 203, 29746, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Great Green Elekk
				{ 204, 29747, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Great Purple Elekk
				{ 205, 28481, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Brown Elekk
				{ 206, 29744, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Gray Elekk
				{ 207, 29743, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Purple Elekk
				-- Kurenai, BC
				{ 216, "f978rep8" },
				{ 217, 29227, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Reins of the Cobalt War Talbuk
				{ 218, 29229, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Reins of the Silver War Talbuk
				{ 219, 29230, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Reins of the Tan War Talbuk
				{ 220, 29231, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Reins of the White War Talbuk
				{ 221, 31830, "mount", [PRICE_EXTRA_ITTYPE] = "money:700000" }, -- Reins of the Cobalt Riding Talbuk
				{ 222, 31832, "mount", [PRICE_EXTRA_ITTYPE] = "money:700000" }, -- Reins of the Silver Riding Talbuk
				{ 223, 31834, "mount", [PRICE_EXTRA_ITTYPE] = "money:700000" }, -- Reins of the Tan Riding Talbuk
				{ 224, 31836, "mount", [PRICE_EXTRA_ITTYPE] = "money:700000" }, -- Reins of the White Riding Talbuk
				-- Kirin Tor, WotLK
				{ 301, "f1090rep5" },
				{ 302, 44225, "mount", [PRICE_EXTRA_ITTYPE] = "money:7500000" }, -- Reins of the Armored Brown Bear
				{ 303, 44689, "mount", [PRICE_EXTRA_ITTYPE] = "money:20000000" }, -- Armored Snowy Gryphon
				{ 304, 44230, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Wooly Mammoth
				{ 305, 44235, "mount", [PRICE_EXTRA_ITTYPE] = "money:200000000" }, -- Reins of the Traveler's Tundra Mammoth
				-- The Sons of Hodir, WotLK
				{ 307, "f1119rep7" },
				{ 308, 43958, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000000" }, -- Reins of the Ice Mammoth
				{ 309, 43961, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Grand Ice Mammoth
				-- The Silver Covenant, WotLK
				{ 311, "f1094rep8" },
				{ 312, 46813, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:150" }, -- Silver Covenant Hippogryph
				{ 313, 46815, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Quel'dorei Steed
				-- Argent Tournament, WotLK
				{ 316, "f1106rep5" },
				{ 317, 45591, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Darnassian Nightsaber
				{ 318, 45590, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Exodar Elekk
				{ 319, 45589, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Gnomeregan Mechanostrider
				{ 320, 45586, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Ironforge Ram
				{ 321, 45125, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Stormwind Steed
				{ 322, 46745, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Great Red Elekk
				{ 323, 46752, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Swift Gray Steed
				{ 324, 46744, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Swift Moonsaber
				{ 325, 46748, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Swift Violet Ram
				{ 326, 46747, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Turbostrider
				-- Gilneas, Cata
				{ 401, "f1134rep5" },
				{ 402, 73839, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Mountain Horse
				{ 403, 73838, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Mountain Horse
				-- Baradin's Wardens, Cata
				{ 405, "f1177rep8" },
				{ 406, 63039, "mount", [PRICE_EXTRA_ITTYPE] = "tolbarad:200" }, -- Reins of the Drake of the West Wind
				{ 407, 64998, "mount", [PRICE_EXTRA_ITTYPE] = "tolbarad:165" }, -- Reins of the Spectral Steed
				-- Operation: Shieldwall, MoP
				{ 409, "f1376rep8" },
				{ 410, 93168, "mount", [PRICE_EXTRA_ITTYPE] = "money:20000000" }, -- Grand Armored Gryphon
				{ 411, 93385, "mount" }, -- Grand Gryphon1, reward from quest: The Silence (32455)
				-- Kirin Tor Offensive, MoP
				{ 413, "f1387rep8" },
				{ 414, 95564, "mount", [PRICE_EXTRA_ITTYPE] = "money:30000000" }, -- Reins of the Golden Primal Direhorn
				-- Tushui Pandaren, MoP
				{ 416, "f1353rep5" },
				{ 417, 82811, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Red Dragon Turtle
				{ 418, 87801, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Green Dragon Turtle
				{ 419, 87802, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Black Dragon Turtle
				{ 420, 87803, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Blue Dragon Turtle
				{ 421, 87804, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Brown Dragon Turtle
				{ 422, 87805, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Purple Dragon Turtle
				{ 423, 82765, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Green Dragon Turtle
				{ 424, 87795, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Black Dragon Turtle
				{ 425, 87796, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Blue Dragon Turtle
				{ 426, 87797, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Brown Dragon Turtle
				{ 427, 87799, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Purple Dragon Turtle
				{ 428, 87800, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Red Dragon Turtle
				-- Council of Exarchs, WoD
				{ 501, "f1731rep8" },
				{ 502, 116664, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" }, -- Dusty Rockhide
				-- Sha'tari Defense, WoD
				{ 504, "f1710rep8" },
				{ 505, 116665, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" },	-- Armored Irontusk
				-- Wrynn's Vanguard, WoD
				{ 507, "f1682rep8" },
				{ 508, 116776, "mount", [PRICE_EXTRA_ITTYPE] = "money:40000000:apexis:5000" },	-- Pale Thorngrazer
				-- Hand of the Prophet 
				{ 510, "f1847rep8" },
				{ 511, 128527, "mount", [PRICE_EXTRA_ITTYPE] = "money:25000000" }, -- Deathtusk Felboar
			},
			[HORDE_DIFF]= {
				-- Orgrimmar, Classic
				{ 1, "f76rep5" },
				{ 2, 18796, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Horn of the Swift Brown Wolf
				{ 3, 18797, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Horn of the Swift Timber Wolf
				{ 4, 18798, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Horn of the Swift Gray Wolf
				{ 5, 1132, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Horn of the Timber Wolf
				{ 6, 5665, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Horn of the Dire Wolf
				{ 7, 5668, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Horn of the Brown Wolf
				{ 8, 46099, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Horn of the Black Wolf
				{ 9, 25477, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Swift Red Wind Rider
				{ 10, 25531, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Swift Green Wind Rider
				{ 11, 25532, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Swift Yellow Wind Rider
				{ 12, 25533, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Swift Purple Wind Rider
				{ 13, 25474, "mount", [PRICE_EXTRA_ITTYPE] = "money:500000" }, -- Tawny Wind Rider
				{ 14, 25475, "mount", [PRICE_EXTRA_ITTYPE] = "money:500000" }, -- Blue Wind Rider
				{ 15, 25476, "mount", [PRICE_EXTRA_ITTYPE] = "money:500000" }, -- Green Wind Rider
				{ 16, 116778, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Raptor
				{ 17, 124540, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Kodo
				{ 18, 102533, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Reins of the Vicious Skeletal Warhorse
				{ 19, 140348, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious Warstrider
				{ 20, 140354, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Trike
				{ 21, 142235, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Bear
				{ 22, 142437, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Scorpion
				{ 23, 143649, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Vicious War Turtle
				{ 24, 143864, "mount", [PRICE_EXTRA_ITTYPE] = "vicioussaddle:1" }, -- Reins of the Prestigious War Wolf
				-- Darkspear Trolls, Classic
				{ 26, "f530rep8" },
				{ 27, 46102, "mount", }, -- Whistle of the Venomhide Ravasaur
				-- Thunder Bluff, Classic
				{ 101, "f81rep5" },
				{ 102, 18793, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Great White Kodo
				{ 103, 18794, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Great Brown Kodo
				{ 104, 18795, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Great Gray Kodo
				{ 105, 15277, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Gray Kodo
				{ 106, 15290, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Brown Kodo
				{ 107, 46100, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- White Kodo
				-- Darkspear Trolls, (Durotar), Classic
				{ 109, "f530rep5" },
				{ 110, 18788, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Blue Raptor
				{ 111, 18789, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Olive Raptor
				{ 112, 18790, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Orange Raptor
				{ 113, 8588, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Whistle of the Emerald Raptor
				{ 114, 8591, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Whistle of the Turquoise Raptor
				{ 115, 8592, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Whistle of the Violet Raptor
				-- Undercity, Classic
				{ 116, "f68rep5" },
				{ 117, 13334, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Green Skeletal Warhorse
				{ 118, 18791, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Purple Skeletal Warhorse
				{ 119, 47101, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Ochre Skeletal Warhorse
				{ 120, 13331, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Red Skeletal Horse
				{ 121, 13332, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Blue Skeletal Horse
				{ 122, 13333, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Brown Skeletal Horse
				{ 123, 46308, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Black Skeletal Horse
				-- Silvermoon City, BC
				{ 201, "f911rep5" },
				{ 202, 28936, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Pink Hawkstrider
				{ 203, 29223, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Green Hawkstrider
				{ 204, 29224, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Swift Purple Hawkstrider
				{ 205, 28927, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Red Hawkstrider
				{ 206, 29220, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Blue Hawkstrider
				{ 207, 29221, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Black Hawkstrider
				{ 208, 29222, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Purple Hawkstrider
				-- The Mag'har, BC
				{ 216, "f941rep8" },
				{ 217, 31829, "mount", [PRICE_EXTRA_ITTYPE] = "money:700000" }, -- Reins of the Cobalt Riding Talbuk
				{ 218, 29102, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Reins of the Cobalt War Talbuk
				{ 219, 31831, "mount", [PRICE_EXTRA_ITTYPE] = "money:700000" }, -- Reins of the Silver Riding Talbuk
				{ 220, 29104, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Reins of the Silver War Talbuk
				{ 221, 31833, "mount", [PRICE_EXTRA_ITTYPE] = "money:700000" }, -- Reins of the Tan Riding Talbuk
				{ 222, 29105, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Reins of the Tan War Talbuk
				{ 223, 31835, "mount", [PRICE_EXTRA_ITTYPE] = "money:700000" }, -- Reins of the White Riding Talbuk
				{ 224, 29103, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Reins of the White War Talbuk
				-- Kirin Tor, WotLK
				{ 301, "f1090rep5" },
				{ 302, 44226, "mount", [PRICE_EXTRA_ITTYPE] = "money:7500000" }, -- Reins of the Armored Brown Bear
				{ 303, 44231, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Wooly Mammoth
				{ 304, 44234, "mount", [PRICE_EXTRA_ITTYPE] = "money:200000000" }, -- Reins of the Traveler's Tundra Mammoth
				{ 305, 44690, "mount", [PRICE_EXTRA_ITTYPE] = "money:20000000" }, -- Armored Blue Wind Rider
				-- The Sons of Hodir, WotLK
				{ 307, "f1119rep7" },
				{ 308, 44080, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000000" }, -- Reins of the Ice Mammoth
				{ 309, 44086, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Grand Ice Mammoth
				-- The Sunreavers, WotLK
				{ 311, "f1124rep8" },
				{ 312, 46816, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:150" }, -- Sunreaver Hawkstrider
				{ 313, 46814, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Sunreaver Dragonhawk
				-- Argent Tournament, WotLK
				{ 316, "f1106rep5" },
				{ 317, 45593, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Darkspear Raptor
				{ 318, 45597, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Forsaken Warhorse
				{ 319, 46750, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Great Golden Kodo
				{ 320, 45595, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Orgrimmar Wolf
				{ 321, 45596, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Silvermoon Hawkstrider
				{ 322, 46749, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Swift Burgundy Wolf
				{ 323, 46743, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Swift Purple Raptor
				{ 324, 46751, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Swift Red Hawkstrider
				{ 325, 45592, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Thunder Bluff Kodo
				{ 326, 46746, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- White Skeletal Warhorse
				-- Bilgewater Cartel, Cata
				{ 401, "f1133rep5" },
				{ 402, 62462, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Goblin Turbo-Trike Key
				{ 403, 62461, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Goblin Trike Key
				-- Hellscream's Reach, Cata
				{ 405, "f1178rep8" },
				{ 406, 65356, "mount", [PRICE_EXTRA_ITTYPE] = "tolbarad:200" }, -- Reins of the Drake of the West Wind
				{ 407, 64999, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Reins of the Spectral Wolf
				-- Dominance Offensive, MoP
				{ 409, "f1375rep8" },
				{ 410, 93169, "mount", [PRICE_EXTRA_ITTYPE] = "money:20000000" }, -- Grand Armored Wyvern
				-- Sunreaver Onslaught, MoP
				{ 412, "f1388rep8" },
				{ 413, 95565, "mount", [PRICE_EXTRA_ITTYPE] = "money:30000000" }, -- Reins of the Crimson Primal Direhorn
				-- Huojin Pandaren, MoP
				{ 416, "f1352rep5" },
				{ 417, 82811, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Red Dragon Turtle
				{ 418, 87801, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Green Dragon Turtle
				{ 419, 87802, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Black Dragon Turtle
				{ 420, 87803, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Blue Dragon Turtle
				{ 421, 87804, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Brown Dragon Turtle
				{ 422, 87805, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Purple Dragon Turtle
				{ 423, 82765, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Green Dragon Turtle
				{ 424, 87795, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Black Dragon Turtle
				{ 425, 87796, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Blue Dragon Turtle
				{ 426, 87797, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Brown Dragon Turtle
				{ 427, 87799, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Purple Dragon Turtle
				{ 428, 87800, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Red Dragon Turtle
				-- Swift Frostwolf, WoD
				{ 501, "f1445rep8" },
				{ 502, 116785, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" },	-- Swift Frostwolf
				-- Vol'jin's Spear, WoD
				{ 504, "f1681rep8" },
				{ 505, 116775, "mount", [PRICE_EXTRA_ITTYPE] = "money:40000000:apexis:5000" },	-- Breezestrider Stallion
				-- Laughing Skull Orcs, WoD
				{ 507, "f1708rep8" },
				{ 508, 116782, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" },	-- Ironside Warwolf
				-- Vol'jin's Headhunters
				{ 510, "f1848rep8" },
				{ 515, 128526, "mount", [PRICE_EXTRA_ITTYPE] = "money:25000000" }, -- Deathtusk Felboar
			},
			[NEUTRAL_DIFF] = {
				-- Sha'tari Skyguard, BC
				{ 1, "f1031rep8" },
				{ 2, 32314, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Green Riding Nether Ray
				{ 3, 32316, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Purple Riding Nether Ray
				{ 4, 32317, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Red Riding Nether Ray
				{ 5, 32318, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Silver Riding Nether Ray
				{ 6, 32319, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Blue Riding Nether Ray
				-- Netherwing, BC
				{ 08, "f1015rep8" },
				{ 09, 32857, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Reins of the Onyx Netherwing Drake
				{ 10, 32858, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Reins of the Azure Netherwing Drake
				{ 11, 32859, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Reins of the Cobalt Netherwing Drake
				{ 12, 32860, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Reins of the Purple Netherwing Drake
				{ 13, 32861, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Reins of the Veridian Netherwing Drake
				{ 14, 32862, "mount", [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Reins of the Violet Netherwing Drake
				-- Cenarion Expedition, BC
				{ 16, "f942rep8" },
				{ 17, 33999, "mount", [PRICE_EXTRA_ITTYPE] = "money:20000000" }, -- Cenarion War Hippogryph
				-- Argent Tournament, WoLTK
				{ 19, "f1106rep5" },
				{ 20, 47180, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Argent Warhorse
				{ 21, 45725, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:150" }, -- Argent Hippogryph
				{ 22, 47179, "mount", [PRICE_EXTRA_ITTYPE] = "championsseal:100" }, -- Argent Charger
				-- The Wyrmrest Accord, WoLTK
				{ 24, "f1091rep8" },
				{ 25, 43955, "mount", [PRICE_EXTRA_ITTYPE] = "money:20000000" }, -- Reins of the Red Drake
				-- Ramkahen, Cata
				{ 27, "f1173rep8" },
				{ 28, 63044, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Reins of the Brown Riding Camel
				{ 29, 63045, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Reins of the Tan Riding Camel
				-- The Anglers, MoP
				{ 101, "f1302rep8" },
				{ 102, 81354, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000" }, -- Reins of the Azure Water Strider
				-- Order of the Cloud Serpent, MoP
				{ 104, "f1271rep8" },
				{ 105, 79802, "mount", [PRICE_EXTRA_ITTYPE] = "money:30000000" }, -- Reins of the Jade Cloud Serpent
				{ 106, 85429, "mount", [PRICE_EXTRA_ITTYPE] = "money:30000000" }, -- Reins of the Golden Cloud Serpent
				{ 107, 85430, "mount", [PRICE_EXTRA_ITTYPE] = "money:30000000" }, -- Reins of the Azure Cloud Serpent
				-- Shado-Pan, MoP
				{ 109, "f1270rep8" },
				{ 110, 89305, "mount", [PRICE_EXTRA_ITTYPE] = "money:15000000" }, -- Reins of the Green Shado-Pan Riding Tiger
				{ 111, 89306, "mount", [PRICE_EXTRA_ITTYPE] = "money:25000000" }, -- Reins of the Red Shado-Pan Riding Tiger
				{ 112, 89307, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Reins of the Blue Shado-Pan Riding Tiger
				-- The Klaxxi, MoP
				{ 114, "f1337rep8" },
				{ 115, 85262, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Amber Scorpion
				-- Golden Lotus, MoP
				{ 116, "f1269rep8" },
				{ 117, 87782, "mount", [PRICE_EXTRA_ITTYPE] = "money:25000000" }, -- Reins of the Golden Riding Crane
				{ 118, 87783, "mount", [PRICE_EXTRA_ITTYPE] = "money:15000000" }, -- Reins of the Regal Riding Crane
				{ 119, 87781, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Reins of the Azure Riding Crane
				-- The Tillers, MoP
				{ 121, "f1272rep8" },
				{ 122, 89362, "mount", [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Reins of the Brown Riding Goat
				{ 123, 89390, "mount", [PRICE_EXTRA_ITTYPE] = "money:32500000" }, -- Reins of the White Riding Goat
				{ 124, 89391, "mount", [PRICE_EXTRA_ITTYPE] = "money:15000000" }, -- Reins of the Black Riding Goat
				-- The August Celestials, MoP
				{ 126, "f1341rep8" },
				{ 127, 89304, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Thundering August Cloud Serpent
				-- The Lorewalkers, MoP
				{ 129, "f1345rep8" },
				{ 130, 89363, "mount", [PRICE_EXTRA_ITTYPE] = "money:6000000" }, -- Disc of the Red Flying Cloud
				-- Emperor Shaohao, MoP
				{ 201, "f1492rep8" },
				{ 202, 87774, "mount", [PRICE_EXTRA_ITTYPE] = "timelesscoin:100000" }, -- Reins of the Heavenly Golden Cloud Serpent
				-- Nat Pagle, WoD
				{ 204, "f1358rep16" }, -- required Best Friend
				{ 205, 87791, "mount", [PRICE_EXTRA_ITTYPE] = "luckycoin:100" }, -- Reins of the Crimson Water Strider
				-- Arakkoa Outcasts, WoD
				{ 207, "f1515rep8" },
				{ 208, 116772, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" },	-- Shadowmane Charger
				-- Order of the Awakened, MoD
				{ 210, "f1849rep5" },
				{ 211, 123974, "mount", [PRICE_EXTRA_ITTYPE] = "apexis:150000" }, 	-- Reins of the Corrupted Dreadwing
				-- Steamwheedle Perservation Society
				{ 213, "f1711rep5" },
				{ 214, 116672, "mount", [PRICE_EXTRA_ITTYPE] = "money:50000000:apexis:5000" }, -- Domesticated Razorback
				-- The Saberstalkers, MoD
				{ 216, "f1850rep5" },
				{ 217, 116671, "mount", [PRICE_EXTRA_ITTYPE] = "bfclaw:1000" }, -- Wild Goretusk
				{ 218, 128481, "mount", [PRICE_EXTRA_ITTYPE] = "bfclaw:5000" }, -- Bristling Hellboar
				-- Argussian Reach, Legion 7.3
				{ 220 , "f2170rep5" },
				{ 221, 152791, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Sable Ruinstrider, Exalted
				{ 222, 152793, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Russet Ruinstrider, Exalted
				{ 223, 152794, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Amethyst Ruinstrider, Exalted
				{ 224, 152795, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Beryl Ruinstrider, Exalted
				{ 225, 152796, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Umber Ruinstrider, Exalted
				{ 226, 152797, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Reins of the Cerulean Ruinstrider, Exalted
				-- Army of the Light, Legion 7.3
				{ 301, "f2165rep8" },
				{ 302, 152788, "mount", [PRICE_EXTRA_ITTYPE] = "money:6250000000" }, -- Lightforged Warframe, Exalted
			},
		},
		{ -- Black Market Auction House
			name = AL["Black Market Auction House"],
			[NORMAL_DIFF] = {
				{ 1, 13335, "mount" }, -- Deathcharger's Reins
				{ 2, 23720, "mount" }, -- Riding Turtle
				{ 3, 19872, "mount" }, -- Swift Razzashi Raptor
				{ 4, 19902, "mount" }, -- Swift Zulian Tiger
				{ 5, 30480, "mount" }, -- Fiery Warhorse's Reins
				{ 6, 32458, "mount" }, -- Ashes of Al'ar
				{ 7, 32768, "mount" }, -- Reins of the Raven Lord
				{ 8, 35513, "mount" }, -- Swift White Hawkstrider
				{ 9, 43952, "mount" }, -- Reins of the Azure Drake
				{ 10, 43953, "mount" }, -- Reins of the Blue Drake
				{ 11, 43962, "mount" }, -- Reins of the White Polar Bear
				{ 12, 44151, "mount" }, -- Reins of the Blue Proto-Drake
				{ 13, 44175, "mount" }, -- Reins of the Plagued Proto-Drake
				{ 14, 44707, "mount" }, -- Reins of the Green Proto-Drake
				{ 15, 45693, "mount" }, -- Mimiron's Head
				{ 16, 45802, "mount" }, -- Reins of the Rusted Proto-Drake
				{ 17, 49286, "mount" }, -- X-51 Nether-Rocket X-TREME
				{ 18, 49636, "mount" }, -- Reins of the Onyxian Drake
				{ 19, 50818, "mount" }, -- Invincible's Reins
				{ 20, 54068, "mount" }, -- Wooly White Rhino
				{ 21, 63040, "mount" }, -- Reins of the Drake of the North Wind
				{ 22, 63041, "mount" }, -- Reins of the Drake of the South Wind
				{ 23, 63043, "mount" }, -- Reins of the Vitreous Stone Drake
				{ 24, 69224, "mount" }, -- Smoldering Egg of Millagazor
				{ 25, 71665, "mount" }, -- Flametalon of Alysrazor
				{ 26, 77067, "mount" }, -- Reins of the Blazing Drake
				{ 27, 77069, "mount" }, -- Life-Binder's Handmaiden
				{ 28, 78919, "mount" }, -- Experiment 12-B
				{ 29, 87771, "mount" }, -- Reins of the Heavenly Onyx Cloud Serpent
				{ 30, 87777, "mount" }, -- Reins of the Astral Cloud Serpent
				{ 101, 89783, "mount" }, -- Son of Galleon's Saddle
				{ 102, 90655, "mount" }, -- Reins of the Thundering Ruby Cloud Serpent
				{ 103, 95057, "mount" }, -- Reins of the Thundering Cobalt Cloud Serpent
				{ 104, 95059, "mount" }, -- Clutch of Ji-Kun
				{ 105, 104253, "mount" }, -- Kor'kron Juggernaut
				{ 106, 104269, "mount" }, -- Reins of the Thundering Onyx Cloud Serpent
				{ 107, 115484, "mount" }, -- Core Hound Chain
			},
		},
		{ -- Crafting
			name = AL["Crafting"],
			[NORMAL_DIFF] = {
				{ 1, 65891, "mount" }, -- Vial of the Sands
				{ 3, 60954, "mount" }, -- Fossilized Raptor
				{ 4, 64883, "mount" }, -- Scepter of Azj'Aqir
				{ 6, 95416, "mount" }, -- Sky Golem
				{ 7, 41508, "mount" }, -- Mechano-Hog
				{ 8, 44413, "mount" }, -- Mekgineer's Chopper
				{ 9, 34061, "mount" }, -- Turbo-Charged Flying Machine
				{ 10, 34060, "mount" }, -- Flying Machine
				{ 11, 87250, "mount" }, -- Depleted-Kyparium Rocket
				{ 12, 87251, "mount" }, -- Geosynchronous World Spinner
				{ 14, 108883, "mount" }, -- Riding Harness
				{ 16, 82453, "mount" }, -- Jeweled Onyx Panther
				{ 17, 83087, "mount" }, -- Ruby Panther
				{ 18, 83088, "mount" }, -- Jade Panther
				{ 19, 83089, "mount" }, -- Sunstone Panther
				{ 20, 83090, "mount" }, -- Sapphire Panther
				{ 22, 115363, "mount" }, -- Creeping Carpet
				{ 23, 44558, "mount" }, -- Magnificent Flying Carpet
				{ 24, 54797, "mount" }, -- Frosty Flying Carpet
				{ 25, 44554, "mount" }, -- Flying Carpet
			},
		},
		{ -- Dungeons & Raids
			name = AL["Dungeons"].." & "..AL["Raids"],
			[WOD_DIFF] = {
				{ 1, 123890, "mount" }, -- Felsteel Annihilator
				{ 2, 116660, "mount" }, -- Ironhoof Destroyer
				-- { 5, 133543, "mount" }, -- Reins of the Infinite Timereaver
				-- Tanaan Jungle
				{ 4, 116658, "mount" }, -- Tundra Icehoof
				{ 5, 116669, "mount" }, -- Armored Razorback
				{ 6, 116780, "mount" }, -- Warsong Direfang
				-- Garrison
				{ 8, 116663, "mount" }, -- Shadowhide Pearltusk
				{ 9, 116673, "mount" }, -- Giant Coldsnout
				{ 10, 116786, "mount" }, -- Smoky Direwolf
				{ 11, 116779, "mount" }, -- Garn Steelmaw
				{ 12, 128671, "mount" }, -- Minion of Grumpus
				-- World
				{ 16, 116771, "mount" }, -- Solar Spirehawk
				{ 17, 116659, "mount" }, -- Bloodhoof Bull
				{ 18, 116661, "mount" }, -- Mottled Meadowstomper
				{ 19, 116674, "mount" }, -- Great Greytusk
				{ 20, 116767, "mount" }, -- Sapphire Riverbeast
				{ 21, 116773, "mount" }, -- Swift Breezestrider
				{ 22, 116792, "mount" }, -- Sunhide Gronnling
				{ 23, 116794, "mount" }, -- Garn Nighthowl
				{ 25, 119180 }, -- Goren \"Log\" Roller
				{ 26, 113543 }, -- Spirit of Shinri
			},
			[MOP_DIFF] = {
				{ 1, 87777, "mount" }, -- Reins of the Astral Cloud Serpent
				{ 3, 93666, "mount" }, -- Spawn of Horridon
				{ 4, 95059, "mount" }, -- Clutch of Ji-Kun
				{ 6, 87771, "mount" }, -- Reins of the Heavenly Onyx Cloud Serpent
				{ 8, 104253, "mount" }, -- Kor'kron Juggernaut
				{ 10, 89783, "mount" }, -- Son of Galleon's Saddle
				{ 11, 90655, "mount" }, -- Reins of the Thundering Ruby Cloud Serpent
				{ 12, 104269, "mount" }, -- Reins of the Thundering Onyx Cloud Serpent
				{ 13, 95057, "mount" }, -- Reins of the Thundering Cobalt Cloud Serpent
				{ 16, 94228, "mount" }, -- Reins of the Cobalt Primordial Direhorn
				{ 17, 94229, "mount" }, -- Reins of the Slate Primordial Direhorn
				{ 18, 94230, "mount" }, -- Reins of the Amber Primordial Direhorn
				{ 19, 94231, "mount" }, -- Reins of the Jade Primordial Direhorn
				{ 21, 94291, "mount" }, -- Reins of the Red Primal Raptor
				{ 22, 94292, "mount" }, -- Reins of the Black Primal Raptor
				{ 23, 94293, "mount" }, -- Reins of the Green Primal Raptor
				{ 25, 101675 }, -- Shimmering Moonstone
				{ 26, 89697 }, -- Bag of Kafa Beans
				{ 27, 89770 }, -- Tuft of Yak Fur
				{ 28, 89682 }, -- Oddly-Shaped Horn
				{ 29, 104329 }, -- Ash-Covered Horn
			},
			[CATA_DIFF] = {
				{ 1, 77067, "mount" }, -- Reins of the Blazing Drake
				{ 2, 77069, "mount" }, -- Life-Binder's Handmaiden
				{ 3, 78919, "mount" }, -- Experiment 12-B
				{ 5, 71665, "mount" }, -- Flametalon of Alysrazor
				{ 6, 69224, "mount" }, -- Smoldering Egg of Millagazor
				{ 8, 63041, "mount" }, -- Reins of the Drake of the South Wind
				{ 16, 63040, "mount" }, -- Reins of the Drake of the North Wind
				{ 18, 63043, "mount" }, -- Reins of the Vitreous Stone Drake
				{ 20, 68823, "mount" }, -- Armored Razzashi Raptor
				{ 21, 68824, "mount" }, -- Swift Zulian Panther
				{ 22, 69747, "mount" }, -- Amani Battle Bear
				{ 24, 63042, "mount" }, -- Reins of the Phosphorescent Stone Drake
				{ 25, 63046, "mount" }, -- Reins of the Grey Riding Camel
				{ 26, 67151, "mount" }, -- Reins of Poseidus
			},
			[WOTLK_DIFF] = {
				{ 1, 43952, "mount" }, -- Reins of the Azure Drake
				{ 2, 43953, "mount" }, -- Reins of the Blue Drake
				{ 4, 43954, "mount" }, -- Reins of the Twilight Drake
				{ 5, 43986, "mount" }, -- Reins of the Black Drake
				{ 7, 44168, "mount" }, -- Reins of the Time-Lost Proto-Drake
				{ 8, 43962, "mount" }, -- Reins of the White Polar Bear
				{ 10, 45693, "mount" }, -- Mimiron's Head
				{ 12, 49636, "mount" }, -- Reins of the Onyxian Drake
				{ 14, 50818, "mount" }, -- Invincible's Reins
				{ 15, [ATLASLOOT_IT_ALLIANCE] = 43959, "mount", [ATLASLOOT_IT_HORDE] = 44083, "mount" }, -- Reins of the Grand Black War Mammoth
				-- Horde{ 1, 44083, "mount" }, -- Reins of the Grand Black War Mammoth
				{ 16, 43951, "mount" }, -- Reins of the Bronze Drake
				{ 18, 44151, "mount" }, -- Reins of the Blue Proto-Drake
				{ 20, 46109, "mount" }, -- Sea Turtle
				{ 21, 44707, "mount" }, -- Reins of the Green Proto-Drake
				{ 22, 50250, "mount" }, -- Big Love Rocket
			},
			[BC_DIFF] = {
				{ 1, 32458, "mount" }, -- Ashes of Al'ar
				{ 3, 32768, "mount" }, -- Reins of the Raven Lord
				{ 5, 30480, "mount" }, -- Fiery Warhorse's Reins
				{ 7, 35513, "mount" }, -- Swift White Hawkstrider
				{ 16, 37828, "mount" }, -- Great Brewfest Kodo
				{ 18, 37012, "mount" }, -- The Horseman's Reins
			},
			[CLASSIC_DIFF] = {
				--{ 1, 19872, "mount" }, -- Swift Razzashi Raptor
				--{ 2, 19902, "mount" }, -- Swift Zulian Tiger
				{ 1, 13335, "mount" }, -- Deathcharger's Reins
				{ 3, 21218, "mount" }, -- Blue Qiraji Resonating Crystal
				{ 4, 21321, "mount" }, -- Red Qiraji Resonating Crystal
				{ 5, 21323, "mount" }, -- Green Qiraji Resonating Crystal
				{ 6, 21324, "mount" }, -- Yellow Qiraji Resonating Crystal
			},
		},
		{ -- In-game Shop
			name = AL["Shop"],
			[NORMAL_DIFF] = {
				{ 1, 54811, "mount" }, -- Celestial Steed
				{ 2, 69846, "mount" }, -- Winged Guardian
				{ 3, 78924, "mount" }, -- Heart of the Aspects
				{ 4, 92724, "mount" }, -- Swift Windsteed
				{ 5, 95341, "mount" }, -- Armored Bloodwing
				{ 6, 97989, "mount" }, -- Enchanted Fey Dragon
				{ 7, 107951, "mount" }, -- Iron Skyreaver
				{ 8, 112326, "mount" }, -- Warforged Nightmare
				{ 9, 112327, "mount" }, -- Grinning Reaver
				{ 10, 112326, "mount" }, -- Warforged Nightmare
			},
		},
--[[		{ -- Vendor
			name = AL["Vendor"],
			[ALLIANCE_DIFF] = {
				--Both
				-- Eastern Kingdoms
				{ 217, 40775, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000000" }, -- Winged Steed of the Ebon Blade, Death Knight only
				-- Pandaria
				{ 301, 84101, "mount", [PRICE_EXTRA_ITTYPE] = "money:1200000000" }, -- Reins of the Grand Expedition Yak
				{ 302, 87788, "mount", [PRICE_EXTRA_ITTYPE] = "money:30000000" }, -- Reins of the Grey Riding Yak
				{ 303, 87789, "mount", [PRICE_EXTRA_ITTYPE] = "money:30000000" }, -- Reins of the Blonde Riding Yak
				
				-- guild
				{ 125, 67107, "mount", [PRICE_EXTRA_ITTYPE] = "money:15000000" }, -- Reins of the Kor'kron Annihilator, guild, horde
				{ 118, 62298, "mount", [PRICE_EXTRA_ITTYPE] = "money:15000000" }, -- Reins of the Golden King, guild, alliance
				{ 310, 63125, "mount", [PRICE_EXTRA_ITTYPE] = "money:30000000" }, -- Reins of the Dark Phoenix, guild
				{ 311, 85666, "mount", [PRICE_EXTRA_ITTYPE] = "money:30000000" }, -- Reins of the Thundering Jade Cloud Serpent
				{ 312, 116666, "mount", [PRICE_EXTRA_ITTYPE] = "money:40000000" }, -- Blacksteel Battleboar, Achievement: Guild Glory of the Draenor Raider

				-- Draenor, garrison
				{ 313, 116667, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000000" }, -- Rocktusk Battleboar
				{ 315, 116655, "mount", [PRICE_EXTRA_ITTYPE] = "money:200000000" }, -- Witherhide Cliffstomper
				-- Draenor, Ashran
				{ 521, 116768, "mount", [PRICE_EXTRA_ITTYPE] = "money:500000000:apexis:5000" }, -- Mosshide Riverwallow
				-- Deeprun Tram for alliance, Brawl'gar Arena for horde
				{ 314, 98405, "mount", [PRICE_EXTRA_ITTYPE] = "money:15000000" }, -- Brawler's Burly Mushan Beast, Brawl'gar Arena
				
				-- World Events
				-- Brewfest
				{ 316, 33977, "mount", [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Swift Brewfest Ram
				{ 317, 33976, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Brewfest Ram
				-- Darkmoon Island
				{ 507, 73766, "mount", [PRICE_EXTRA_ITTYPE] = "darkmoon:180" }, -- Darkmoon Dancing Bear
				{ 524, 72140, "mount", [PRICE_EXTRA_ITTYPE] = "darkmoon:180" }, -- Swift Forest Strider
				-- Hallow's End
				{ 509, 37011, "mount", [PRICE_EXTRA_ITTYPE] = "trickytreat:150" }, -- Magic Broom
				-- Love is in the Air
				{ 519, 72146, "mount", [PRICE_EXTRA_ITTYPE] = "lovetoken:270" }, -- Swift Lovebird
				-- Noblegarden 
				{ 523, 72145, "mount", [PRICE_EXTRA_ITTYPE] = "noblegardenchocolate:500" }, -- Swift Springstrider
				
				-- Pandaren only?
				{ 325, 91010, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Red Dragon Turtle
				{ 326, 91011, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Black Dragon Turtle
				{ 327, 91012, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Green Dragon Turtle
				{ 328, 91013, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Blue Dragon Turtle
				{ 329, 91014, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Brown Dragon Turtle
				{ 330, 91015, "mount", [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Reins of the Great Purple Dragon Turtle
				{ 407, 91004, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Green Dragon Turtle
				{ 408, 91005, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Brown Dragon Turtle
				{ 409, 91006, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Purple Dragon Turtle
				{ 410, 91007, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Red Dragon Turtle
				{ 411, 91008, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Black Dragon Turtle
				{ 412, 91009, "mount", [PRICE_EXTRA_ITTYPE] = "money:10000" }, -- Reins of the Blue Dragon Turtle
				
				-- Pandaria, Timeless Isle
				{ 508, 103638, "mount", [PRICE_EXTRA_ITTYPE] = "bloodycoin:500" }, -- Reins of the Ashhide Mushan Beast

			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
]]
		{ -- No longer available
			name = AL["No longer available"],
			[NORMAL_DIFF] = {
				{ 1, 128281, "ac10098" }, -- Wild Gladiator's Felblood Gronnling
				{ 2, 128277, "ac9239" }, -- Primal Gladiator's Felblood Gronnling
				{ 3, 89154, "mount" }, -- Reins of the Crimson Pandaren Phoenix
				{ 4, 90710, "mount" }, -- Reins of the Ashen Pandaren Phoenix
				{ 5, 90711, "mount" }, -- Reins of the Emerald Pandaren Phoenix
				{ 6, 90712, "mount" }, -- Reins of the Violet Pandaren Phoenix
				{ 7, 95041, "mount" }, -- Malevolent Gladiator's Cloud Serpent
				{ 8, 104246, "mount" }, -- Reins of the Kor'kron War Wolf
				{ 9, 104325, "mount" }, -- Tyrannical Gladiator's Cloud Serpent
				{ 10, 104326, "mount" }, -- Grievous Gladiator's Cloud Serpent
				{ 11, 104327, "mount" }, -- Prideful Gladiator's Cloud Serpent
				{ 12, 30609, "mount" }, -- Swift Nether Drake
				{ 13, 33809, "mount" }, -- Amani War Bear
				{ 14, 34092, "mount" }, -- Merciless Nether Drake
				{ 15, 37676, "mount" }, -- Vengeful Nether Drake
				{ 16, 43516, "mount" }, -- Brutal Nether Drake
				{ 17, 44164, "mount" }, -- Reins of the Black Proto-Drake
				{ 18, 46171, "mount" }, -- Furious Gladiator's Frost Wyrm
				{ 19, 46708, "mount" }, -- Deadly Gladiator's Frost Wyrm
				{ 20, 47840, "mount" }, -- Relentless Gladiator's Frost Wyrm
				{ 21, 50435, "mount" }, -- Wrathful Gladiator's Frost Wyrm
				{ 22, 71339, "mount" }, -- Vicious Gladiator's Twilight Drake
				{ 23, 71954, "mount" }, -- Ruthless Gladiator's Twilight Drake
				{ 24, 85785, "mount" }, -- Cataclysmic Gladiator's Twilight Drake
				{ 25, 76889, "mount" }, -- Spectral Gryphon
				{ 26, 76902, "mount" }, -- Spectral Wind Rider
				{ 27, 21176, "mount" }, -- Black Qiraji Resonating Crystal
				{ 28, 8586, "mount" }, -- Whistle of the Mottled Red Raptor
				{ 29, 12302, "mount" }, -- Reins of the Ancient Frostsaber
				{ 30, 12303, "mount" }, -- Reins of the Nightsaber
				{ 101, 12330, "mount" }, -- Horn of the Red Wolf
				{ 102, 12351, "mount" }, -- Horn of the Arctic Wolf
				{ 103, 12353, "mount" }, -- White Stallion Bridle
				{ 104, 12354, "mount" }, -- Palomino Bridle
				{ 105, 13317, "mount" }, -- Whistle of the Ivory Raptor
				{ 106, 13326, "mount" }, -- White Mechanostrider Mod B
				{ 107, 13327, "mount" }, -- Icy Blue Mechanostrider Mod A
				{ 108, 13328, "mount" }, -- Black Ram
				{ 109, 13329, "mount" }, -- Frost Ram
				{ 110, 15292, "mount" }, -- Green Kodo
				{ 111, 15293, "mount" }, -- Teal Kodo
				{ 112, 49044, "mount" }, -- Swift Alliance Steed
				{ 113, 49046, "mount" }, -- Swift Horde Wolf
				{ 114, 49096, "mount" }, -- Crusader's White Warhorse
				{ 115, 49098, "mount" }, -- Crusader's Black Warhorse
				{ 116, 76755, "mount" }, -- Tyrael's Charger
				-- { 118, 33182 }, -- Swift Flying Broom
				-- { 119, 33184 }, -- Swift Magic Broom
				-- { 120, 33183 }, -- Old Magic Broom
				{ 117, 116788, "ac9496" }, -- Warlord's Deathwheel
			},
		},
	},
}

data["CLASSICSETS"] = {
	name = AL["Classic Sets"],
	ContentType = COLLECTION_CONTENT,
	TableType = SET_ITTYPE,
	items = {
		{
			name = ALIL["Ahn'Qiraj"].." "..AL["Sets"],
			[NORMAL_DIFF] = {
				{ 1, "AQ40:druid:n" },
				{ 3, "AQ40:hunter:n" },
				{ 5, "AQ40:mage:n" },
				{ 7, "AQ40:paladin:n" },
				{ 9, "AQ40:priest:n" },
				{ 16, "AQ40:rogue:n" },
				{ 18, "AQ40:shaman:n" },
				{ 20, "AQ40:warlock:n" },
				{ 22, "AQ40:warrior:n" },
			},
		},
		{
			name = ALIL["Ruins of Ahn'Qiraj"].." "..AL["Sets"],
			[NORMAL_DIFF] = {
				{ 1, "AQ20:druid:n" },
				{ 3, "AQ20:hunter:n" },
				{ 5, "AQ20:mage:n" },
				{ 7, "AQ20:paladin:n" },
				{ 9, "AQ20:priest:n" },
				{ 16, "AQ20:rogue:n" },
				{ 18, "AQ20:shaman:n" },
				{ 20, "AQ20:warlock:n" },
				{ 22, "AQ20:warrior:n" },
			},
		},
		{	-- Scholomance Sets
			name = C_Map.GetMapInfo(476).name.." "..AL["Sets"],
			[NORMAL_DIFF] = {
				{ 1, "Scholomance:scholocloth:n" },
				{ 3, "Scholomance:schololeather:n" },
				{ 16, "Scholomance:scholomail:n" },
				{ 18, "Scholomance:scholoplate:n" },
			},
		},
		{
			name = AL["Miscellaneous"].." "..AL["Sets"],
			[NORMAL_DIFF] = {
				{ 1, "ClassicMisc:ironweavebattlesuit:n" },
				{ 3, "ClassicMisc:thegladiator:n" },
				{ 5, "ClassicMisc:thepostmaster:n" },
				{ 16, "ClassicMisc:chainofthescarletcrusade:n" },
				{ 18, "ClassicMisc:embraceoftheviper:n" },
				{ 20, "ClassicMisc:defiasleather:n" },
			},
		},
	},
}

data["DUNGEONSETS"] = {
	name = AL["Dungeon Sets"],
	ContentType = COLLECTION_CONTENT,
	TableType = SET_ITTYPE,
	items = {
		{
			name = format(AL["Dungeon %d Sets"], 3).." ("..EXPANSION_NAME1..")",
			[NORMAL_DIFF] = {
				{ 1, "Dungeon3:moongladeraiment:n" },
				{ 3, "Dungeon3:beastlordarmor:n" },
				{ 5, "Dungeon3:incantersregalia:n" },
				{ 7, "Dungeon3:righteousarmor:n" },
				{ 9, "Dungeon3:hallowedraiment:n" },
				{ 14, "Dungeon3:manaechedregalia:n" },
				{ 15, "Dungeon3:wastewalkerarmor:n" },
				{ 16, "Dungeon3:assassinationarmor:n" },
				{ 18, "Dungeon3:tidefuryraiment:n" },
				{ 20, "Dungeon3:oblivionraiment:n" },
				{ 22, "Dungeon3:boldarmor:n" },
				{ 29, "Dungeon3:desolationbattlegear:n" },
				{ 30, "Dungeon3:doomplatebattlegear:n" },
			},
		},
		{
			name = format(AL["Dungeon %d Sets"], 2).." ("..EXPANSION_NAME0..")",
			[NORMAL_DIFF] = {
				{ 1, "Dungeon2:druid:n" },
				{ 3, "Dungeon2:hunter:n" },
				{ 5, "Dungeon2:mage:n" },
				{ 7, "Dungeon2:paladin:n" },
				{ 9, "Dungeon2:priest:n" },
				{ 16, "Dungeon2:rogue:n" },
				{ 18, "Dungeon2:shaman:n" },
				{ 20, "Dungeon2:warlock:n" },
				{ 22, "Dungeon2:warrior:n" },
			},
		},
		{
			name = format(AL["Dungeon %d Sets"], 1).." ("..EXPANSION_NAME0..")",
			[NORMAL_DIFF] = {
				{ 1, "Dungeon1:druid:n" },
				{ 3, "Dungeon1:hunter:n" },
				{ 5, "Dungeon1:mage:n" },
				{ 7, "Dungeon1:paladin:n" },
				{ 9, "Dungeon1:priest:n" },
				{ 16, "Dungeon1:rogue:n" },
				{ 18, "Dungeon1:shaman:n" },
				{ 20, "Dungeon1:warlock:n" },
				{ 22, "Dungeon1:warrior:n" },
			},
		},
	},
}

data["GARRISON"] = {
	name = AL["Garrison"],
	ContentType = COLLECTION_CONTENT,
	items = {
		{	-- Dwarven Bunker / War Mill
			name = ALIL["DBWM"],
			[ALLIANCE_DIFF] = {
				{ 1, 114746 },	-- Goredrenched Armor Set
				{ 2, 114622 },	-- Goredrenched Weaponry
				{ 3, 114806 },	-- Blackrock Armor Set
				{ 4, 114081 },	-- Blackrock Weaponry
				{ 5, 114807 },	-- War Ravaged Armor Set
				{ 6, 114616 },	-- War Ravaged Weaponry
				{ 7, 120301 },	-- Armor Enhancement Token
				{ 8, 120302 },	-- Weapon Enhancement Token
				{ 10, 113681 },	-- Iron Horde Scraps
				{ 12, 118365, [QUEST_EXTRA_ITTYPE] = 37092 },	-- Stormwind Tabard
				{ 16, "setDBWMSets:stormwindset:n" },	-- SW Set
				{ 18, "setDBWMSets:clothset:n" },	-- Cloth Set
				{ 19, "setDBWMSets:leatherset:n" },	-- Leather Set
				{ 20, "setDBWMSets:mailset:n" },	-- Mail Set
				{ 21, "setDBWMSets:plateset:n" },	-- Plate Set
				{ 23, "ac9129" },	-- Filling the Ranks
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 12, 118372, [QUEST_EXTRA_ITTYPE] = 37043 },	-- Orgrimmar Tabard
				{ 16, "setDBWMSets:orgrimmarset:n" },	-- OG Set
			},
		},
		{
			name = ALIL["Enchanter's Study"],
			[NORMAL_DIFF] = {
				{ 1, "prof173716" },	-- Illusion: Agility
				{ 2, "prof173717" },	-- Illusion: Battlemaster
				{ 3, "prof173718" },	-- Illusion: Berserking
				{ 4, "prof174979" },	-- Illusion: Blood Draining
				{ 5, "prof173720" },	-- Illusion: Crusader
				{ 6, "prof173721" },	-- Illusion: Elemental Force
				{ 7, "prof173722" },	-- Illusion: Executioner
				{ 8, "prof173723" },	-- Illusion: Fiery Weapon
				{ 9, "prof173719" },	-- Illusion: Greater Spellpower
				{ 10, "prof173724" },	-- Illusion: Hidden
				{ 11, "prof175070" },	-- Illusion: Jade Spirit
				{ 12, "prof173725" },	-- Illusion: Landslide
				{ 13, "prof173726" },	-- Illusion: Lifestealing
				{ 14, "prof175085" },	-- Illusion: Mending
				{ 15, "prof173727" },	-- Illusion: Mongoose
				{ 16, "prof173729" },	-- Illusion: Power Torrent
				{ 17, "prof175086" },	-- Illusion: River's Song
				{ 18, "prof173730" },	-- Illusion: Spellsurge
				{ 19, "prof173731" },	-- Illusion: Striking
				{ 20, "prof173732" },	-- Illusion: Unholy
				{ 22, "ICON_inv_throwingknife_04", nil, ALIL["ROGUE"], nil },
				{ 23, "prof173728" },	-- Illusion: Poisoned
				{ 25, "ICON_Spell_Nature_BloodLust", nil, ALIL["SHAMAN"], nil },
				{ 26, "prof175076" },	-- Illusion: Earthliving
				{ 27, "prof175072" },	-- Illusion: Flametongue
				{ 28, "prof175071" },	-- Illusion: Frostbrand
				{ 29, "prof175078" },	-- Illusion: Rockbiter
				{ 30, "prof175074" },	-- Illusion: Windfury
			},
		},
		{
			name = ALIL["Engineering Works"],
			[NORMAL_DIFF] = {
				{ 1, 109644, [PRICE_EXTRA_ITTYPE] = "money:16000" },	-- Walter
				{ 2, 109574, [PRICE_EXTRA_ITTYPE] = "money:16000" },	-- GUMM-E
				{ 16, 117438, [PRICE_EXTRA_ITTYPE] = "money:13260" },	-- Gnomish Net Launcher
				{ 17, 117403, [PRICE_EXTRA_ITTYPE] = "money:12220" },	-- Gyro-Radiant Reflector
				{ 18, 117402, [PRICE_EXTRA_ITTYPE] = "money:12181" },	-- Ultra-Electrified Reflector
			},
		},
		{
			name = ALIL["Fishing Shack"],
			[NORMAL_DIFF] = {
				{ 1, "ICON_achievement_faction_anglers", nil, ALIL["Nat Pagle"], AL["Best Friend"] },
				{ 2, 87791, "mount", [PRICE_EXTRA_ITTYPE] = "117397:100" },	-- Reins of the Crimson Water Strider
				{ 4, "ICON_achievement_faction_anglers", nil, ALIL["Nat Pagle"], AL["Good Friend"] },
				{ 5, 117404, "pet115", [PRICE_EXTRA_ITTYPE] = "117397:50" },	-- Land Shark
				{ 7, "ICON_achievement_faction_anglers", nil, ALIL["Nat Pagle"], AL["Friend"] },
				{ 8, 117405, [PRICE_EXTRA_ITTYPE] = "117397:25" },	-- Nat's Drinking Hat
				{ 9, [ATLASLOOT_IT_ALLIANCE] = 116826, [ATLASLOOT_IT_HORDE] = 116825, [PRICE_EXTRA_ITTYPE] = "117397:25" },	-- Draenic Fishing Pole / Savage Fishing Pole
				{ 16, 117401, [PRICE_EXTRA_ITTYPE] = "117397:25" },	-- Nat's Draenic Fishing Journal
				{ 18, "ac9462" },	-- Draenor Angler
			},
		},
		{	-- Gnomish Gearworks / Goblin Workshop
			name = ALIL["GGGW"],
			[NORMAL_DIFF] = {
				{ 1, 114246 },	-- "Skyterror" Personal Delivery System
				{ 2, 114974 },	-- Pneumatic Power Gauntlet
				{ 3, 114975 },	-- Pneumatic Power Gauntlet
				{ 4, 119158 },	-- Robo-Rooster
				{ 5, 114983 },	-- Sticky Grenade Launcher
				{ 16, 114244 },	-- GG-117 Micro-Jetpack
				{ 17, 115530 },	-- N.U.K.U.L.A.R. Target Painter
				{ 18, [ATLASLOOT_IT_ALLIANCE] = 114924, [ATLASLOOT_IT_HORDE] = 114925 },	-- Prototype Mekgineer's Chopper / Prototype Mechano-Hog
				{ 19, 114744 },	-- Sentry Turret Dispensor
				{ 20, 114633 },	-- XD-57 "Bullseye" Guided Rocket Kit
				{ 22, "ac9527" },	-- Terrific Technology
			},
		},
		{	-- Lunarfall Inn / Frostwall Tavern
			name = ALIL["LIFT"],
			[NORMAL_DIFF] = {
				{ 1, 118921, "pet1566", [QUEST_EXTRA_ITTYPE] = 37150 },	-- Everbloom Peachick
				{ 2, 118923, "pet1567", [QUEST_EXTRA_ITTYPE] = 37164 },	-- Sentinel's Companion
				{ 4, 119083, [QUEST_EXTRA_ITTYPE] = 37152 },	-- Fruit Basket
				{ 5, 118937, [QUEST_EXTRA_ITTYPE] = 37160 },	-- Gamon's Braid
				{ 6, 119039, [QUEST_EXTRA_ITTYPE] = 37156 },	-- Lilian's Warning Sign
				{ 7, 118938, [QUEST_EXTRA_ITTYPE] = 37179 },	-- Manastorm's Duplicator
				{ 8, 119003, [QUEST_EXTRA_ITTYPE] = 37163 },	-- Void Totem
				{ 10, 119093, [QUEST_EXTRA_ITTYPE] = 37159 },	-- Aviana's Feather
				{ 11, 118935, [QUEST_EXTRA_ITTYPE] = 37165 },	-- Ever-Blooming Frond
				{ 12, 118936, [QUEST_EXTRA_ITTYPE] = 37149 },	-- Manual of Void-Calling
				{ 13, 119092, [QUEST_EXTRA_ITTYPE] = 37157 },	-- Moroes' Famous Polish
				{ 14, 118922, [QUEST_EXTRA_ITTYPE] = 37148 },	-- Oralius' Whispering Crystal
				{ 16, 118930, [QUEST_EXTRA_ITTYPE] = 37166 },	-- Bag of Everbloom Herbs
				{ 17, 118924, [QUEST_EXTRA_ITTYPE] = 37167 },	-- Cache of Arms
				{ 18, 118928, [QUEST_EXTRA_ITTYPE] = 37158 },	-- Faintly-Sparkling Cache
				{ 19, 118926, [QUEST_EXTRA_ITTYPE] = 37161 },	-- Huge Pile of Skins
				{ 20, 118931, [QUEST_EXTRA_ITTYPE] = 37154 },	-- Leonid's Bag of Supplies
				{ 21, 118927, [QUEST_EXTRA_ITTYPE] = 37162 },	-- Maximillian's Laundry
				{ 22, 118925, [QUEST_EXTRA_ITTYPE] = 37155 },	-- Plundered Booty
				{ 23, 118929, [QUEST_EXTRA_ITTYPE] = 37153 },	-- Sack of Mined Ore
				{ 25, 118918, [QUEST_EXTRA_ITTYPE] = 37151 },	-- Bloody Bandanna
				{ 27, 119207, [PRICE_EXTRA_ITTYPE] = "money:50000000" },	-- Meat Cleaver
				{ 29, "ac9703" },	-- Stay Awhile and Listen
			},
		},
		{
			name = AL["Primal Trader"],
			[NORMAL_DIFF] = {
				{ 1, 110611, [PRICE_EXTRA_ITTYPE] = "120945:10" },	-- Burnished Leather
				{ 2, 111366, [PRICE_EXTRA_ITTYPE] = "120945:10" },	-- Gearspring Parts
				{ 3, 111556, [PRICE_EXTRA_ITTYPE] = "120945:10" },	-- Hexweave Cloth
				{ 4, 115524, [PRICE_EXTRA_ITTYPE] = "120945:10" },	-- Taladite Crystal
				{ 5, 108257, [PRICE_EXTRA_ITTYPE] = "120945:10" },	-- Truesteel Ingot
				{ 6, 112377, [PRICE_EXTRA_ITTYPE] = "120945:10" },	-- War Paints
				{ 16, 108996, [PRICE_EXTRA_ITTYPE] = "120945:10" },	-- Alchemical Catalyst
				{ 17, 118472, [PRICE_EXTRA_ITTYPE] = "120945:50" },	-- Savage Blood
				{ 18, 113264, [PRICE_EXTRA_ITTYPE] = "120945:25" },	-- Sorcerous Air
				{ 19, 113263, [PRICE_EXTRA_ITTYPE] = "120945:25" },	-- Sorcerous Earth
				{ 20, 113261, [PRICE_EXTRA_ITTYPE] = "120945:25" },	-- Sorcerous Fire
				{ 21, 113262, [PRICE_EXTRA_ITTYPE] = "120945:25" },	-- Sorcerous Water
			},
		},
		{
			name = ALIL["Stables"],
			[NORMAL_DIFF] = {
				{ 1, 116656, "mount" },	-- Trained Icehoof
				{ 2, 116662, "mount" },	-- Trained Meadowstomper
				{ 3, 116676, "mount" },	-- Trained Riverwallow
				{ 4, 116675, "mount" },	-- Trained Rocktusk
				{ 5, 116774, "mount" },	-- Trained Silverpelt
				{ 6, 116784, "mount" },	-- Trained Snarler
				{ 16, [ATLASLOOT_IT_ALLIANCE] = { "ac9539", "mount171629" }, [ATLASLOOT_IT_HORDE] = { "ac9705", "mount171629" } },	-- Armored Frostboar
				{ 17, "ac9526" },	-- Master of Mounts
				{ 18, [ATLASLOOT_IT_ALLIANCE] = { "ac9540", "mount171838" }, [ATLASLOOT_IT_HORDE] = { "ac9706", "mount171838" } },	-- Armored Frostwolf
			},
		},
		{
			name = ALIL["The Tannery"],
			[NORMAL_DIFF] = {
				{ 1, 116993, "prof176408" },	-- Archmage's Tent
				{ 2, 116994, "prof176409" },	-- Brute's Tent
				{ 3, 116996, "prof176412" },	-- Crusader's Tent
				{ 4, 117000, "prof176415" },	-- Deathweaver's Hovel
				{ 5, 117005, "prof176421" },	-- Distressingly Furry Tent
				{ 6, 116991, "prof176404" },	-- Enchanter's Tent
				{ 7, 116986, "prof176392" },	-- Fine Blue and Gold Tent
				{ 8, 116988, "prof176399" },	-- Fine Blue and Green Tent
				{ 9, 116987, "prof176397" },	-- Fine Blue and Purple Tent
				{ 10, 116989, "prof176401" },	-- Ironskin Tent
				{ 11, 117009, "prof176426" },	-- Nomad's Spiked Tent
				{ 12, 116990, "prof176402" },	-- Outcast's Tent
				{ 13, 117001, "prof176416" },	-- Patchwork Hut
				{ 14, 116992, "prof176405" },	-- Savage Leather Tent
				{ 15, 117004, "prof176420" },	-- Simple Tent
				{ 16, 116995, "prof176411" },	-- Sturdy Tent
				{ 17, 117008, "prof176425" },	-- Voodoo Doctor's Hovel
				{ 19, [ATLASLOOT_IT_ALLIANCE] = { 117002, "prof176417" }, [ATLASLOOT_IT_HORDE] = { 116997, "prof176413" } },	-- Elune's Retreat / Blood Elven Tent
				{ 20, [ATLASLOOT_IT_ALLIANCE] = { 116998, "prof176414" }, [ATLASLOOT_IT_HORDE] = { 117003, "prof176418" } },	-- High Elven Tent / Orgrimmar's Reach
				{ 21, [ATLASLOOT_IT_ALLIANCE] = { 117006, "prof176422" }, [ATLASLOOT_IT_HORDE] = { 117007, "prof176424" } },	-- Ornate Alliance Tent / Ornate Horde Tent
			},
		},
	},
}

data["HEIRLOOM"] = {
	name = AL["Heirloom"],
	ContentType = COLLECTION_CONTENT,
	items = 
	{
		{	--ArmorWeaponEnhancements
			name = AL["Armor Enhancements"].." / "..AL["Weapon Enhancements"],
			[NORMAL_DIFF] = {
				{ 1, 122338, [PRICE_EXTRA_ITTYPE] = "money:10000000-darkmoon:100-championsseal:55-honor:2000-ancestrycoin:40" },	-- Ancient Heirloom Armor Casing
				{ 2, 122340, [PRICE_EXTRA_ITTYPE] = "money:20000000-ancestrycoin:75" },	-- Timeworn Heirloom Armor Casing
				{ 16, 122339, [PRICE_EXTRA_ITTYPE] = "money:12000000-darkmoon:120-championsseal:65-honor:2400-lovetoken:200" },	-- Ancient Heirloom Scabbard
				{ 17, 122341, [PRICE_EXTRA_ITTYPE] = "money:50000000-lovetoken:450" },	-- Timeworn Heirloom Scabbard
			},
		},
		{	--HeirloomClothCloaks
			name = AL["Cloth"].." / "..AL["Cloaks"],
			[NORMAL_DIFF] = {
				{ 1, "122250:Stage3H", 122340 },	-- Tattered Dreadmist Mask  (Stage 3)
				{ 2, "122250:Stage2H", 122338 },	-- Tattered Dreadmist Mask  (Stage 2)
				{ 3, "122250", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Tattered Dreadmist Mask
				{ 5, "122360:Stage3H", 122340 },	-- Tattered Dreadmist Mantle (Stage 3)
				{ 6, "122360:Stage2H", 122338 },	-- Tattered Dreadmist Mantle (Stage 2)
				{ 7, "122360", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Tattered Dreadmist Mantle
				{ 9, "122384:Stage3H", 122340 },	-- Tattered Dreadmist Robe (Stage 3)
				{ 10, "122384:Stage2H", 122338 },	-- Tattered Dreadmist Robe (Stage 2)
				{ 11, "122384", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Tattered Dreadmist Robe
				{ 13, "122256:Stage3H", 122340 },	-- Tattered Dreadmist Leggings (Stage 3)
				{ 14, "122256:Stage2H", 122338 },	-- Tattered Dreadmist Leggings (Stage 2)
				{ 15, "122256", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Tattered Dreadmist Leggings
				{ 16, "122262:Stage3H", 122340 },	-- Ancient Bloodmoon Cloak (Stage 3)
				{ 17, "122262:Stage2H", 122338 },	-- Ancient Bloodmoon Cloak (Stage 2)
				{ 18, "122262", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Ancient Bloodmoon Cloak
				{ 20, "122261:Stage3H", 122340 },	-- Inherited Cape of the Black Baron (Stage 3)
				{ 21, "122261:Stage2H", 122338 },	-- Inherited Cape of the Black Baron (Stage 2)
				{ 22, "122261", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Inherited Cape of the Black Baron
				{ 24, "122266:Stage3H", 122340 },	-- Ripped Sandstorm Cloak (Stage 3)
				{ 25, "122266:Stage2H", 122338 },	-- Ripped Sandstorm Cloak (Stage 2)
				{ 26, "122266", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Ripped Sandstorm Cloak
				{ 28, "122260:Stage3H", 122340 },	-- Worn Stoneskin Gargoyle Cape (Stage 3)
				{ 29, "122260:Stage2H", 122338 },	-- Worn Stoneskin Gargoyle Cape (Stage 2)
				{ 30, "122260", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Worn Stoneskin Gargoyle Cape
			},
		},
		{	--HeirloomLeather
			name = AL["Leather"],
			[NORMAL_DIFF] = {
				{ 1, "122248:Stage3H", 122340 },	-- Stained Shadowcraft Cap  (Stage 3)
				{ 2, "122248:Stage2H", 122338 },	-- Stained Shadowcraft Cap  (Stage 2)
				{ 3, "122248", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Stained Shadowcraft Cap
				{ 5, "122358:Stage3H", 122340 },	-- Stained Shadowcraft Spaulders (Stage 3)
				{ 6, "122358:Stage2H", 122338 },	-- Stained Shadowcraft Spaulders (Stage 2)
				{ 7, "122358", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Stained Shadowcraft Spaulders
				{ 9, "122383:Stage3H", 122340 },	-- Stained Shadowcraft Tunic (Stage 3)
				{ 10, "122383:Stage2H", 122338 },	-- Stained Shadowcraft Tunic (Stage 2)
				{ 11, "122383", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Stained Shadowcraft Tunic
				{ 13, "122254:Stage3H", 122340 },	-- Stained Shadowcraft Pants (Stage 3)
				{ 14, "122254:Stage2H", 122338 },	-- Stained Shadowcraft Pants (Stage 2)
				{ 15, "122254", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Stained Shadowcraft Pants
				{ 16, "122249:Stage3H", 122340 },	-- Preened Tribal War Feathers (Stage 3)
				{ 17, "122249:Stage2H", 122338 },	-- Preened Tribal War Feathers (Stage 2)
				{ 18, "122249", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Preened Tribal War Feathers
				{ 20, "122359:Stage3H", 122340 },	-- Preened Ironfeather Shoulders (Stage 3)
				{ 21, "122359:Stage2H", 122338 },	-- Preened Ironfeather Shoulders (Stage 2)
				{ 22, "122359", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Preened Ironfeather Shoulders
				{ 24, "122382:Stage3H", 122340 },	-- Preened Ironfeather Breastplate (Stage 3)
				{ 25, "122382:Stage2H", 122338 },	-- Preened Ironfeather Breastplate (Stage 2)
				{ 26, "122382", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Preened Ironfeather Breastplate
				{ 28, "122255:Stage3H", 122340 },	-- Preened Wildfeather Leggings (Stage 3)
				{ 29, "122255:Stage2H", 122338 },	-- Preened Wildfeather Leggings (Stage 2)
				{ 30, "122255", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Preened Wildfeather Leggings
			},
		},
		{	--HeirloomMail
			name = AL["Mail"],
			[NORMAL_DIFF] = {
				{ 1, "122246:Stage3H", 122340 },	-- Tarnished Raging Berserker's Helm (Stage 3)
				{ 2, "122246:Stage2H", 122338 },	-- Tarnished Raging Berserker's Helm (Stage 2)
				{ 3, "122246", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Tarnished Raging Berserker's Helm
				{ 5, "122356:Stage3H", 122340 },	-- Champion Herod's Shoulder (Stage 3)
				{ 6, "122356:Stage2H", 122338 },	-- Champion Herod's Shoulder (Stage 2)
				{ 7, "122356", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Champion Herod's Shoulder
				{ 9, "122379:Stage3H", 122340 },	-- Champion's Deathdealer Breastplate (Stage 3)
				{ 10, "122379:Stage2H", 122338 },	-- Champion's Deathdealer Breastplate (Stage 2)
				{ 11, "122379", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Champion's Deathdealer Breastplate
				{ 13, "122252:Stage3H", 122340 },	-- Tarnished Leggings of Destruction (Stage 3)
				{ 14, "122252:Stage2H", 122338 },	-- Tarnished Leggings of Destruction (Stage 2)
				{ 15, "122252", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Tarnished Leggings of Destruction
				{ 16, "122247:Stage3H", 122340 },	-- Mystical Coif of Elements (Stage 3)
				{ 17, "122247:Stage2H", 122338 },	-- Mystical Coif of Elements (Stage 2)
				{ 18, "122247", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Mystical Coif of Elements
				{ 20, "122357:Stage3H", 122340 },	-- Mystical Pauldrons of Elements (Stage 3)
				{ 21, "122357:Stage2H", 122338 },	-- Mystical Pauldrons of Elements (Stage 2)
				{ 22, "122357", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Mystical Pauldrons of Elements
				{ 24, "122380:Stage3H", 122340 },	-- Mystical Vest of Elements (Stage 3)
				{ 25, "122380:Stage2H", 122338 },	-- Mystical Vest of Elements (Stage 2)
				{ 26, "122380", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Mystical Vest of Elements
				{ 28, "122253:Stage3H", 122340 },	-- Mystical Kilt of Elements (Stage 3)
				{ 29, "122253:Stage2H", 122338 },	-- Mystical Kilt of Elements (Stage 2)
				{ 30, "122253", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Mystical Kilt of Elements
			},
		},
		{	--HeirloomPlate
			name = AL["Plate"],
			[NORMAL_DIFF] = {
				{ 1, "122263:Stage3H", 122340 },	-- Burnished Helm of Might (Stage 3)
				{ 2, "122263:Stage2H", 122338 },	-- Burnished Helm of Might (Stage 2)
				{ 3, "122263", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Burnished Helm of Might
				{ 5, "122388:Stage3H", 122340 },	-- Burnished Pauldrons of Might (Stage 3)
				{ 6, "122388:Stage2H", 122338 },	-- Burnished Pauldrons of Might (Stage 2)
				{ 7, "122388", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Burnished Pauldrons of Might
				{ 9, "122387:Stage3H", 122340 },	-- Burnished Breastplate of Might (Stage 3)
				{ 10, "122387:Stage2H", 122338 },	-- Burnished Breastplate of Might (Stage 2)
				{ 11, "122387", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Burnished Breastplate of Might
				{ 13, "122264:Stage3H", 122340 },	-- Burnished Legplates of Might (Stage 3)
				{ 14, "122264:Stage2H", 122338 },	-- Burnished Legplates of Might (Stage 2)
				{ 15, "122264", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Burnished Legplates of Might
				{ 16, "122245:Stage3H", 122340 },	-- Polished Helm of Valor (Stage 3)
				{ 17, "122245:Stage2H", 122338 },	-- Polished Helm of Valor (Stage 2)
				{ 18, "122245", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Polished Helm of Valor
				{ 20, "122355:Stage3H", 122340 },	-- Polished Spaulders of Valor (Stage 3)
				{ 21, "122355:Stage2H", 122338 },	-- Polished Spaulders of Valor (Stage 2)
				{ 22, "122355", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Polished Spaulders of Valor
				{ 24, "122381:Stage3H", 122340 },	-- Polished Breastplate of Valor (Stage 3)
				{ 25, "122381:Stage2H", 122338 },	-- Polished Breastplate of Valor (Stage 2)
				{ 26, "122381", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Polished Breastplate of Valor
				{ 28, "122251:Stage3H", 122340 },	-- Polished Legplates of Valor (Stage 3)
				{ 29, "122251:Stage2H", 122338 },	-- Polished Legplates of Valor (Stage 2)
				{ 30, "122251", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Polished Legplates of Valor
				{ 101, "127012:Stage3H", 122340 },	-- Pristine Lightforge Helm
				{ 102, "127012:Stage2H", 122338},	-- Pristine Lightforge Helm
				{ 103, "127012", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Pristine Lightforge Helm
				{ 105, "127011:Stage3H", 122340 },	-- Pristine Lightforge Breastplate
				{ 106, "127011:Stage2H", 122338 },	-- Pristine Lightforge Breastplate
				{ 107, "127011", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Pristine Lightforge Breastplate
				{ 109, "127012:Stage3H", 122340 },	-- Pristine Lightforge Legplates
				{ 110, "127012:Stage2H", 122338 },	-- Pristine Lightforge Legplates
				{ 111, "127012", [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Pristine Lightforge Legplates
			},
		},
		{	--HeirloomWeapons
			name = AL["Weapons"].." & "..AL["Shields"],
			[NORMAL_DIFF] = {
				{ 1, "122349:Stage3H", 122341 },	-- Bloodied Arcanite Reaper
				{ 2, "122349:Stage2H", 122339 },	-- Bloodied Arcanite Reaper
				{ 3, "122349", [PRICE_EXTRA_ITTYPE] = "money:7500000-darkmoon:75-championsseal:40" },	-- Bloodied Arcanite Reaper
				{ 5, "122352:Stage3H", 122341 },	-- Charmed Ancient Bone Bow
				{ 6, "122352:Stage2H", 122339 },	-- Charmed Ancient Bone Bow
				{ 7, "122352", [PRICE_EXTRA_ITTYPE] = "money:7500000-darkmoon:75-championsseal:40" },	-- Charmed Ancient Bone Bow
				{ 9, "122353:Stage3H", 122341 },	-- Dignified Headmaster's Charge
				{ 10, "122353:Stage2H", 122339 },	-- Dignified Headmaster's Charge
				{ 11, "122353", [PRICE_EXTRA_ITTYPE] = "money:7500000-darkmoon:75-championsseal:40" },	-- Dignified Headmaster's Charge
				{ 13, "122363:Stage3H", 122341 },	-- Burnished Warden Staff
				{ 14, "122363:Stage2H", 122339 },	-- Burnished Warden Staff
				{ 15, "122363", [PRICE_EXTRA_ITTYPE] = "money:7500000-darkmoon:75-championsseal:40" },	-- Burnished Warden Staff
				{ 16, "122386:Stage3H", 122341 },	-- Repurposed Lava Dredger
				{ 17, "122386:Stage2H", 122339 },	-- Repurposed Lava Dredger
				{ 18, "122386", [PRICE_EXTRA_ITTYPE] = "money:7500000-darkmoon:75-championsseal:40" },	-- Repurposed Lava Dredger
				{ 20, "122391:Stage3H", 122340 },	-- Flamescarred Draconian Deflector
				{ 21, "122391:Stage2H", 122338 },	-- Flamescarred Draconian Deflector
				{ 22, "122391", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Flamescarred Draconian Deflector
				{ 24, "122392:Stage3H", 122340 },	-- Weathered Observer's Shield
				{ 25, "122392:Stage2H", 122338 },	-- Weathered Observer's Shield
				{ 26, "122392", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Weathered Observer's Shield
				{ 28, "122390:Stage3H", 122340 },	-- Musty Tome of the Lost
				{ 29, "122390:Stage2H", 122338 },	-- Musty Tome of the Lost
				{ 30, "122390", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:50-championsseal:25" },	-- Musty Tome of the Lost
				{ 101, "122350:Stage3H", 122341 },	-- Balanced Heartseeker
				{ 102, "122350:Stage2H", 122339 },	-- Balanced Heartseeker
				{ 103, "122350", [PRICE_EXTRA_ITTYPE] = "money:6500000-darkmoon:50-championsseal:25" },	-- Balanced Heartseeker
				{ 105, "122351:Stage3H", 122341 },	-- Venerable Dal'Rend's Sacred Charge
				{ 106, "122351:Stage2H", 122339 },	-- Venerable Dal'Rend's Sacred Charge
				{ 107, "122351", [PRICE_EXTRA_ITTYPE] = "money:6500000-darkmoon:50-championsseal:25" },	-- Venerable Dal'Rend's Sacred Charge
				{ 109, "122354:Stage3H", 122341 },	-- Devout Aurastone Hammer
				{ 110, "122354:Stage2H", 122339 },	-- Devout Aurastone Hammer
				{ 111, "122354", [PRICE_EXTRA_ITTYPE] = "money:6500000-darkmoon:50-championsseal:25" },	-- Devout Aurastone Hammer
				{ 113, "122385:Stage3H", 122341 },	-- Venerable Mass of McGowan
				{ 114, "122385:Stage2H", 122339 },	-- Venerable Mass of McGowan
				{ 115, "122385", [PRICE_EXTRA_ITTYPE] = "money:6500000-darkmoon:50-championsseal:25" },	-- Venerable Mass of McGowan
				{ 116, "122389:Stage3H", 122341 },	-- Bloodsoaked Skullforge Reaver
				{ 117, "122389:Stage2H", 122339 },	-- Bloodsoaked Skullforge Reaver
				{ 118, "122389", [PRICE_EXTRA_ITTYPE] = "money:6500000-darkmoon:50-championsseal:25" },	-- Bloodsoaked Skullforge Reaver
				{ 120, "122396:Stage3H", 122341 },	-- Brawler's Razor Claws
				{ 121, "122396:Stage2H", 122339 },	-- Brawler's Razor Claws
				{ 122, "122396", [PRICE_EXTRA_ITTYPE] = "money:8000000" },	-- Brawler's Razor Claws
			},
		},
		{	--HeirloomTrinketsNecklacesRings
			name = AL["Trinkets"].." & "..AL["Necklaces"].." & "..AL["Rings"],
			[NORMAL_DIFF] = {
				{ 1, "122362:Stage3H", 122340 },	-- Discerning Eye of the Beast
				{ 2, "122362:Stage2H", 122338 },	-- Discerning Eye of the Beast
				{ 3, "122362", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:70-championsseal:35" },	-- Discerning Eye of the Beast
				{ 5, "122662:Stage3H", 122340 },	-- Eternal Talisman of Evasion
				{ 6, "122662:Stage2H", 122338 },	-- Eternal Talisman of Evasion
				{ 7, "122662", [PRICE_EXTRA_ITTYPE] = "money:7000000" },	-- Eternal Talisman of Evasion
				{ 9, "122666:Stage3H", 122340 },	-- Eternal Woven Ivy Necklace
				{ 10, "122666:Stage2H", 122338 },	-- Eternal Woven Ivy Necklace
				{ 11, "122666", [PRICE_EXTRA_ITTYPE] = "money:7000000" },	-- Eternal Woven Ivy Necklace
				{ 13, "122663:Stage3H", 122340 },	-- Eternal Amulet of the Redeemed
				{ 14, "122663:Stage2H", 122338 },	-- Eternal Amulet of the Redeemed
				{ 15, "122663", [PRICE_EXTRA_ITTYPE] = "money:7000000" },	-- Eternal Amulet of the Redeemed
				{ 16, "122361:Stage3H", 122340 },	-- Swift Hand of Justice
				{ 17, "122361:Stage2H", 122338 },	-- Swift Hand of Justice
				{ 18, "122361", [PRICE_EXTRA_ITTYPE] = "money:5000000-darkmoon:70-championsseal:35" },	-- Swift Hand of Justice
				{ 20, "122667:Stage3H", 122340 },	-- Eternal Emberfury Talisman
				{ 21, "122667:Stage2H", 122338 },	-- Eternal Emberfury Talisman
				{ 22, "122667", [PRICE_EXTRA_ITTYPE] = "money:7000000" },	-- Eternal Emberfury Talisman
				{ 24, "122668:Stage3H", 122340 },	-- Eternal Will of the Martyr
				{ 25, "122668:Stage2H", 122338 },	-- Eternal Will of the Martyr
				{ 26, "122668", [PRICE_EXTRA_ITTYPE] = "money:7000000" },	-- Eternal Will of the Martyr
				{ 28, "122664:Stage3H", 122340 },	-- Eternal Horizon Choker
				{ 29, "122664:Stage2H", 122338 },	-- Eternal Horizon Choker
				{ 30, "122664", [PRICE_EXTRA_ITTYPE] = "money:7000000" },	-- Eternal Horizon Choker
				{ 101, "122529:Stage3H", 122340 },	-- Dread Pirate Ring
				{ 102, "122529:Stage2H", 122338 },	-- Dread Pirate Ring
				{ 103, "122529", [QUEST_EXTRA_ITTYPE] = 8193 },	-- Dread Pirate Ring
				{ 105, "128169:Stage3H", 122340 },	-- Signet of the Third Fleet
				{ 106, "128169:Stage2H", 122338 },	-- Signet of the Third Fleet
				{ 107, "128169" },	--, [QUEST_EXTRA_ITTYPE] = 8193 },	-- Signet of the Third Fleet
				{ 109, "128172:Stage3H", 122340 },	-- Captain Sander's Returned Band
				{ 110, "128172:Stage2H", 122338 },	-- Captain Sander's Returned Band
				{ 111, "128172" },	--, [QUEST_EXTRA_ITTYPE] = 8193 },	-- Captain Sander's Returned Band
				{ 113, "128173:Stage3H", 122340 },	-- Admiral Taylor's Loyalty Ring
				{ 114, "128173:Stage2H", 122338 },	-- Admiral Taylor's Loyalty Ring
				{ 115, "128173"},	--, [QUEST_EXTRA_ITTYPE] = 8193 },	-- Admiral Taylor's Loyalty Ring
				{ 116, "126948"},	--, [QUEST_EXTRA_ITTYPE] = 8193 },	-- Defending Champion
				{ 118, "126949"},	--, [QUEST_EXTRA_ITTYPE] = 8193 },	-- Returning Champion
				{ 120, "128318"},	--, [QUEST_EXTRA_ITTYPE] = 8193 },	-- Touch of the Void
			},
		},
		{	--HeirloomPVPArmor
			name = AL["PvP"].." "..AL["Armor"],
			[NORMAL_DIFF] = {
				{ 1, "122372:Stage3H", 122340 },	-- Strengthened Stockade Pauldrons
				{ 2, "122372:Stage2H", 122338 },	-- Strengthened Stockade Pauldrons
				{ 3, "122372", [PRICE_EXTRA_ITTYPE] = "money:5000000-honor:1000" },	-- Strengthened Stockade Pauldrons
				{ 16, "122373:Stage3H", 122340 },	-- Pristine Lightforge Spaulders
				{ 17, "122373:Stage2H", 122338 },	-- Pristine Lightforge Spaulders
				{ 18, "122373", [PRICE_EXTRA_ITTYPE] = "money:5000000-honor:1000" },	-- Pristine Lightforge Spaulders
				{ 5, "122374:Stage3H", 122340 },	-- Prized Beastmaster's Mantle
				{ 6, "122374:Stage2H", 122338 },	-- Prized Beastmaster's Mantle
				{ 7, "122374", [PRICE_EXTRA_ITTYPE] = "money:5000000-honor:1000" },	-- Prized Beastmaster's Mantle
				{ 20, "122375:Stage3H", 122340 },	-- Aged Pauldrons of The Five Thunders
				{ 21, "122375:Stage2H", 122338 },	-- Aged Pauldrons of The Five Thunders
				{ 22, "122375", [PRICE_EXTRA_ITTYPE] = "money:5000000-honor:1000" },	-- Aged Pauldrons of The Five Thunders
				{ 9, "122376:Stage3H", 122340 },	-- Exceptional Stormshroud Shoulders
				{ 10, "122376:Stage2H", 122338 },	-- Exceptional Stormshroud Shoulders
				{ 11, "122376", [PRICE_EXTRA_ITTYPE] = "money:5000000-honor:1000" },	-- Exceptional Stormshroud Shoulders
				{ 24, "122377:Stage3H", 122340 },	-- Lasting Feralheart Spaulders
				{ 25, "122377:Stage2H", 122338 },	-- Lasting Feralheart Spaulders
				{ 26, "122377", [PRICE_EXTRA_ITTYPE] = "money:5000000-honor:1000" },	-- Lasting Feralheart Spaulders
				{ 13, "122378:Stage3H", 122340 },	-- Exquisite Sunderseer Mantle
				{ 14, "122378:Stage2H", 122338 },	-- Exquisite Sunderseer Mantle
				{ 15, "122378", [PRICE_EXTRA_ITTYPE] = "money:5000000-honor:1000" },	-- Exquisite Sunderseer Mantle
			},
		},
		{	--HeirloomPVPWeapon
			name = AL["PvP"].." "..AL["Weapons"],
			[NORMAL_DIFF] = {
				{ 1, "122364:Stage3H", 122341 },	-- Sharpened Scarlet Kris
				{ 2, "122364:Stage2H", 122339 },	-- Sharpened Scarlet Kris
				{ 3, "122364", [PRICE_EXTRA_ITTYPE] = "money:6500000-honor:1000" },	-- Sharpened Scarlet Kris
				{ 5, "122367:Stage3H", 122341 },	-- The Blessed Hammer of Grace
				{ 6, "122367:Stage2H", 122339 },	-- The Blessed Hammer of Grace
				{ 7, "122367", [PRICE_EXTRA_ITTYPE] = "money:6500000-honor:1000" },	-- The Blessed Hammer of Grace
				{ 9, "122369:Stage3H", 122341 },	-- Battleworn Thrash Blade
				{ 10, "122369:Stage2H", 122339 },	-- Battleworn Thrash Blade
				{ 11, "122369", [PRICE_EXTRA_ITTYPE] = "money:6500000-honor:1000" },	-- Battleworn Thrash Blade
				{ 16, "122366:Stage3H", 122341 },	-- Upgraded Dwarven Hand Cannon
				{ 17, "122366:Stage2H", 122339 },	-- Upgraded Dwarven Hand Cannon
				{ 18, "122366", [PRICE_EXTRA_ITTYPE] = "money:7500000-honor:1500" },	-- Upgraded Dwarven Hand Cannon
				{ 20, "122368:Stage3H", 122341 },	-- Grand Staff of Jordan
				{ 21, "122368:Stage2H", 122339 },	-- Grand Staff of Jordan
				{ 22, "122368", [PRICE_EXTRA_ITTYPE] = "money:7500000-honor:1500" },	-- Grand Staff of Jordan
				{ 24, "122365:Stage3H", 122341 },	-- Reforged Truesilver Champion
				{ 25, "122365:Stage2H", 122339 },	-- Reforged Truesilver Champion
				{ 26, "122365", [PRICE_EXTRA_ITTYPE] = "money:7500000-honor:1500" },	-- Reforged Truesilver Champion

			},
		},
		{	--HeirloomPVPTrinkets
			name = AL["PvP"].." "..AL["Trinkets"],
			[ALLIANCE_DIFF] = {
				{ 1, "122530:Stage3H", 122340 },	-- Inherited Mark of Tyranny
				{ 2, "122530:Stage2H", 122338 },	-- Inherited Mark of Tyranny
				{ 3, "122530", [PRICE_EXTRA_ITTYPE] = "money:7000000-honor:1250" },	-- Strengthened Stockade Pauldrons
				{ 16, "122371:Stage3H", 122340 },	-- Inherited Insignia of the Alliance
				{ 17, "122371:Stage2H", 122338 },	-- Inherited Insignia of the Alliance
				{ 18, "122371", [PRICE_EXTRA_ITTYPE] = "money:7000000-honor:1250" },	-- Inherited Insignia of the Alliance
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 16, "122370:Stage3H", 122340 },	-- Inherited Insignia of the Horde
				{ 17, "122370:Stage2H", 122338 },	-- Inherited Insignia of the Horde
				{ 18, "122370", [PRICE_EXTRA_ITTYPE] = "money:7000000-honor:1250" },	-- Inherited Insignia of the Horde
			},
		},
		{	--HeirloomMiscellaneous
			name = AL["Miscellaneous"],
			[NORMAL_DIFF] = {
				{ 1, 122703, "ac9909" },	-- Chauffeured Chopper
			},
		},
	},
}

data["LEGION_LEGENDARIES"] = {
	name = AL["Legendary Items"].." - "..EXPANSION_NAME6,
	ContentType = COLLECTION_CONTENT,
	items = {
		{ -- all classes
			name = ALL_CLASSES,
			[LEGENDARY_DIFF] = {
				{ 1, 144249 }, -- Archimonde's Hatred Reborn
				{ 2, 144258 }, -- Velen's Future Sight
				{ 3, 144259 }, -- Kil'jaeden's Burning Wish
				{ 4, 132444 }, -- Prydaz, Xavaric's Magnum Opus
				{ 5, 132452 }, -- Sephuz's Secret
				{ 16, 143613 }, -- Distilled Titan Essence
			},
		},
		{ -- DEATHKNIGHT
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[LEGENDARY_DIFF] = {
				{ 1 , 144280 }, -- Death March
				{ 2 , 132459 }, -- Perseverance of the Ebon Martyr
				{ 3 , 137075 }, -- Tak'theritrix's Shoulderpads
				{ 4 , 144281 }, -- Skullflower's Haemostasis
				{ 5 , 132376 }, -- Acherus Drapes
				{ 6 , 132366 }, -- Koltira's Newfound Will
				{ 7 , 132367 }, -- Service of Gorefiend
				{ 8 , 132441 }, -- Draugr, Girdle of the Everlasting King
				{ 9 , 144293 }, -- Consort's Cold Core
				{ 10, 132453 }, -- Rattlegore Bone Legplates
				{ 11, 132365 }, -- Shackles of Bryndaor
				{ 12, 132458 }, -- Toravon's Whiteout Bindings
				{ 13, 132448 }, -- The Instructor's Fourth Lesson
				{ 14, 137037 }, -- Uvanimor, the Unbeautiful
				{ 15, 137223 }, -- Seal of Necrofantasia
				{ 16, 133974 }, -- Lana'thel's Lament
			},
		},
		{ -- DEMONHUNTER
			name = ATLASLOOT_DEMONHUNTER_COLOR..ALIL["DEMONHUNTER"],
			[LEGENDARY_DIFF] = {
				{ 1 , 137061 }, -- Raddon's Cascading Eyes
				{ 2 , 144279 }, -- Delusions of Grandeur
				{ 3 , 137071 }, -- Runemaster's Pauldrons
				{ 4 , 137014 }, -- Achor, the Eternal Hunger
				{ 5 , 137066 }, -- Cloak of Fel Flames
				{ 6 , 133976 }, -- Cinidaria, the Symbiote
				{ 7 , 138949 }, -- Kirel Narak
				{ 8 , 137022 }, -- Loramus Thalipedes' Sacrifice
				{ 9 , 137091 }, -- The Defiler's Lost Vambraces
				{ 10, 137090 }, -- Mo'arg Bionic Stabilizers
				{ 11, 144292 }, -- Spirit of the Darkness Flame
				{ 12, 138854 }, -- Fragment of the Betrayer's Prison
				{ 13, 137038 }, -- Anger of the Half-Giants
			},
		},
		{ -- DRUID
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[LEGENDARY_DIFF] = {
				{ 1 , 144432 }, -- Oakheart's Puny Quods
				{ 2 , 137062 }, -- The Emerald Dreamcatcher
				{ 3 , 137072 }, -- Aman'Thul's Wisdom
				{ 4 , 144295 }, -- Lady and the Child
				{ 5 , 137015 }, -- Ekowraith, Creator of Worlds
				{ 6 , 137078 }, -- The Dark Titan's Advice
				{ 7 , 133976 }, -- Cinidaria, the Symbiote
				{ 8 , 144354 }, -- Fiery Red Maimers
				{ 9 , 137067 }, -- Elize's Everlasting Encasement
				{ 10, 137023 }, -- Promise of Elune, the Moon Goddess
				{ 11, 137024 }, -- Ailuro Pouncers
				{ 12, 137025 }, -- Skysec's Hold
				{ 13, 137026 }, -- Essence of Infusion
				{ 14, 137092 }, -- Oneth's Intuition
				{ 15, 137095 }, -- Edraith, Bonds of Aglaya
				{ 16, 137056 }, -- Luffa Wrappings
				{ 17, 137094 }, -- The Wildshaper's Clutch
				{ 18, 144242 }, -- X'oni's Caress
				{ 19, 137039 }, -- Impeccable Fel Essence
				{ 20, 137040 }, -- Chatoyant Signet
				{ 21, 137041 }, -- Dual Determination
				{ 22, 137042 }, -- Tearstone of Elune
			},
		},
		{ -- HUNTER
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[LEGENDARY_DIFF] = {
				{ 1 , 137064 }, -- The Shadow Hunter's Voodoo Mask
				{ 2 , 144326 }, -- The Mantle of Command
				{ 3 , 144361 }, -- Butcher's Bone Apron
				{ 4 , 137082 }, -- Helbrine, Rope of the Mist Marauder
				{ 5 , 137080 }, -- Roar of the Seven Lions
				{ 6 , 137081 }, -- War Belt of the Sentinel Army
				{ 7 , 132466 }, -- Roots of Shaladrassil
				{ 8 , 137227 }, -- Qa'pla, Eredun War Order
				{ 9 , 137033 }, -- Ullr's Feather Snowshoes
				{ 10, 137034 }, -- Nesingwary's Trapping Treads
				{ 11, 141353 }, -- Magnetized Blasting Cap Launcher
				{ 12, 137101 }, -- Call of the Wild
				{ 13, 144303 }, -- MKII Gyroscopic Stabilizer
				{ 14, 137382 }, -- The Apex Predator's Claw
				{ 15, 137043 }, -- Frizzo's Fingertrap
				{ 16, 137055 }, -- Zevrim's Hunger
			},
		},
		{ -- MAGE
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[LEGENDARY_DIFF] = {
				{ 1 , 144274 }, -- Gravity Spiral
				{ 2 , 132863 }, -- Darckli's Dragonfire Diadem
				{ 3 , 144260 }, -- Ice Time
				{ 4 , 133977 }, -- Belo'vir's Final Stand
				{ 5 , 133970 }, -- Zann'esu Journey
				{ 6 , 132442 }, -- Cord of Infinity
				{ 7 , 132454 }, -- Koralon's Burning Touch
				{ 8 , 132451 }, -- Mystic Kilt of the Rune Master
				{ 9 , 132455 }, -- Norgannon's Foresight
				{ 10, 132406 }, -- Marquee Bindings of the Sun King
				{ 11, 132413 }, -- Rhonin's Assaulting Armwraps
				{ 12, 138140 }, -- Magtheridon's Banished Bracers
				{ 13, 144355 }, -- Pyrotex Ignition Cloth
				{ 14, 132411 }, -- Lady Vashj's Grasp
				{ 15, 132410 }, -- Shard of the Exodar
			},
		},
		{ -- MONK
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[LEGENDARY_DIFF] = {
				{ 1 , 137063 }, -- Fundamental Observation
				{ 2 , 137073 }, -- Unison Spaulders
				{ 3 , 144239 }, -- The Emperor's Capacitor
				{ 4 , 144340 }, -- Shelter of Rin
				{ 5 , 137016 }, -- Sal'salabim's Lost Tunic
				{ 6 , 137019 }, -- Cenedril, Reflector of Hatred
				{ 7 , 137079 }, -- Gai Plin's Soothing Sash
				{ 8 , 138879 }, -- Ovyd's Winter Wrap
				{ 9 , 133976 }, -- Cinidaria, the Symbiote
				{ 10, 137068 }, -- Leggings of The Black Flame
				{ 11, 137027 }, -- Firestone Walkers
				{ 12, 137028 }, -- Ei'thas, Lunar Glides of Eramas
				{ 13, 137029 }, -- Katsuo's Eclipse
				{ 14, 137096 }, -- Petrichor Lagniappe
				{ 15, 137097 }, -- Drinking Horn Cover
				{ 16, 144277 }, -- Anvil-Hardened Wristwraps
				{ 17, 137057 }, -- Hidden Master's Forbidden Touch
				{ 18, 137044 }, -- Jewel of the Lost Abbey
				{ 19, 137220 }, -- March of the Legion
				{ 20, 137045 }, -- Eye of Collidus the Warp-Watcher
			},
		},
		{ -- PALADIN
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[LEGENDARY_DIFF] = {
				{ 1 , 144275 }, -- Saruan's Resolve
				{ 2 , 137065 }, -- Justice Gaze
				{ 3 , 144358 }, -- Ashes to Dust
				{ 4 , 137076 }, -- Obsidian Stone Spaulders
				{ 5 , 137017 }, -- Breastplate of the Golden Val'kyr
				{ 6 , 137020 }, -- Whisper of the Nathrezim
				{ 7 , 144273 }, -- Maraad's Dying Breath
				{ 8 , 137086 }, -- Chain of Thrayn
				{ 9 , 137070 }, -- Tyelca, Ferren Marcus's Stature
				{ 10, 132443 }, -- Aggramar's Stride
				{ 11, 137105 }, -- Uther's Guard
				{ 12, 140846 }, -- Aegisjalmur, the Armguards of Awe
				{ 13, 137059 }, -- Tyr's Hand of Faith
				{ 14, 137046 }, -- Ilterendi, Crown Jewel of Silvermoon
				{ 15, 137047 }, -- Heathcliff's Immortality
				{ 16, 137048 }, -- Liadrin's Fury Unleashed
			},
		},
		{ -- PRIEST
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[LEGENDARY_DIFF] = {
				{ 1 , 133971 }, -- Zenk'aram, Iridi's Anadem
				{ 2 , 144244 }, -- Kam Xi'raff
				{ 3 , 132437 }, -- Mother Shahraz's Seduction
				{ 4 , 132861 }, -- Estel, Dejahna's Inspiration
				{ 5 , 137109 }, -- X'anshi, Shroud of Archbishop Benedictus
				{ 6 , 144438 }, -- Zeks Exterminatus
				{ 7 , 133800 }, -- Cord of Maiev, Priestess of the Moon
				{ 8 , 132864 }, -- Mangaza's Madness
				{ 9 , 132445 }, -- Al'maiesh, the Cord of Hope
				{ 10, 132447 }, -- Entrancing Trousers of An'juna
				{ 11, 132455 }, -- Norgannon's Foresight
				{ 12, 132409 }, -- Anund's Seared Shackles
				{ 13, 132436 }, -- Skjoldr, Sanctuary of Ivagont
				{ 14, 132450 }, -- Muze's Unwavering Will
				{ 15, 144247 }, -- Rammal's Ulterior Motive
				{ 16, 132461 }, -- Xalan the Feared's Clench
				{ 17, 133973 }, -- The Twins' Painful Touch
				{ 18, 137276 }, -- N'ero, Band of Promises
				{ 19, 132449 }, -- Phyrix's Embrace
			},
		},
		{ -- ROGUE
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[LEGENDARY_DIFF] = {
				{ 1 , 144236 }, -- Mantle of the Master Assassin
				{ 2 , 137021 }, -- The Dreadlord's Deceit
				{ 3 , 133976 }, -- Cinidaria, the Symbiote
				{ 4 , 137069 }, -- Will of Valeera
				{ 5 , 137032 }, -- Shadow Satyr's Walk
				{ 6 , 137031 }, -- Thraxi's Tricksy Treads
				{ 7 , 137030 }, -- Duskwalker's Footpads
				{ 8 , 137100 }, -- Denial of the Half-Giants
				{ 9 , 137099 }, -- Greenskin's Waterlogged Wristcuffs
				{ 10, 137098 }, -- Zoldyck Family Training Shackles
				{ 11, 141321 }, -- Shivarran Symmetry
				{ 12, 137049 }, -- Insignia of Ravenholdt
			},
		},
		{ -- SHAMAN
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[LEGENDARY_DIFF] = {
				{ 1 , 143732 }, -- Uncertain Reminder
				{ 2 , 137074 }, -- Echoes of the Great Sundering
				{ 3 , 137616 }, -- Emalon's Charged Core
				{ 4 , 137103 }, -- Storm Tempests
				{ 5 , 137085 }, -- Intact Nazjatar Molting
				{ 6 , 137083 }, -- Pristine Proto-Scale Girdle
				{ 7 , 132466 }, -- Roots of Shaladrassil
				{ 8 , 138117 }, -- Spiritual Journey
				{ 9 , 137035 }, -- The Deceiver's Blood Pact
				{ 10, 137036 }, -- Elemental Rebalancers
				{ 11, 137102 }, -- Al'Akir's Acrimony
				{ 12, 137104 }, -- Nobundo's Redemption
				{ 13, 137084 }, -- Akainu's Absolute Justice
				{ 14, 137058 }, -- Praetorian's Tidecallers
				{ 15, 137050 }, -- Eye of the Twisting Nether
				{ 16, 137051 }, -- Focuser of Jonat, the Elder
			},
		},
		{ -- WARLOCK
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[LEGENDARY_DIFF] = {
				{ 1 , 144385 }, -- Wakener's Loyalty
				{ 2 , 132394 }, -- Hood of Eternal Disdain
				{ 3 , 144369 }, -- Lessons of Space-Time
				{ 4 , 132393 }, -- Recurrent Ritual
				{ 5 , 144364 }, -- Reap and Sow
				{ 6 , 132375 }, -- Odr, Shawl of the Ymirjar
				{ 7 , 132456 }, -- Feretory of Souls
				{ 8 , 132457 }, -- Power Cord of Lethtendris
				{ 9 , 132374 }, -- Kazzak's Final Curse
				{ 10, 132357 }, -- Pillars of the Dark Portal
				{ 11, 132455 }, -- Norgannon's Foresight
				{ 12, 132379 }, -- Sin'dorei Spite
				{ 13, 132381 }, -- Streten's Sleepless Shackles
				{ 14, 132407 }, -- Magistrike Restraints
				{ 15, 132460 }, -- Alythess's Pyrogenics
				{ 16, 132369 }, -- Wilfred's Sigil of Superior Summoning
				{ 17, 132378 }, -- Sacrolash's Dark Strike
			},
		},
		{ -- WARRIOR
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[LEGENDARY_DIFF] = {
				{ 1 , 137088 }, -- Ceann-Ar Charger
				{ 2 , 143728 }, -- Timeless Stratagem
				{ 3 , 137018 }, -- Destiny Driver
				{ 4 , 137053 }, -- Kazzalax, Fujieda's Fury
				{ 5 , 137089 }, -- Thundergod's Vigor
				{ 6 , 137087 }, -- Naj'entus's Vertebrae
				{ 7 , 137077 }, -- Weight of the Earth
				{ 8 , 132443 }, -- Aggramar's Stride
				{ 9 , 137107 }, -- Mannoroth's Bloodletting Manacles
				{ 10, 137108 }, -- Kakushan's Stormscale Gauntlets
				{ 11, 137060 }, -- Archavon's Heavy Hand
				{ 12, 137052 }, -- Ayala's Stone Heart
				{ 13, 137054 }, -- The Walls Fell
			},
		},
	},
}

data["LEGENDARIES"] = {
	name = AL["Legendary Items"],
	ContentType = COLLECTION_CONTENT,
	items = {
		{-- Warlords of Draenor
			name = EXPANSION_NAME5,
			[ALLIANCE_DIFF] = {
				{ 1, 124634, "ac10021" },	-- Thorasus, the Stone Heart of Draenor
				{ 2, 124635, "ac10021" },	-- Nithramus, the All-Seer
				{ 3, 124636, "ac10021" },	-- Maalus, the Blood Drinker
				{ 4, 124637, "ac10021" },	-- Sanctus, Sigil of the Unbroken
				{ 5, 124638, "ac10021" },	-- Etheralus, the Eternal Reward
				{ 16, 127785 },	-- Crystallized Fel
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 1, 124634, "ac10148" },	-- Thorasus, the Stone Heart of Draenor
				{ 2, 124635, "ac10148" },	-- Nithramus, the All-Seer
				{ 3, 124636, "ac10148" },	-- Maalus, the Blood Drinker
				{ 4, 124637, "ac10148" },	-- Sanctus, Sigil of the Unbroken
				{ 5, 124638, "ac10148" },	-- Etheralus, the Eternal Reward
			},
		},
		{-- Mists of Pandaria
			name = EXPANSION_NAME4,
			[ALLIANCE_DIFF] = {
				{ 1, 102248, "ac8325" },	-- Fen-Yu, Fury of Xuen
				{ 2, 102249, "ac8325" },	-- Gong-Lu, Strength of Xuen
				{ 3, 102247, "ac8325" },	-- Jina-Kang, Kindness of Chi-Ji
				{ 4, 102245, "ac8325" },	-- Qian-Le, Courage of Niuzao
				{ 5, 102250, "ac8325" },	-- Qian-Ying, Fortitude of Niuzao
				{ 6, 102246, "ac8325" },	-- Xing-Ho, Breath of Yu'lon
				{ 8, 95346, "ac7535" },	-- Capacitive Primal Diamond
				{ 9, 95345, "ac7535" },	-- Courageous Primal Diamond
				{ 10, 95344, "ac7535" },	-- Indomitable Primal Diamond
				{ 11, 95347, "ac7535" },	-- Sinister Primal Diamond
				{ 16, 93403, "ac7534" },	-- Eye of the Black Prince
				{ 19, 89873, "ac7533" },	-- Crystallized Dread
				{ 20, 89882, "ac7533" },	-- Crystallized Horror
				{ 21, 89881, "ac7533" },	-- Crystallized Terror
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 16, 93403, "ac8008" },	-- Eye of the Black Prince
			},
		},
		{-- Cataclysm
			name = EXPANSION_NAME3,
			[NORMAL_DIFF] = {
				{ 1, 77949, "ac6181" },	-- Golad, Twilight of Aspects
				{ 2, 77950, "ac6181" },	-- Tiriosh, Nightmare of Ages
				{ 3, 77947 },	-- The Sleeper
				{ 4, 77948 },	-- The Dreamer
				{ 5, 77945 },	-- Fear
				{ 6, 77946 },	-- Vengeance
				{ 16, 71086, "ac5839" },	-- Dragonwrath, Tarecgosa's Rest
				{ 17, 71085 },	-- Runestaff of Nordrassil
				{ 18, 71084 },	-- Branch of Nordrassil
			},
		},
		{-- Wrath of the Lich King
			name = EXPANSION_NAME2,
			[NORMAL_DIFF] = {
				{ 1, 49623, "ac4623" },	-- Shadowmourne
				{ 2, 49888 },	-- Shadow's Edge
				{ 16, 46017, "ac3142" },	-- Val'anyr, Hammer of Ancient Kings
			},
		},
		{-- The Burning Crusade
			name = EXPANSION_NAME1,
			[NORMAL_DIFF] = {
				{ 1, 34334, "ac725" },	-- Thori'dal, the Stars' Fury
				{ 3, 32837, "ac426" },	-- Warglaive of Azzinoth
				{ 4, 32838, "ac426" },	-- Warglaive of Azzinoth
				{ 16, 30312 },	-- Infinity Blade
				{ 17, 30311 },	-- Warp Slicer
				{ 18, 30316 },	-- Devastation
				{ 19, 30317 },	-- Cosmic Infuse
				{ 20, 30313 },	-- Staff of Disintegration
				{ 21, 30318 },	-- Netherstrand Longbow
				{ 22, 30314 },	-- Phaseshift Bulwark
			},
		},
		{-- Classic
			name = EXPANSION_NAME0,
			[NORMAL_DIFF] = {
				{ 1, 22632, "ac425" },	-- Atiesh, Greatstaff of the Guardian
				{ 2, 22589, "ac425" },	-- Atiesh, Greatstaff of the Guardian
				{ 3, 22631, "ac425" },	-- Atiesh, Greatstaff of the Guardian
				{ 4, 22630, "ac425" },	-- Atiesh, Greatstaff of the Guardian
				{ 6, 21176, "ac416" },	-- Black Qiraji Resonating Crystal
				{ 16, 19019, "ac428" },	-- Thunderfury, Blessed Blade of the Windseeker
				{ 18, 17182, "ac429" },	-- Sulfuras, Hand of Ragnaros
				{ 19, 17193 },	-- Sulfuron Hammer
			},
		},
	},
}

data["MOLTENFRONT"] = {
	name = ALIL["Molten Front"].." "..AL["Rewards"],
	ContentType = COLLECTION_CONTENT,
	items = {
		{
			name = AL["Vendor"]..": "..AL["Zen'Vorka"],
			[ALLIANCE_DIFF] = {
				{ 1, 70108, [PRICE_EXTRA_ITTYPE] = "money:1801998" },	-- Pyrelord Greaves
				{ 2, 70107, [PRICE_EXTRA_ITTYPE] = "money:1014508" },	-- Fireheart Necklace
				{ 3, 70106, [PRICE_EXTRA_ITTYPE] = "money:1014508" },	-- Nightweaver's Amulet
				{ 4, 70105, [PRICE_EXTRA_ITTYPE] = "money:1014508" },	-- Matoclaw's Band
				{ 6, 71631, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Zen'Vorka's Cache
				{ 16, 70145, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Darnassus Writ of Commendation
				{ 17, 70146, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Exodar Writ of Commendation
				{ 18, 71087, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Gilneas Writ of Commendation
				{ 19, 70147, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Gnomeregan Writ of Commendation
				{ 20, 70148, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Ironforge Writ of Commendation
				{ 21, 70152, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Stormwind Writ of Commendation
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 16, 71088, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Bilgewater Writ of Commendation
				{ 17, 70149, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Orgrimmar Writ of Commendation
				{ 18, 70150, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Sen'jin Writ of Commendation
				{ 19, 70151, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Silvermoon Writ of Commendation
				{ 20, 70153, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Thunder Bluff Writ of Commendation
				{ 21, 70154, [PRICE_EXTRA_ITTYPE] = "worldtree:30" },	-- Undercity Writ of Commendation
			},
		},
		{
			name = AL["Vendor"]..": "..AL["Ayla Shadowstorm"],
			[NORMAL_DIFF] = {
				{ 1, "INV_Box_01", nil, AL["Ayla Shadowstorm"], nil, [QUEST_EXTRA_ITTYPE] = 29279 },
				{ 2, 70110, [PRICE_EXTRA_ITTYPE] = "money:1014508" },	-- Band of Glittering Lights
				{ 3, 70113, [PRICE_EXTRA_ITTYPE] = "money:1014508" },	-- Moon Blessed Band
				{ 4, 70142, [PRICE_EXTRA_ITTYPE] = "money:1528525" },	-- Moonwell Chalice
				{ 5, 70143, [PRICE_EXTRA_ITTYPE] = "money:1528525" },	-- Moonwell Phial
				{ 6, 70112, [PRICE_EXTRA_ITTYPE] = "money:982176" },	-- Globe of Moonlight
				{ 17, 70175, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Pattern: Triple-Reinforced Mining Bag (p7 500)
				{ 18, 70174, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Pattern: Royal Scribe's Satchel (p7 510)
				{ 19, 70176, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Pattern: Luxurious Silk Gem Bag (p8 515)
				{ 21, 70160, "pet318", [PRICE_EXTRA_ITTYPE] = "money:15000000" },	-- Crimson Lasher
				{ 22, 70161, [PRICE_EXTRA_ITTYPE] = "money:5000000" },	-- Mushroom Chair
			},
		},
		{
			name = AL["Vendor"]..": "..AL["Varlan Highbough"],
			[NORMAL_DIFF] = {
				{ 1, "INV_Box_01", nil, AL["Varlan Highbough"], nil, [QUEST_EXTRA_ITTYPE] = 29283 },
				{ 2, 70122, [PRICE_EXTRA_ITTYPE] = "money:840360" },	-- Aviana's Grips
				{ 3, 70123, [PRICE_EXTRA_ITTYPE] = "money:1525210" },	-- Lancer's Greaves
				{ 4, 70127, [PRICE_EXTRA_ITTYPE] = "money:1014508" },	-- Lylagar Horn Ring
				{ 5, 70126, [PRICE_EXTRA_ITTYPE] = "money:1014508" },	-- Nemesis Shell Band
				{ 6, 70124, [PRICE_EXTRA_ITTYPE] = "money:1014508" },	-- Spirit Fragment Band
				{ 7, 70141, [PRICE_EXTRA_ITTYPE] = "money:1528525" },	-- Dwyer's Caber
				{ 17, 70140, "pet317", [PRICE_EXTRA_ITTYPE] = "money:15000000" },	-- Hyjal Bear Cub
				{ 18, 70159, [PRICE_EXTRA_ITTYPE] = "money:35000000" },	-- Mylune's Call
			},
		},
		{
			name = AL["Vendor"]..": "..AL["Damek Bloombeard"],
			[NORMAL_DIFF] = {
				{ 1, "INV_Box_01", nil, AL["Damek Bloombeard"], nil, [QUEST_EXTRA_ITTYPE] = 29281 },
				{ 2, 70118, [PRICE_EXTRA_ITTYPE] = "money:731902" },	-- Widow's Clutches
				{ 3, 70114, [PRICE_EXTRA_ITTYPE] = "money:902050" },	-- Fireplume Girdle
				{ 4, 70115, [PRICE_EXTRA_ITTYPE] = "money:1636746" },	-- Fiery Treads
				{ 5, 70121, [PRICE_EXTRA_ITTYPE] = "money:1178682" },	-- Ricket's Gun Show
				{ 6, 70116, [PRICE_EXTRA_ITTYPE] = "money:1279180" },	-- Gauntlets of Living Obsidium
				{ 7, 70117, [PRICE_EXTRA_ITTYPE] = "money:1283724" },	-- Belt of Living Obsidium
				{ 8, 70120, [PRICE_EXTRA_ITTYPE] = "money:1174260" },	-- Rickety Belt
				{ 9, 70119, [PRICE_EXTRA_ITTYPE] = "money:1014508" },	-- Meteorite Ring
				{ 10, 70144, [PRICE_EXTRA_ITTYPE] = "money:1528524" },	-- Ricket's Magnetic Fireball
				{ 17, 70166, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Plans: Brainsplinter (p2 525)
				{ 18, 70169, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Plans: Elementium-Edged Scalper (p2 525)
				{ 19, 70168, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Plans: Lightforged Elementium Hammer (p2 525)
				{ 20, 70172, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Plans: Masterwork Elementium Deathblade (p2 525)
				{ 21, 70167, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Plans: Masterwork Elementium Spellblade (p2 525)
				{ 22, 70170, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Plans: Pyrium Spellward (p2 525)
				{ 23, 70171, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Plans: Unbreakable Guardian (p2 525)
				{ 24, 70173, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Plans: Witch-Hunter's Harvester (p2 525)
				{ 25, 70177, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Schematic: Flintlocke's Woodchucker (p5 515)
				{ 26, 71078, [PRICE_EXTRA_ITTYPE] = "money:3000000" },	-- Schematic: Extreme-Impact Hole Puncher (p5 525)
			},
		},
	},
}

data["TABARDS"] = {
	name = AL["Tabards"],
	ContentType = COLLECTION_CONTENT,
	TableType = I_A_ITTYPE,
	items = {
		{ -- BFA
			name = EXPANSION_NAME7,
			CoinTexture = "Reputation",
			[ALLIANCE_DIFF] = {
				{ 1, 133670, [PRICE_EXTRA_ITTYPE] = "money:1000000" }, -- Slayer's Tabard
				{ 2, 160543 }, -- Tabard of the Tortollan Seekers
				{ 3, 160544, [PRICE_EXTRA_ITTYPE] = "money:6250000" }, -- Champions of Azeroth Tabard
				{ 4, 163055 }, -- Dueler's Tabard
				{ 5, 168619, [PRICE_EXTRA_ITTYPE] = "money:1024000" }, -- Rustbolt Resistance Tabard
				{ 6, 168915, [PRICE_EXTRA_ITTYPE] = "money:2000000" }, -- Tabard of Brew
				{ 7, 171361, [PRICE_EXTRA_ITTYPE] = "money:50000000100" }, -- Renowned Explorer's Tabard
				{ 8, 174647, [PRICE_EXTRA_ITTYPE] = "money:2400000" }, -- Rajani Tabard
				{ 9, 174648, [PRICE_EXTRA_ITTYPE] = "money:2400000" }, -- Uldum Accord Tabard
				{ 10, 160539, [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Tabard of the 7th Legion
				{ 11, 160540, [PRICE_EXTRA_ITTYPE] = "money:6250000" }, -- Proudmoore Admiralty Tabard
				{ 12, 160541, [PRICE_EXTRA_ITTYPE] = "money:6250000" }, -- Order of Embers Tabard
				{ 13, 160542, [PRICE_EXTRA_ITTYPE] = "money:6250000" }, -- Storm's Wake Tabard
				{ 14, 161329 }, -- Tabard of the Dark Iron
				{ 15, 165010 }, -- Tabard of Kul Tiras
				{ 16, 167811, [PRICE_EXTRA_ITTYPE] = "money:30000000" }, -- Brawler's Guild Tabard
				{ 17, 168610, [PRICE_EXTRA_ITTYPE] = "money:6250000" }, -- Tabard of the Waveblade Ankoan
				{ 18, 174068 }, -- Mechagonian Tabard
				{ 19, 164573 }, -- Dread Gladiator's Tabard
				{ 20, 164910 }, -- Sinister Gladiator's Tabard
				{ 21, 167363 }, -- Notorious Gladiator's Tabard
				{ 22, 172652 }, -- Corrupted Gladiator's Tabard	
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 10, 160545, [PRICE_EXTRA_ITTYPE] = "money:5000000" }, -- Tabard of the Honorbound
				{ 11, 160546, [PRICE_EXTRA_ITTYPE] = "money:6250000" }, -- Tabard of the Zandalari Empire
				{ 12, 160547, [PRICE_EXTRA_ITTYPE] = "money:6250000" }, -- Talanji's Expedition Tabard
				{ 13, 160548, [PRICE_EXTRA_ITTYPE] = "money:6250000" }, -- Tabard of the Voldunai
				{ 14, 161328 }, -- Tabard of the Mag'har Clans
				{ 15, 165001 }, -- Tabard of the Zandalari
				{ 16, 167812, [PRICE_EXTRA_ITTYPE] = "money:30000000" }, -- Brawler's Guild Tabard
				{ 17, 169274, [PRICE_EXTRA_ITTYPE] = "money:6250000" }, -- Tabard of the Unshackled
				{ 18, 174069 }, -- Tabard of the Vulpera
				{ 19, 164572 }, -- Dread Gladiator's Tabard
				{ 20, 164909 }, -- Sinister Gladiator's Tabard
				{ 21, 167362 }, -- Notorious Gladiator's Tabard
				{ 22, 172651 }, -- Corrupted Gladiator's Tabard
			},
		},
		{ -- Legion
			name = EXPANSION_NAME6,
			CoinTexture = "Reputation",
			[ALLIANCE_DIFF] = {
				{ 1, 138429 }, -- Cropped Tabard of the Scarlet Crusade
				{ 2, 142504 }, -- Hidden Tabard
				{ 3, 140575, [PRICE_EXTRA_ITTYPE] = "money:3000000" }, -- Nightfallen Tabard
				{ 4, 140576, [PRICE_EXTRA_ITTYPE] = "money:3000000" }, -- Tabard of the Highmountain Tribe
				{ 5, 140577, [PRICE_EXTRA_ITTYPE] = "money:3000000" }, -- Court of Farondis Tabard
				{ 6, 140578, [PRICE_EXTRA_ITTYPE] = "money:3000000" }, -- Dreamweaver Initiate's Tabard
				{ 7, 140579, [PRICE_EXTRA_ITTYPE] = "money:3000000" }, -- Valarjar Tabard
				{ 8, 140580, [PRICE_EXTRA_ITTYPE] = "money:3000000" }, -- Warden's Tabard
				{ 9, 140667, [PRICE_EXTRA_ITTYPE] = "money:6000000" }, -- Tabard of the Dreamweavers
				{ 10, 147205, [PRICE_EXTRA_ITTYPE] = "nethershard:10000" }, -- Legionfall Tabard
				{ 11, 152399, [PRICE_EXTRA_ITTYPE] = "money:3000000" }, -- Army of the Light Tabard
				{ 12, 152669, [PRICE_EXTRA_ITTYPE] = "money:3000000" }, -- Argussian Reach Tabard
				{ 13, 156666 }, -- Master Trainer's Tabard
				{ 14, 157756 }, -- Lightforged Tabard (Alliance)
				{ 15, 157758 }, -- Ren'dorei Tabard (Alliance)
				{ 16, 147337 }, -- Cruel Gladiator's Tabard
				{ 17, 147339 }, -- Ferocious Gladiator's Tabard
				{ 18, 149443 }, -- Fierce Gladiator's Tabard
				{ 19, 149447 }, -- Dominant Gladiator's Tabard
				{ 20, 149451 }, -- Demonic Gladiator's Tabard
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 14, 157757 }, -- Highmountain Tabard (Horde)
				{ 15, 157759 }, -- Shal'dorei Tabard (Horde)
				{ 16, 147336 }, -- Cruel Gladiator's Tabard
				{ 17, 147338 }, -- Ferocious Gladiator's Tabard
				{ 18, 149442 }, -- Fierce Gladiator's Tabard
				{ 19, 149446 }, -- Dominating Gladiator's Tabard
				{ 20, 149450 }, -- Demonic Gladiator's Tabard
			},
		},
		{ -- WoD
			name = EXPANSION_NAME5,
			CoinTexture = "Reputation",
			[ALLIANCE_DIFF] = {
				{ 1, 119136, [PRICE_EXTRA_ITTYPE] = "money:1000000" },	-- Arakkoa Outcasts Tabard	-- NEUTRAL
				{ 2, 119137, [PRICE_EXTRA_ITTYPE] = "money:1000000" },	-- Steamwheedle "Preservation" Society Tabard	-- NEUTRAL
				{ 3, 128449, [PRICE_EXTRA_ITTYPE] = "money:100000" }, -- Saberstalkers Tabard
				{ 4, 128450, [PRICE_EXTRA_ITTYPE] = "money:300000" }, -- Order of the Awakened Tabard
				{ 16, 119135, [PRICE_EXTRA_ITTYPE] = "money:1000000" },	-- Council of Exarchs Tabard
				{ 17, 119140, [PRICE_EXTRA_ITTYPE] = "money:1000000" },	-- Sha'tari Defense Tabard
				{ 18, 115517, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Wrynn's Vanguard Tabard
				{ 19, 118365, [QUEST_EXTRA_ITTYPE] = 37092 },	-- Stormwind Tabard
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 16, 119133, [PRICE_EXTRA_ITTYPE] = "money:1000000" },	-- Frostwolf Tabard
				{ 17, 119138, [PRICE_EXTRA_ITTYPE] = "money:1000000" },	-- Laughing Skull Orcs Tabard
				{ 18, 115518, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Vol'jin's Spear Tabard
				{ 19, 118372, [QUEST_EXTRA_ITTYPE] = 37043 },	-- Orgrimmar Tabard
			},
		},
		{ -- MoP
			name = EXPANSION_NAME4,
			CoinTexture = "Reputation",
			[ALLIANCE_DIFF] = {
				{ 1, 89401, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Anglers Tabard	-- NEUTRAL
				{ 2, 89799, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- August Celestials Tabard	-- NEUTRAL
				{ 3, 89797, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Golden Lotus Tabard	-- NEUTRAL
				{ 4, 89798, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Klaxxi Tabard	-- NEUTRAL
				{ 5, 89795, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Lorewalkers Tabard	-- NEUTRAL
				{ 6, 89796, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Order of the Cloud Serpent Tabard	-- NEUTRAL
				{ 7, 89800, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Shado-Pan Tabard	-- NEUTRAL
				{ 8, 97131, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Shado-Pan Assault Tabard	-- NEUTRAL
				{ 9, 89784, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Tillers Tabard	-- NEUTRAL
				{ 16, 95591, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Kirin Tor Offensive Tabard
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 16, 95592, [PRICE_EXTRA_ITTYPE] = "money:100000" },	-- Sunreaver Onslaught Tabard
			},
		},
		{ -- Cataclysm
			name = EXPANSION_NAME3,
			CoinTexture = "Reputation",
			[ALLIANCE_DIFF] = {
				{ 1, 65904, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Tabard of Ramkahen	-- NEUTRAL
				{ 2, 65905, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Tabard of the Earthen Ring	-- NEUTRAL
				{ 3, 65906, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Tabard of the Guardians of Hyjal	-- NEUTRAL
				{ 4, 65907, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Tabard of Therazane	-- NEUTRAL
				{ 16, 63379, [PRICE_EXTRA_ITTYPE] = "tolbarad:40" },	-- Baradin's Wardens Tabard
				{ 17, 65908, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Tabard of the Wildhammer Clan
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 16, 63378, [PRICE_EXTRA_ITTYPE] = "tolbarad:40" },	-- Hellscream's Reach Tabard
				{ 17, 65909, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Tabard of the Dragonmaw Clan
			},
		},
		{ -- WoLTK
			name = EXPANSION_NAME2,
			CoinTexture = "Reputation",
			[ALLIANCE_DIFF] = {
				{ 1, 43155, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Tabard of the Ebon Blade	-- NEUTRAL
				{ 2, 43157, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Tabard of the Kirin Tor	-- NEUTRAL
				{ 3, 43156, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Tabard of the Wyrmrest Accord	-- NEUTRAL
			},
			[HORDE_DIFF] = ALLIANCE_DIFF,
		},
		{ -- BC
			name = EXPANSION_NAME1,
			CoinTexture = "Reputation",
			[ALLIANCE_DIFF] = {
				{ 1, 31779, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Aldor Tabard	-- NEUTRAL
				{ 2, 31780, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Scryers Tabard	-- NEUTRAL
				{ 4, 31804, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Cenarion Expedition Tabard	-- NEUTRAL
				{ 5, 31776, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Consortium Tabard	-- NEUTRAL
				{ 6, 31777, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Keepers of Time Tabard	-- NEUTRAL
				{ 7, 31778, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Lower City Tabard	-- NEUTRAL
				{ 8, 32828, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Ogri'la Tabard	-- NEUTRAL
				{ 9, 31781, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Sha'tar Tabard	-- NEUTRAL
				{ 10, 32445, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Skyguard Tabard	-- NEUTRAL
				{ 11, 31775, [PRICE_EXTRA_ITTYPE] = "24245:10" },	-- Sporeggar Tabard	-- NEUTRAL
				{ 12, 35221, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Tabard of the Shattered Sun	-- NEUTRAL
				{ 16, 23999, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Honor Hold Tabard
				{ 17, 31774, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Honor Hold Tabard
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 16, 24004, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Thrallmar Tabard
				{ 17, 31773, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Mag'har Tabard
			},
		},
		{ -- Classic
			name = EXPANSION_NAME0,
			CoinTexture = "Reputation",
			[ALLIANCE_DIFF] = {
				{ 1, 43154, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Tabard of the Argent Crusade	-- NEUTRAL
			},
			[HORDE_DIFF] = ALLIANCE_DIFF
		},
		{ -- Faction
			name = AL["Factions"],
			CoinTexture = "Reputation",
			[ALLIANCE_DIFF] = {
				{ 1, 45579, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Darnassus Tabard
				{ 2, 45577, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Ironforge Tabard
				{ 3, 45578, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Gnomeregan Tabard
				{ 4, 45574, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Stormwind Tabard
				{ 16, 45580, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Exodar Tabard
				{ 17, 64882, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Gilneas Tabard
				{ 18, 83079, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Tushui Tabard
			},
			[HORDE_DIFF] = {
				{ 1, 45582, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Darkspear Tabard
				{ 2, 45581, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Orgrimmar Tabard
				{ 3, 45584, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Thunder Bluff Tabard
				{ 4, 45583, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Undercity Tabard
				{ 16, 45585, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Silvermoon City Tabard
				{ 17, 64884, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Bilgewater Cartel Tabard
				{ 18, 83080, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Huojin Tabard
			},
		},
		{ -- Guild
			name = AL["Guild"],
			CoinTexture = "Reputation",
			[NORMAL_DIFF] = {
				{ 1, 69210, [PRICE_EXTRA_ITTYPE] = "money:2500000" },	-- Guild Tabard	-- NEUTRAL
				{ 2, 69209, [PRICE_EXTRA_ITTYPE] = "money:1250000" },	-- Illustrious Guild Tabard -- NEUTRAL
				{ 3, 5976, [PRICE_EXTRA_ITTYPE] = "money:10000" },	-- Guild Tabard	-- NEUTRAL
			},
		},
		{ -- Achievement & Quest Rewards
			name = AL["Achievement & Quest Rewards"],
			CoinTexture = "Achievement",
			[ALLIANCE_DIFF] = {
				{ 1, 43300, 7520 },	-- Loremaster's Colors	-- NEUTRAL
				{ 2, 43349, 876 },	-- Tabard of Brute Force	-- NEUTRAL
				{ 3, 40643, 1021 },	-- Tabard of the Achiever	-- NEUTRAL
				{ 4, 43348, 45 },	-- Tabard of the Explorer	-- NEUTRAL
				{ 6, 49052, 3857 },	-- Tabard of Conquest
				{ 16, 24344, [QUEST_EXTRA_ITTYPE] = 9762 },	-- Tabard of the Hand
				{ 18, 35280, [QUEST_EXTRA_ITTYPE] = 11972 },	-- Tabard of Summer Flames
				{ 19, 35279, [QUEST_EXTRA_ITTYPE] = 11972 },	-- Tabard of Summer Skies
				{ 21, 31405, [QUEST_EXTRA_ITTYPE] = 10781 },	-- Purple Trophy Tabard of the Illidari
				{ 22, 31404, [QUEST_EXTRA_ITTYPE] = 10781 },	-- Green Trophy Tabard of the Illidari
				{ 24, 86468, [QUEST_EXTRA_ITTYPE] = 31820 },	-- Apron	-- NEUTRAL
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 6, 49054, 3957 },	-- Tabard of Conquest
				{ 16, 25549, [QUEST_EXTRA_ITTYPE] = 28473 },	-- Blood Knight Tabard
			},
		},
		{ -- Argent Tournament
			name = AL["Argent Tournament"],
			[ALLIANCE_DIFF] = {
				{ 1, 46874, [PRICE_EXTRA_ITTYPE] = "champseal:50" },	-- Argent Crusader's Tabard	-- NEUTRAL
				{ 3, 45579, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Darnassus Tabard
				{ 4, 45577, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Ironforge Tabard
				{ 5, 45578, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Gnomeregan Tabard
				{ 6, 45574, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Stormwind Tabard
				{ 16, 46817, [PRICE_EXTRA_ITTYPE] = "champseal:50" },	-- Silver Covenant Tabard
				{ 18, 45580, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Exodar Tabard
				{ 19, 64882, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Gilneas Tabard
				{ 20, 83079, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Tushui Tabard
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 16, 46818, [PRICE_EXTRA_ITTYPE] = "champseal:50" },	-- Sunreaver Tabard
				{ 3, 45582, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Darkspear Tabard
				{ 4, 45581, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Orgrimmar Tabard
				{ 5, 45584, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Thunder Bluff Tabard
				{ 6, 45583, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Undercity Tabard
				{ 18, 45585, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Silvermoon City Tabard
				{ 19, 64884, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Bilgewater Cartel Tabard
				{ 20, 83080, [PRICE_EXTRA_ITTYPE] = "money:1000" },	-- Huojin Tabard
			},
		},
		{ -- PvP
			name = AL["PvP"],
			[ALLIANCE_DIFF] = {
				{ 1, 115972, [PRICE_EXTRA_ITTYPE] = "conquest:1000" },	-- Primal Gladiator's Tabard
				{ 3, 15196, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Private's Tabard
				{ 4, 15198, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Knight's Colors
				{ 18, 19506, [PRICE_EXTRA_ITTYPE] = "markofhonor:10" },	-- Silverwing Battle Tabard
				{ 19, 19032, [PRICE_EXTRA_ITTYPE] = "markofhonor:10" },	-- Stormpike Battle Tabard
				{ 20, 20132, [PRICE_EXTRA_ITTYPE] = "markofhonor:10" },	-- Arathor Battle Tabard
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 3, 15197, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Scout's Tabard
				{ 4, 15199, [PRICE_EXTRA_ITTYPE] = "markofhonor:1" },	-- Stone Guard's Herald
				{ 18, 19505, [PRICE_EXTRA_ITTYPE] = "markofhonor:10" },	-- Warsong Battle Tabard
				{ 19, 19031, [PRICE_EXTRA_ITTYPE] = "markofhonor:10" },	-- Frostwolf Battle Tabard
				{ 20, 20131, [PRICE_EXTRA_ITTYPE] = "markofhonor:10" },	-- Battle Tabard of the Defilers
			},
		},
		{ -- Unobtainable Tabards
			name = AL["Unobtainable Tabards"],
			[NORMAL_DIFF] = {
				{ 1, 19160 },	-- Contest Winner's Tabard
				{ 3, 36941, 1636 },	-- Competitor's Tabard
				{ 4, 89196, 7467 },	-- Theramore Tabard
				{ 5, 22999, 2116 },	-- Tabard of the Argent Dawn
				{ 6, 28788, 2079 },	-- Tabard of the Protector
				{ 8, "ICON_achievement_featsofstrength_gladiator_10", nil, AL["Arena Reward"], nil },
				{ 9, 45983 },	-- Furious Gladiator's Tabard
				{ 10, 49086, },	-- Relentless Gladiator's Tabard
				{ 11, 51534 },	-- Wrathful Gladiator's Tabard
				{ 12, 98162 },	-- Tyrannical Gladiator's Tabard
				{ 13, 101697 },	-- Grievous Gladiator's Tabard
				{ 16, "INV_Box_01", nil, AL["Card Game Tabards"], nil },
				{ 17, 38312 },	-- Tabard of Brilliance
				{ 18, 23705 },	-- Tabard of Flame
				{ 19, 23709 },	-- Tabard of Frost
				{ 20, 38313 },	-- Tabard of Fury
				{ 21, 38309 },	-- Tabard of Nature
				{ 22, 38310 },	-- Tabard of the Arcane
				{ 23, 38314 },	-- Tabard of the Defender
				{ 24, 38311 },	-- Tabard of the Void
			},
		},
	},
}

data["TIERSETS"] = {
	name = AL["Tier Sets"],
	ContentType = COLLECTION_CONTENT,
	TableType = SET_ITTYPE,
	items = {
		{	-- Tier 1 Sets
			name = format(AL["Tier %d Sets"], 1).." ("..EXPANSION_NAME0..")",
			[NORMAL_DIFF] = {
				{ 1, "Tier1:druid:n" },
				{ 3, "Tier1:hunter:n" },
				{ 5, "Tier1:mage:n" },
				{ 7, "Tier1:paladin:n" },
				{ 9, "Tier1:priest:n" },
				{ 16, "Tier1:rogue:n" },
				{ 18, "Tier1:shaman:n" },
				{ 20, "Tier1:warlock:n" },
				{ 22, "Tier1:warrior:n" },
			},
		},
		{	-- Tier 2 Sets
			name = format(AL["Tier %d Sets"], 2).." ("..EXPANSION_NAME0..")",
			[NORMAL_DIFF] = {
				{ 1, "Tier2:druid:n" },
				{ 3, "Tier2:hunter:n" },
				{ 5, "Tier2:mage:n" },
				{ 7, "Tier2:paladin:n" },
				{ 9, "Tier2:priest:n" },
				{ 16, "Tier2:rogue:n" },
				{ 18, "Tier2:shaman:n" },
				{ 20, "Tier2:warlock:n" },
				{ 22, "Tier2:warrior:n" },
			},
		},
		{	-- Tier 3 Sets
			name = format(AL["Tier %d Sets"], 3).." ("..EXPANSION_NAME0..")",
			[NORMAL_DIFF] = {
				{ 1, "Tier3:druid:n" },
				{ 3, "Tier3:hunter:n" },
				{ 5, "Tier3:mage:n" },
				{ 7, "Tier3:paladin:n" },
				{ 9, "Tier3:priest:n" },
				{ 16, "Tier3:rogue:n" },
				{ 18, "Tier3:shaman:n" },
				{ 20, "Tier3:warlock:n" },
				{ 22, "Tier3:warrior:n" },
			},
		},
		{	-- Tier 4 Sets
			name = format(AL["Tier %d Sets"], 4).." ("..EXPANSION_NAME1..")",
			[NORMAL_DIFF] = {
				{ 1, "Tier4:druidbalance:n" },
				{ 2, "Tier4:druidferal:n" },
				{ 3, "Tier4:druidrestoration:n" },
				{ 5, "Tier4:hunter:n" },
				{ 7, "Tier4:mage:n" },
				{ 9, "Tier4:paladinholy:n" },
				{ 10, "Tier4:paladinprotection:n" },
				{ 11, "Tier4:paladinretribution:n" },
				{ 13, "Tier4:priestheal:n" },
				{ 14, "Tier4:priestshadow:n" },
				{ 16, "Tier4:rogue:n" },
				{ 18, "Tier4:shamanelemental:n" },
				{ 19, "Tier4:shamanenhancement:n" },
				{ 20, "Tier4:shamanrestoration:n" },
				{ 22, "Tier4:warlock:n" },
				{ 24, "Tier4:warriordps:n" },
				{ 25, "Tier4:warriorprotection:n" },
			},
		},
		{	-- Tier 5 Sets
			name = format(AL["Tier %d Sets"], 5).." ("..EXPANSION_NAME1..")",
			[P25_DIFF] = {
				{ 1, "Tier5:druidbalance:p25" },
				{ 2, "Tier5:druidferal:p25" },
				{ 3, "Tier5:druidrestoration:p25" },
				{ 5, "Tier5:hunter:p25" },
				{ 7, "Tier5:mage:p25" },
				{ 9, "Tier5:paladinholy:p25" },
				{ 10, "Tier5:paladinprotection:p25" },
				{ 11, "Tier5:paladinretribution:p25" },
				{ 13, "Tier5:priestheal:p25" },
				{ 14, "Tier5:priestshadow:p25" },
				{ 16, "Tier5:rogue:p25" },
				{ 18, "Tier5:shamanelemental:p25" },
				{ 19, "Tier5:shamanenhancement:p25" },
				{ 20, "Tier5:shamanrestoration:p25" },
				{ 22, "Tier5:warlock:p25" },
				{ 24, "Tier5:warriordps:p25" },
				{ 25, "Tier5:warriorprotection:p25" },
			},
		},
		{	-- Tier 6 Sets
			name = format(AL["Tier %d Sets"], 6).." ("..EXPANSION_NAME1..")",
			[P25_DIFF] = {
				{ 1, "Tier6:druidbalance:p25" },
				{ 2, "Tier6:druidferal:p25" },
				{ 3, "Tier6:druidrestoration:p25" },
				{ 5, "Tier6:hunter:p25" },
				{ 7, "Tier6:mage:p25" },
				{ 9, "Tier6:paladinholy:p25" },
				{ 10, "Tier6:paladinprotection:p25" },
				{ 11, "Tier6:paladinretribution:p25" },
				{ 13, "Tier6:priestheal:p25" },
				{ 14, "Tier6:priestshadow:p25" },
				{ 16, "Tier6:rogue:p25" },
				{ 18, "Tier6:shamanelemental:p25" },
				{ 19, "Tier6:shamanenhancement:p25" },
				{ 20, "Tier6:shamanrestoration:p25" },
				{ 22, "Tier6:warlock:p25" },
				{ 24, "Tier6:warriordps:p25" },
				{ 25, "Tier6:warriorprotection:p25" },
			},
		},
		{	-- Tier 7 Sets
			name = format(AL["Tier %d Sets"], 7).." ("..EXPANSION_NAME2..")",
			[NORMAL_DIFF] = {
				{ 1, "Tier7:deathknightblood:n" },
				{ 2, "Tier7:deathknightdps:n" },
				{ 4, "Tier7:druidbalance:n" },
				{ 5, "Tier7:druidferal:n" },
				{ 6, "Tier7:druidrestoration:n" },
				{ 8, "Tier7:hunter:n" },
				{ 10, "Tier7:mage:n" },
				{ 12, "Tier7:paladinholy:n" },
				{ 13, "Tier7:paladinprotection:n" },
				{ 14, "Tier7:paladinretribution:n" },
				{ 16, "Tier7:priestheal:n" },
				{ 17, "Tier7:priestshadow:n" },
				{ 19, "Tier7:rogue:n" },
				{ 21, "Tier7:shamanelemental:n" },
				{ 22, "Tier7:shamanenhancement:n" },
				{ 23, "Tier7:shamanrestoration:n" },
				{ 25, "Tier7:warlock:n" },
				{ 27, "Tier7:warriordps:n" },
				{ 28, "Tier7:warriorprotection:n" },
			},
			[P25_DIFF] = {
				{ 1, "Tier7:deathknightblood:p25" },
				{ 2, "Tier7:deathknightdps:p25" },
				{ 4, "Tier7:druidbalance:p25" },
				{ 5, "Tier7:druidferal:p25" },
				{ 6, "Tier7:druidrestoration:p25" },
				{ 8, "Tier7:hunter:p25" },
				{ 10, "Tier7:mage:p25" },
				{ 12, "Tier7:paladinholy:p25" },
				{ 13, "Tier7:paladinprotection:p25" },
				{ 14, "Tier7:paladinretribution:p25" },
				{ 16, "Tier7:priestheal:p25" },
				{ 17, "Tier7:priestshadow:p25" },
				{ 19, "Tier7:rogue:p25" },
				{ 21, "Tier7:shamanelemental:p25" },
				{ 22, "Tier7:shamanenhancement:p25" },
				{ 23, "Tier7:shamanrestoration:p25" },
				{ 25, "Tier7:warlock:p25" },
				{ 27, "Tier7:warriordps:p25" },
				{ 28, "Tier7:warriorprotection:p25" },
			},
		},
		{	-- Tier 8 Sets
			name = format(AL["Tier %d Sets"], 8).." ("..EXPANSION_NAME2..")",
			[NORMAL_DIFF] = {
				{ 1, "Tier8:deathknightblood:n" },
				{ 2, "Tier8:deathknightdps:n" },
				{ 4, "Tier8:druidbalance:n" },
				{ 5, "Tier8:druidferal:n" },
				{ 6, "Tier8:druidrestoration:n" },
				{ 8, "Tier8:hunter:n" },
				{ 10, "Tier8:mage:n" },
				{ 12, "Tier8:paladinholy:n" },
				{ 13, "Tier8:paladinprotection:n" },
				{ 14, "Tier8:paladinretribution:n" },
				{ 16, "Tier8:priestheal:n" },
				{ 17, "Tier8:priestshadow:n" },
				{ 19, "Tier8:rogue:n" },
				{ 21, "Tier8:shamanelemental:n" },
				{ 22, "Tier8:shamanenhancement:n" },
				{ 23, "Tier8:shamanrestoration:n" },
				{ 25, "Tier8:warlock:n" },
				{ 27, "Tier8:warriordps:n" },
				{ 28, "Tier8:warriorprotection:n" },
			},
			[P25_DIFF] = {
				{ 1, "Tier8:deathknightblood:p25" },
				{ 2, "Tier8:deathknightdps:p25" },
				{ 4, "Tier8:druidbalance:p25" },
				{ 5, "Tier8:druidferal:p25" },
				{ 6, "Tier8:druidrestoration:p25" },
				{ 8, "Tier8:hunter:p25" },
				{ 10, "Tier8:mage:p25" },
				{ 12, "Tier8:paladinholy:p25" },
				{ 13, "Tier8:paladinprotection:p25" },
				{ 14, "Tier8:paladinretribution:p25" },
				{ 16, "Tier8:priestheal:p25" },
				{ 17, "Tier8:priestshadow:p25" },
				{ 19, "Tier8:rogue:p25" },
				{ 21, "Tier8:shamanelemental:p25" },
				{ 22, "Tier8:shamanenhancement:p25" },
				{ 23, "Tier8:shamanrestoration:p25" },
				{ 25, "Tier8:warlock:p25" },
				{ 27, "Tier8:warriordps:p25" },
				{ 28, "Tier8:warriorprotection:p25" },
			},
		},
		{	-- Tier 9 Sets
			name = format(AL["Tier %d Sets"], 9).." ("..EXPANSION_NAME2..")",
			[NORMAL_DIFF] = {
				{ 1, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightblood:n", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightblood:n" },
				{ 2, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightdps:n", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightdps:n" },
				{ 4, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidbalance:n", [ATLASLOOT_IT_HORDE] = "Tier9H:druidbalance:n" },
				{ 5, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidferal:n", [ATLASLOOT_IT_HORDE] = "Tier9H:druidferal:n" },
				{ 6, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidrestoration:n", [ATLASLOOT_IT_HORDE] = "Tier9H:druidrestoration:n" },
				{ 8, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:hunter:n", [ATLASLOOT_IT_HORDE] = "Tier9H:hunter:n" },
				{ 10, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:mage:n", [ATLASLOOT_IT_HORDE] = "Tier9H:mage:n" },
				{ 12, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinholy:n", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinholy:n" },
				{ 13, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinprotection:n", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinprotection:n" },
				{ 14, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinretribution:n", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinretribution:n" },
				{ 16, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestheal:n", [ATLASLOOT_IT_HORDE] = "Tier9H:priestheal:n" },
				{ 17, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestshadow:n", [ATLASLOOT_IT_HORDE] = "Tier9H:priestshadow:n" },
				{ 19, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:rogue:n", [ATLASLOOT_IT_HORDE] = "Tier9H:rogue:n" },
				{ 21, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanelemental:n", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanelemental:n" },
				{ 22, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanenhancement:n", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanenhancement:n" },
				{ 23, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanrestoration:n", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanrestoration:n" },
				{ 25, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warlock:n", [ATLASLOOT_IT_HORDE] = "Tier9H:warlock:n" },
				{ 27, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriordps:n", [ATLASLOOT_IT_HORDE] = "Tier9H:warriordps:n" },
				{ 28, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriorprotection:n", [ATLASLOOT_IT_HORDE] = "Tier9H:warriorprotection:n" },
			},
			[P25_DIFF] = {
				{ 1, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightblood:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightblood:p25" },
				{ 2, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightdps:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightdps:p25" },
				{ 4, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidbalance:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:druidbalance:p25" },
				{ 5, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidferal:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:druidferal:p25" },
				{ 6, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidrestoration:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:druidrestoration:p25" },
				{ 8, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:hunter:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:hunter:p25" },
				{ 10, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:mage:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:mage:p25" },
				{ 12, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinholy:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinholy:p25" },
				{ 13, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinprotection:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinprotection:p25" },
				{ 14, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinretribution:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinretribution:p25" },
				{ 16, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestheal:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:priestheal:p25" },
				{ 17, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestshadow:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:priestshadow:p25" },
				{ 19, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:rogue:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:rogue:p25" },
				{ 21, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanelemental:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanelemental:p25" },
				{ 22, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanenhancement:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanenhancement:p25" },
				{ 23, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanrestoration:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanrestoration:p25" },
				{ 25, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warlock:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:warlock:p25" },
				{ 27, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriordps:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:warriordps:p25" },
				{ 28, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriorprotection:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:warriorprotection:p25" },
			},
			[P25H_DIFF] = {
				{ 1, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightblood:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightblood:p25h" },
				{ 2, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightdps:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightdps:p25h" },
				{ 4, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidbalance:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:druidbalance:p25h" },
				{ 5, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidferal:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:druidferal:p25h" },
				{ 6, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidrestoration:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:druidrestoration:p25h" },
				{ 8, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:hunter:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:hunter:p25h" },
				{ 10, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:mage:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:mage:p25h" },
				{ 12, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinholy:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinholy:p25h" },
				{ 13, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinprotection:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinprotection:p25h" },
				{ 14, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinretribution:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinretribution:p25h" },
				{ 16, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestheal:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:priestheal:p25h" },
				{ 17, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestshadow:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:priestshadow:p25h" },
				{ 19, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:rogue:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:rogue:p25h" },
				{ 21, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanelemental:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanelemental:p25h" },
				{ 22, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanenhancement:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanenhancement:p25h" },
				{ 23, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanrestoration:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanrestoration:p25h" },
				{ 25, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warlock:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:warlock:p25h" },
				{ 27, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriordps:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:warriordps:p25h" },
				{ 28, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriorprotection:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:warriorprotection:p25h" },
			},
		},
		{	-- Tier 10 Sets
			name = format(AL["Tier %d Sets"], 10).." ("..EXPANSION_NAME2..")",
			[NORMAL_DIFF] = {
				{ 1, "Tier10:deathknightblood:n" },
				{ 2, "Tier10:deathknightdps:n" },
				{ 4, "Tier10:druidbalance:n" },
				{ 5, "Tier10:druidferal:n" },
				{ 6, "Tier10:druidrestoration:n" },
				{ 8, "Tier10:hunter:n" },
				{ 10, "Tier10:mage:n" },
				{ 12, "Tier10:paladinholy:n" },
				{ 13, "Tier10:paladinprotection:n" },
				{ 14, "Tier10:paladinretribution:n" },
				{ 16, "Tier10:priestheal:n" },
				{ 17, "Tier10:priestshadow:n" },
				{ 19, "Tier10:rogue:n" },
				{ 21, "Tier10:shamanelemental:n" },
				{ 22, "Tier10:shamanenhancement:n" },
				{ 23, "Tier10:shamanrestoration:n" },
				{ 25, "Tier10:warlock:n" },
				{ 27, "Tier10:warriordps:n" },
				{ 28, "Tier10:warriorprotection:n" },
			},
			[P25_DIFF] = {
				{ 1, "Tier10:deathknightblood:p25" },
				{ 2, "Tier10:deathknightdps:p25" },
				{ 4, "Tier10:druidbalance:p25" },
				{ 5, "Tier10:druidferal:p25" },
				{ 6, "Tier10:druidrestoration:p25" },
				{ 8, "Tier10:hunter:p25" },
				{ 10, "Tier10:mage:p25" },
				{ 12, "Tier10:paladinholy:p25" },
				{ 13, "Tier10:paladinprotection:p25" },
				{ 14, "Tier10:paladinretribution:p25" },
				{ 16, "Tier10:priestheal:p25" },
				{ 17, "Tier10:priestshadow:p25" },
				{ 19, "Tier10:rogue:p25" },
				{ 21, "Tier10:shamanelemental:p25" },
				{ 22, "Tier10:shamanenhancement:p25" },
				{ 23, "Tier10:shamanrestoration:p25" },
				{ 25, "Tier10:warlock:p25" },
				{ 27, "Tier10:warriordps:p25" },
				{ 28, "Tier10:warriorprotection:p25" },
			},
			[P25H_DIFF] = {
				{ 1, "Tier10:deathknightblood:p25h" },
				{ 2, "Tier10:deathknightdps:p25h" },
				{ 4, "Tier10:druidbalance:p25h" },
				{ 5, "Tier10:druidferal:p25h" },
				{ 6, "Tier10:druidrestoration:p25h" },
				{ 8, "Tier10:hunter:p25h" },
				{ 10, "Tier10:mage:p25h" },
				{ 12, "Tier10:paladinholy:p25h" },
				{ 13, "Tier10:paladinprotection:p25h" },
				{ 14, "Tier10:paladinretribution:p25h" },
				{ 16, "Tier10:priestheal:p25h" },
				{ 17, "Tier10:priestshadow:p25h" },
				{ 19, "Tier10:rogue:p25h" },
				{ 21, "Tier10:shamanelemental:p25h" },
				{ 22, "Tier10:shamanenhancement:p25h" },
				{ 23, "Tier10:shamanrestoration:p25h" },
				{ 25, "Tier10:warlock:p25h" },
				{ 27, "Tier10:warriordps:p25h" },
				{ 28, "Tier10:warriorprotection:p25h" },
			},
		},
		{	-- Tier 11 Sets
			name = format(AL["Tier %d Sets"], 11).." ("..EXPANSION_NAME3..")",
			[NORMAL_DIFF] = {
				{ 1, "Tier11:deathknightblood:n" },
				{ 2, "Tier11:deathknightdps:n" },
				{ 4, "Tier11:druidbalance:n" },
				{ 5, "Tier11:druidferal:n" },
				{ 6, "Tier11:druidrestoration:n" },
				{ 8, "Tier11:hunter:n" },
				{ 10, "Tier11:mage:n" },
				{ 12, "Tier11:paladinholy:n" },
				{ 13, "Tier11:paladinprotection:n" },
				{ 14, "Tier11:paladinretribution:n" },
				{ 16, "Tier11:priestheal:n" },
				{ 17, "Tier11:priestshadow:n" },
				{ 19, "Tier11:rogue:n" },
				{ 21, "Tier11:shamanelemental:n" },
				{ 22, "Tier11:shamanenhancement:n" },
				{ 23, "Tier11:shamanrestoration:n" },
				{ 25, "Tier11:warlock:n" },
				{ 27, "Tier11:warriordps:n" },
				{ 28, "Tier11:warriorprotection:n" },
			},
			[HEROIC_DIFF] = {
				{ 1, "Tier11:deathknightblood:h" },
				{ 2, "Tier11:deathknightdps:h" },
				{ 4, "Tier11:druidbalance:h" },
				{ 5, "Tier11:druidferal:h" },
				{ 6, "Tier11:druidrestoration:h" },
				{ 8, "Tier11:hunter:h" },
				{ 10, "Tier11:mage:h" },
				{ 12, "Tier11:paladinholy:h" },
				{ 13, "Tier11:paladinprotection:h" },
				{ 14, "Tier11:paladinretribution:h" },
				{ 16, "Tier11:priestheal:h" },
				{ 17, "Tier11:priestshadow:h" },
				{ 19, "Tier11:rogue:h" },
				{ 21, "Tier11:shamanelemental:h" },
				{ 22, "Tier11:shamanenhancement:h" },
				{ 23, "Tier11:shamanrestoration:h" },
				{ 25, "Tier11:warlock:h" },
				{ 27, "Tier11:warriordps:h" },
				{ 28, "Tier11:warriorprotection:h" },
			},
		},
		{	-- Tier 12 Sets
			name = format(AL["Tier %d Sets"], 12).." ("..EXPANSION_NAME3..")",
			[NORMAL_DIFF] = {
				{ 1, "Tier12:deathknightblood:n" },
				{ 2, "Tier12:deathknightdps:n" },
				{ 4, "Tier12:druidbalance:n" },
				{ 5, "Tier12:druidferal:n" },
				{ 6, "Tier12:druidrestoration:n" },
				{ 8, "Tier12:hunter:n" },
				{ 10, "Tier12:mage:n" },
				{ 12, "Tier12:paladinholy:n" },
				{ 13, "Tier12:paladinprotection:n" },
				{ 14, "Tier12:paladinretribution:n" },
				{ 16, "Tier12:priestheal:n" },
				{ 17, "Tier12:priestshadow:n" },
				{ 19, "Tier12:rogue:n" },
				{ 21, "Tier12:shamanelemental:n" },
				{ 22, "Tier12:shamanenhancement:n" },
				{ 23, "Tier12:shamanrestoration:n" },
				{ 25, "Tier12:warlock:n" },
				{ 27, "Tier12:warriordps:n" },
				{ 28, "Tier12:warriorprotection:n" },
			},
			[HEROIC_DIFF] = {
				{ 1, "Tier12:deathknightblood:h" },
				{ 2, "Tier12:deathknightdps:h" },
				{ 4, "Tier12:druidbalance:h" },
				{ 5, "Tier12:druidferal:h" },
				{ 6, "Tier12:druidrestoration:h" },
				{ 8, "Tier12:hunter:h" },
				{ 10, "Tier12:mage:h" },
				{ 12, "Tier12:paladinholy:h" },
				{ 13, "Tier12:paladinprotection:h" },
				{ 14, "Tier12:paladinretribution:h" },
				{ 16, "Tier12:priestheal:h" },
				{ 17, "Tier12:priestshadow:h" },
				{ 19, "Tier12:rogue:h" },
				{ 21, "Tier12:shamanelemental:h" },
				{ 22, "Tier12:shamanenhancement:h" },
				{ 23, "Tier12:shamanrestoration:h" },
				{ 25, "Tier12:warlock:h" },
				{ 27, "Tier12:warriordps:h" },
				{ 28, "Tier12:warriorprotection:h" },
			},
		},
		{	-- Tier 13 Sets
			name = format(AL["Tier %d Sets"], 13).." ("..EXPANSION_NAME3..")",
			[RF_DIFF] = {
				{ 1, "Tier13:deathknightblood:rf" },
				{ 2, "Tier13:deathknightdps:rf" },
				{ 4, "Tier13:druidbalance:rf" },
				{ 5, "Tier13:druidferal:rf" },
				{ 6, "Tier13:druidrestoration:rf" },
				{ 8, "Tier13:hunter:rf" },
				{ 10, "Tier13:mage:rf" },
				{ 12, "Tier13:paladinholy:rf" },
				{ 13, "Tier13:paladinprotection:rf" },
				{ 14, "Tier13:paladinretribution:rf" },
				{ 16, "Tier13:priestheal:rf" },
				{ 17, "Tier13:priestshadow:rf" },
				{ 19, "Tier13:rogue:rf" },
				{ 21, "Tier13:shamanelemental:rf" },
				{ 22, "Tier13:shamanenhancement:rf" },
				{ 23, "Tier13:shamanrestoration:rf" },
				{ 25, "Tier13:warlock:rf" },
				{ 27, "Tier13:warriordps:rf" },
				{ 28, "Tier13:warriorprotection:rf" },
			},
			[NORMAL_DIFF] = {
				{ 1, "Tier13:deathknightblood:n" },
				{ 2, "Tier13:deathknightdps:n" },
				{ 4, "Tier13:druidbalance:n" },
				{ 5, "Tier13:druidferal:n" },
				{ 6, "Tier13:druidrestoration:n" },
				{ 8, "Tier13:hunter:n" },
				{ 10, "Tier13:mage:n" },
				{ 12, "Tier13:paladinholy:n" },
				{ 13, "Tier13:paladinprotection:n" },
				{ 14, "Tier13:paladinretribution:n" },
				{ 16, "Tier13:priestheal:n" },
				{ 17, "Tier13:priestshadow:n" },
				{ 19, "Tier13:rogue:n" },
				{ 21, "Tier13:shamanelemental:n" },
				{ 22, "Tier13:shamanenhancement:n" },
				{ 23, "Tier13:shamanrestoration:n" },
				{ 25, "Tier13:warlock:n" },
				{ 27, "Tier13:warriordps:n" },
				{ 28, "Tier13:warriorprotection:n" },
			},
			[HEROIC_DIFF] = {
				{ 1, "Tier13:deathknightblood:h" },
				{ 2, "Tier13:deathknightdps:h" },
				{ 4, "Tier13:druidbalance:h" },
				{ 5, "Tier13:druidferal:h" },
				{ 6, "Tier13:druidrestoration:h" },
				{ 8, "Tier13:hunter:h" },
				{ 10, "Tier13:mage:h" },
				{ 12, "Tier13:paladinholy:h" },
				{ 13, "Tier13:paladinprotection:h" },
				{ 14, "Tier13:paladinretribution:h" },
				{ 16, "Tier13:priestheal:h" },
				{ 17, "Tier13:priestshadow:h" },
				{ 19, "Tier13:rogue:h" },
				{ 21, "Tier13:shamanelemental:h" },
				{ 22, "Tier13:shamanenhancement:h" },
				{ 23, "Tier13:shamanrestoration:h" },
				{ 25, "Tier13:warlock:h" },
				{ 27, "Tier13:warriordps:h" },
				{ 28, "Tier13:warriorprotection:h" },
			},
		},
		{	-- Tier 14 Sets
			name = format(AL["Tier %d Sets"], 14).." ("..EXPANSION_NAME4..")",
			[RF_DIFF] = {
				{ 1, "Tier14:hunter:rf" },
				{ 2, "Tier14:mage:rf" },
				{ 3, "Tier14:rogue:rf" },
				{ 4, "Tier14:warlock:rf" },
				{ 6, "Tier14:deathknightblood:rf" },
				{ 7, "Tier14:deathknightdps:rf" },
				{ 9, "Tier14:druidbalance:rf" },
				{ 10, "Tier14:druidferal:rf" },
				{ 11, "Tier14:druidguardian:rf" },
				{ 12, "Tier14:druidrestoration:rf" },
				{ 14, "Tier14:priestheal:rf" },
				{ 15, "Tier14:priestshadow:rf" },
				{ 16, "Tier14:monkbrewmaster:rf" },
				{ 17, "Tier14:monkmistweaver:rf" },
				{ 18, "Tier14:monkwindwalker:rf" },
				{ 20, "Tier14:paladinholy:rf" },
				{ 21, "Tier14:paladinprotection:rf" },
				{ 22, "Tier14:paladinretribution:rf" },
				{ 24, "Tier14:shamanelemental:rf" },
				{ 25, "Tier14:shamanenhancement:rf" },
				{ 26, "Tier14:shamanrestoration:rf" },
				{ 28, "Tier14:warriordps:rf" },
				{ 29, "Tier14:warriorprotection:rf" },
			},
			[NORMAL_DIFF] = {
				{ 1, "Tier14:hunter:n" },
				{ 2, "Tier14:mage:n" },
				{ 3, "Tier14:rogue:n" },
				{ 4, "Tier14:warlock:n" },
				{ 6, "Tier14:deathknightblood:n" },
				{ 7, "Tier14:deathknightdps:n" },
				{ 9, "Tier14:druidbalance:n" },
				{ 10, "Tier14:druidferal:n" },
				{ 11, "Tier14:druidguardian:n" },
				{ 12, "Tier14:druidrestoration:n" },
				{ 14, "Tier14:priestheal:n" },
				{ 15, "Tier14:priestshadow:n" },
				{ 16, "Tier14:monkbrewmaster:n" },
				{ 17, "Tier14:monkmistweaver:n" },
				{ 18, "Tier14:monkwindwalker:n" },
				{ 20, "Tier14:paladinholy:n" },
				{ 21, "Tier14:paladinprotection:n" },
				{ 22, "Tier14:paladinretribution:n" },
				{ 24, "Tier14:shamanelemental:n" },
				{ 25, "Tier14:shamanenhancement:n" },
				{ 26, "Tier14:shamanrestoration:n" },
				{ 28, "Tier14:warriordps:n" },
				{ 29, "Tier14:warriorprotection:n" },
			},
			[HEROIC_DIFF] = {
				{ 1, "Tier14:hunter:h" },
				{ 2, "Tier14:mage:h" },
				{ 3, "Tier14:rogue:h" },
				{ 4, "Tier14:warlock:h" },
				{ 6, "Tier14:deathknightblood:h" },
				{ 7, "Tier14:deathknightdps:h" },
				{ 9, "Tier14:druidbalance:h" },
				{ 10, "Tier14:druidferal:h" },
				{ 11, "Tier14:druidguardian:h" },
				{ 12, "Tier14:druidrestoration:h" },
				{ 14, "Tier14:priestheal:h" },
				{ 15, "Tier14:priestshadow:h" },
				{ 16, "Tier14:monkbrewmaster:h" },
				{ 17, "Tier14:monkmistweaver:h" },
				{ 18, "Tier14:monkwindwalker:h" },
				{ 20, "Tier14:paladinholy:h" },
				{ 21, "Tier14:paladinprotection:h" },
				{ 22, "Tier14:paladinretribution:h" },
				{ 24, "Tier14:shamanelemental:h" },
				{ 25, "Tier14:shamanenhancement:h" },
				{ 26, "Tier14:shamanrestoration:h" },
				{ 28, "Tier14:warriordps:h" },
				{ 29, "Tier14:warriorprotection:h" },
			},
		},
		{	-- Tier 15 Sets
			name = format(AL["Tier %d Sets"], 15).." ("..EXPANSION_NAME4..")",
			[RF_DIFF] = {
				{ 1, "Tier15:hunter:rf" },
				{ 2, "Tier15:mage:rf" },
				{ 3, "Tier15:rogue:rf" },
				{ 4, "Tier15:warlock:rf" },
				{ 6, "Tier15:deathknightblood:rf" },
				{ 7, "Tier15:deathknightdps:rf" },
				{ 9, "Tier15:druidbalance:rf" },
				{ 10, "Tier15:druidferal:rf" },
				{ 11, "Tier15:druidguardian:rf" },
				{ 12, "Tier15:druidrestoration:rf" },
				{ 14, "Tier15:priestheal:rf" },
				{ 15, "Tier15:priestshadow:rf" },
				{ 16, "Tier15:monkbrewmaster:rf" },
				{ 17, "Tier15:monkmistweaver:rf" },
				{ 18, "Tier15:monkwindwalker:rf" },
				{ 20, "Tier15:paladinholy:rf" },
				{ 21, "Tier15:paladinprotection:rf" },
				{ 22, "Tier15:paladinretribution:rf" },
				{ 24, "Tier15:shamanelemental:rf" },
				{ 25, "Tier15:shamanenhancement:rf" },
				{ 26, "Tier15:shamanrestoration:rf" },
				{ 28, "Tier15:warriordps:rf" },
				{ 29, "Tier15:warriorprotection:rf" },
			},
			[NORMAL_DIFF] = {
				{ 1, "Tier15:hunter:n" },
				{ 2, "Tier15:mage:n" },
				{ 3, "Tier15:rogue:n" },
				{ 4, "Tier15:warlock:n" },
				{ 6, "Tier15:deathknightblood:n" },
				{ 7, "Tier15:deathknightdps:n" },
				{ 9, "Tier15:druidbalance:n" },
				{ 10, "Tier15:druidferal:n" },
				{ 11, "Tier15:druidguardian:n" },
				{ 12, "Tier15:druidrestoration:n" },
				{ 14, "Tier15:priestheal:n" },
				{ 15, "Tier15:priestshadow:n" },
				{ 16, "Tier15:monkbrewmaster:n" },
				{ 17, "Tier15:monkmistweaver:n" },
				{ 18, "Tier15:monkwindwalker:n" },
				{ 20, "Tier15:paladinholy:n" },
				{ 21, "Tier15:paladinprotection:n" },
				{ 22, "Tier15:paladinretribution:n" },
				{ 24, "Tier15:shamanelemental:n" },
				{ 25, "Tier15:shamanenhancement:n" },
				{ 26, "Tier15:shamanrestoration:n" },
				{ 28, "Tier15:warriordps:n" },
				{ 29, "Tier15:warriorprotection:n" },
			},
			[HEROIC_DIFF] = {
				{ 1, "Tier15:hunter:h" },
				{ 2, "Tier15:mage:h" },
				{ 3, "Tier15:rogue:h" },
				{ 4, "Tier15:warlock:h" },
				{ 6, "Tier15:deathknightblood:h" },
				{ 7, "Tier15:deathknightdps:h" },
				{ 9, "Tier15:druidbalance:h" },
				{ 10, "Tier15:druidferal:h" },
				{ 11, "Tier15:druidguardian:h" },
				{ 12, "Tier15:druidrestoration:h" },
				{ 14, "Tier15:priestheal:h" },
				{ 15, "Tier15:priestshadow:h" },
				{ 16, "Tier15:monkbrewmaster:h" },
				{ 17, "Tier15:monkmistweaver:h" },
				{ 18, "Tier15:monkwindwalker:h" },
				{ 20, "Tier15:paladinholy:h" },
				{ 21, "Tier15:paladinprotection:h" },
				{ 22, "Tier15:paladinretribution:h" },
				{ 24, "Tier15:shamanelemental:h" },
				{ 25, "Tier15:shamanenhancement:h" },
				{ 26, "Tier15:shamanrestoration:h" },
				{ 28, "Tier15:warriordps:h" },
				{ 29, "Tier15:warriorprotection:h" },
			},
		},
		{	-- Tier 16 Sets
			name = format(AL["Tier %d Sets"], 16).." ("..EXPANSION_NAME4..")",
			[RF_DIFF] = {
				{ 1, "Tier16:hunter:rf" },
				{ 2, "Tier16:mage:rf" },
				{ 3, "Tier16:rogue:rf" },
				{ 4, "Tier16:warlock:rf" },
				{ 6, "Tier16:deathknightblood:rf" },
				{ 7, "Tier16:deathknightdps:rf" },
				{ 9, "Tier16:druidbalance:rf" },
				{ 10, "Tier16:druidferal:rf" },
				{ 11, "Tier16:druidguardian:rf" },
				{ 12, "Tier16:druidrestoration:rf" },
				{ 14, "Tier16:priestheal:rf" },
				{ 15, "Tier16:priestshadow:rf" },
				{ 16, "Tier16:monkbrewmaster:rf" },
				{ 17, "Tier16:monkmistweaver:rf" },
				{ 18, "Tier16:monkwindwalker:rf" },
				{ 20, "Tier16:paladinholy:rf" },
				{ 21, "Tier16:paladinprotection:rf" },
				{ 22, "Tier16:paladinretribution:rf" },
				{ 24, "Tier16:shamanelemental:rf" },
				{ 25, "Tier16:shamanenhancement:rf" },
				{ 26, "Tier16:shamanrestoration:rf" },
				{ 28, "Tier16:warriordps:rf" },
				{ 29, "Tier16:warriorprotection:rf" },
			},
			[NORMAL_DIFF] = {
				{ 1, "Tier16:hunter:n" },
				{ 2, "Tier16:mage:n" },
				{ 3, "Tier16:rogue:n" },
				{ 4, "Tier16:warlock:n" },
				{ 6, "Tier16:deathknightblood:n" },
				{ 7, "Tier16:deathknightdps:n" },
				{ 9, "Tier16:druidbalance:n" },
				{ 10, "Tier16:druidferal:n" },
				{ 11, "Tier16:druidguardian:n" },
				{ 12, "Tier16:druidrestoration:n" },
				{ 14, "Tier16:priestheal:n" },
				{ 15, "Tier16:priestshadow:n" },
				{ 16, "Tier16:monkbrewmaster:n" },
				{ 17, "Tier16:monkmistweaver:n" },
				{ 18, "Tier16:monkwindwalker:n" },
				{ 20, "Tier16:paladinholy:n" },
				{ 21, "Tier16:paladinprotection:n" },
				{ 22, "Tier16:paladinretribution:n" },
				{ 24, "Tier16:shamanelemental:n" },
				{ 25, "Tier16:shamanenhancement:n" },
				{ 26, "Tier16:shamanrestoration:n" },
				{ 28, "Tier16:warriordps:n" },
				{ 29, "Tier16:warriorprotection:n" },
			},
			[HEROIC_DIFF] = {
				{ 1, "Tier16:hunter:h" },
				{ 2, "Tier16:mage:h" },
				{ 3, "Tier16:rogue:h" },
				{ 4, "Tier16:warlock:h" },
				{ 6, "Tier16:deathknightblood:h" },
				{ 7, "Tier16:deathknightdps:h" },
				{ 9, "Tier16:druidbalance:h" },
				{ 10, "Tier16:druidferal:h" },
				{ 11, "Tier16:druidguardian:h" },
				{ 12, "Tier16:druidrestoration:h" },
				{ 14, "Tier16:priestheal:h" },
				{ 15, "Tier16:priestshadow:h" },
				{ 16, "Tier16:monkbrewmaster:h" },
				{ 17, "Tier16:monkmistweaver:h" },
				{ 18, "Tier16:monkwindwalker:h" },
				{ 20, "Tier16:paladinholy:h" },
				{ 21, "Tier16:paladinprotection:h" },
				{ 22, "Tier16:paladinretribution:h" },
				{ 24, "Tier16:shamanelemental:h" },
				{ 25, "Tier16:shamanenhancement:h" },
				{ 26, "Tier16:shamanrestoration:h" },
				{ 28, "Tier16:warriordps:h" },
				{ 29, "Tier16:warriorprotection:h" },
			},
			[MYTHIC_DIFF] = {
				{ 1, "Tier16:hunter:m" },
				{ 2, "Tier16:mage:m" },
				{ 3, "Tier16:rogue:m" },
				{ 4, "Tier16:warlock:m" },
				{ 6, "Tier16:deathknightblood:m" },
				{ 7, "Tier16:deathknightdps:m" },
				{ 9, "Tier16:druidbalance:m" },
				{ 10, "Tier16:druidferal:m" },
				{ 11, "Tier16:druidguardian:m" },
				{ 12, "Tier16:druidrestoration:m" },
				{ 14, "Tier16:priestheal:m" },
				{ 15, "Tier16:priestshadow:m" },
				{ 16, "Tier16:monkbrewmaster:m" },
				{ 17, "Tier16:monkmistweaver:m" },
				{ 18, "Tier16:monkwindwalker:m" },
				{ 20, "Tier16:paladinholy:m" },
				{ 21, "Tier16:paladinprotection:m" },
				{ 22, "Tier16:paladinretribution:m" },
				{ 24, "Tier16:shamanelemental:m" },
				{ 25, "Tier16:shamanenhancement:m" },
				{ 26, "Tier16:shamanrestoration:m" },
				{ 28, "Tier16:warriordps:m" },
				{ 29, "Tier16:warriorprotection:m" },
			},
		},
		{	-- Tier 17 Sets
			name = format(AL["Tier %d Sets"], 17).." ("..EXPANSION_NAME5..")",
			[RF_DIFF] = {
				{ 1, "Tier17:rfcloth:rf" },
				{ 3, "Tier17:rfleather:rf" },
				{ 16, "Tier17:rfmail:rf" },
				{ 18, "Tier17:rfplate:rf" },
			},
			[NORMAL_DIFF] = {
				{ 1, "Tier17:dk:n" },
				{ 3, "Tier17:druid:n" },
				{ 5, "Tier17:hunter:n" },
				{ 7, "Tier17:mage:n" },
				{ 9, "Tier17:monk:n" },
				{ 11, "Tier17:paladin:n" },
				{ 16, "Tier17:priest:n" },
				{ 18, "Tier17:rogue:n" },
				{ 20, "Tier17:shaman:n" },
				{ 22, "Tier17:warlock:n" },
				{ 24, "Tier17:warrior:n" },
			},
			[HEROIC_DIFF] = {
				{ 1, "Tier17:dk:hB1" },
				{ 3, "Tier17:druid:hB1" },
				{ 5, "Tier17:hunter:hB1" },
				{ 7, "Tier17:mage:hB1" },
				{ 9, "Tier17:monk:hB1" },
				{ 11, "Tier17:paladin:hB1" },
				{ 16, "Tier17:priest:hB1" },
				{ 18, "Tier17:rogue:hB1" },
				{ 20, "Tier17:shaman:hB1" },
				{ 22, "Tier17:warlock:hB1" },
				{ 24, "Tier17:warrior:hB1" },
			},
			[MYTHIC_DIFF] = {
				{ 1, "Tier17:dk:mB1" },
				{ 3, "Tier17:druid:mB1" },
				{ 5, "Tier17:hunter:mB1" },
				{ 7, "Tier17:mage:mB1" },
				{ 9, "Tier17:monk:mB1" },
				{ 11, "Tier17:paladin:mB1" },
				{ 16, "Tier17:priest:mB1" },
				{ 18, "Tier17:rogue:mB1" },
				{ 20, "Tier17:shaman:mB1" },
				{ 22, "Tier17:warlock:mB1" },
				{ 24, "Tier17:warrior:mB1" },
			},
		},
		{	-- Tier 18 Sets
			name = format(AL["Tier %d Sets"], 18).." ("..EXPANSION_NAME5..")",
			[RF_DIFF] = {
				{ 1, "Tier18:rfcloth:rf" },
				{ 3, "Tier18:rfleather:rf" },
				{ 16, "Tier18:rfmail:rf" },
				{ 18, "Tier18:rfplate:rf" },
			},
			[NORMAL_DIFF] = {
				{ 1, "Tier18:dk:n" },
				{ 3, "Tier18:druid:n" },
				{ 5, "Tier18:hunter:n" },
				{ 7, "Tier18:mage:n" },
				{ 9, "Tier18:monk:n" },
				{ 11, "Tier18:paladin:n" },
				{ 16, "Tier18:priest:n" },
				{ 18, "Tier18:rogue:n" },
				{ 20, "Tier18:shaman:n" },
				{ 22, "Tier18:warlock:n" },
				{ 24, "Tier18:warrior:n" },
			},
			[HEROIC_DIFF] = {
				{ 1, "Tier18:dk:hB1" },
				{ 3, "Tier18:druid:hB1" },
				{ 5, "Tier18:hunter:hB1" },
				{ 7, "Tier18:mage:hB1" },
				{ 9, "Tier18:monk:hB1" },
				{ 11, "Tier18:paladin:hB1" },
				{ 16, "Tier18:priest:hB1" },
				{ 18, "Tier18:rogue:hB1" },
				{ 20, "Tier18:shaman:hB1" },
				{ 22, "Tier18:warlock:hB1" },
				{ 24, "Tier18:warrior:hB1" },
			},
			[MYTHIC_DIFF] = {
				{ 1, "Tier18:dk:mB1" },
				{ 3, "Tier18:druid:mB1" },
				{ 5, "Tier18:hunter:mB1" },
				{ 7, "Tier18:mage:mB1" },
				{ 9, "Tier18:monk:mB1" },
				{ 11, "Tier18:paladin:mB1" },
				{ 16, "Tier18:priest:mB1" },
				{ 18, "Tier18:rogue:mB1" },
				{ 20, "Tier18:shaman:mB1" },
				{ 22, "Tier18:warlock:mB1" },
				{ 24, "Tier18:warrior:mB1" },
			},
		},
		{	-- Tier 19 Sets
			name = format(AL["Tier %d Sets"], 19).." ("..EXPANSION_NAME6..")",
			[RF_DIFF] = {
				{ 1 , "Tier19:deathknight:rf" },
				{ 3 , "Tier19:demonhunter:rf" },
				{ 5 , "Tier19:druid:rf" },
				{ 7 , "Tier19:hunter:rf" },
				{ 9 , "Tier19:mage:rf" },
				{ 11, "Tier19:monk:rf" },
				{ 13, "Tier19:rogue:rf" },
				{ 15, "Tier19:paladin:rf" },
				{ 16, "Tier19:priest:rf" },
				{ 18, "Tier19:shaman:rf" },
				{ 20, "Tier19:warlock:rf" },
				{ 22, "Tier19:warrior:rf" },
			},
			[NORMAL_DIFF] = {
				{ 1 , "Tier19:deathknight:n" },
				{ 3 , "Tier19:demonhunter:n" },
				{ 5 , "Tier19:druid:n" },
				{ 7 , "Tier19:hunter:n" },
				{ 9 , "Tier19:mage:n" },
				{ 11, "Tier19:monk:n" },
				{ 13, "Tier19:rogue:n" },
				{ 15, "Tier19:paladin:n" },
				{ 16, "Tier19:priest:n" },
				{ 18, "Tier19:shaman:n" },
				{ 20, "Tier19:warlock:n" },
				{ 22, "Tier19:warrior:n" },
			},
			[HEROIC_DIFF] = {
				{ 1 , "Tier19:deathknight:hB1" },
				{ 3 , "Tier19:demonhunter:hB1" },
				{ 5 , "Tier19:druid:hB1" },
				{ 7 , "Tier19:hunter:hB1" },
				{ 9 , "Tier19:mage:hB1" },
				{ 11, "Tier19:monk:hB1" },
				{ 13, "Tier19:rogue:hB1" },
				{ 15, "Tier19:paladin:hB1" },
				{ 16, "Tier19:priest:hB1" },
				{ 18, "Tier19:shaman:hB1" },
				{ 20, "Tier19:warlock:hB1" },
				{ 22, "Tier19:warrior:hB1" },
			},
			[MYTHIC_DIFF] = {
				{ 1 , "Tier19:deathknight:mB1" },
				{ 3 , "Tier19:demonhunter:mB1" },
				{ 5 , "Tier19:druid:mB1" },
				{ 7 , "Tier19:hunter:mB1" },
				{ 9 , "Tier19:mage:mB1" },
				{ 11, "Tier19:monk:mB1" },
				{ 13, "Tier19:rogue:mB1" },
				{ 15, "Tier19:paladin:mB1" },
				{ 16, "Tier19:priest:mB1" },
				{ 18, "Tier19:shaman:mB1" },
				{ 20, "Tier19:warlock:mB1" },
				{ 22, "Tier19:warrior:mB1" },
			},
		},
		{	-- Tier 20 Sets
			-- NOTE: item level is currently wrong except for LFR
			name = format(AL["Tier %d Sets"], 20).." ("..EXPANSION_NAME6..")",
			[RF_DIFF] = {
				{ 1 , "Tier20:deathknight:rf" },
				{ 3 , "Tier20:demonhunter:rf" },
				{ 5 , "Tier20:druid:rf" },
				{ 7 , "Tier20:hunter:rf" },
				{ 9 , "Tier20:mage:rf" },
				{ 11, "Tier20:monk:rf" },
				{ 13, "Tier20:rogue:rf" },
				{ 15, "Tier20:paladin:rf" },
				{ 16, "Tier20:priest:rf" },
				{ 18, "Tier20:shaman:rf" },
				{ 20, "Tier20:warlock:rf" },
				{ 22, "Tier20:warrior:rf" },
			},
			[NORMAL_DIFF] = {
				{ 1 , "Tier20:deathknight:n" },
				{ 3 , "Tier20:demonhunter:n" },
				{ 5 , "Tier20:druid:n" },
				{ 7 , "Tier20:hunter:n" },
				{ 9 , "Tier20:mage:n" },
				{ 11, "Tier20:monk:n" },
				{ 13, "Tier20:rogue:n" },
				{ 15, "Tier20:paladin:n" },
				{ 16, "Tier20:priest:n" },
				{ 18, "Tier20:shaman:n" },
				{ 20, "Tier20:warlock:n" },
				{ 22, "Tier20:warrior:n" },
			},
			[HEROIC_DIFF] = {
				{ 1 , "Tier20:deathknight:hB1" },
				{ 3 , "Tier20:demonhunter:hB1" },
				{ 5 , "Tier20:druid:hB1" },
				{ 7 , "Tier20:hunter:hB1" },
				{ 9 , "Tier20:mage:hB1" },
				{ 11, "Tier20:monk:hB1" },
				{ 13, "Tier20:rogue:hB1" },
				{ 15, "Tier20:paladin:hB1" },
				{ 16, "Tier20:priest:hB1" },
				{ 18, "Tier20:shaman:hB1" },
				{ 20, "Tier20:warlock:hB1" },
				{ 22, "Tier20:warrior:hB1" },
			},
			[MYTHIC_DIFF] = {
				{ 1 , "Tier20:deathknight:mB1" },
				{ 3 , "Tier20:demonhunter:mB1" },
				{ 5 , "Tier20:druid:mB1" },
				{ 7 , "Tier20:hunter:mB1" },
				{ 9 , "Tier20:mage:mB1" },
				{ 11, "Tier20:monk:mB1" },
				{ 13, "Tier20:rogue:mB1" },
				{ 15, "Tier20:paladin:mB1" },
				{ 16, "Tier20:priest:mB1" },
				{ 18, "Tier20:shaman:mB1" },
				{ 20, "Tier20:warlock:mB1" },
				{ 22, "Tier20:warrior:mB1" },
			},
		},
		{	-- Tier 21 Sets
			-- NOTE: item level is currently wrong except for LFR
			name = format(AL["Tier %d Sets"], 21).." ("..EXPANSION_NAME6..")",
			[RF_DIFF] = {
				{ 1 , "Tier21:deathknight:rf" },
				{ 3 , "Tier21:demonhunter:rf" },
				{ 5 , "Tier21:druid:rf" },
				{ 7 , "Tier21:hunter:rf" },
				{ 9 , "Tier21:mage:rf" },
				{ 11, "Tier21:monk:rf" },
				{ 13, "Tier21:rogue:rf" },
				{ 15, "Tier21:paladin:rf" },
				{ 16, "Tier21:priest:rf" },
				{ 18, "Tier21:shaman:rf" },
				{ 20, "Tier21:warlock:rf" },
				{ 22, "Tier21:warrior:rf" },
			},
			[NORMAL_DIFF] = {
				{ 1 , "Tier21:deathknight:n" },
				{ 3 , "Tier21:demonhunter:n" },
				{ 5 , "Tier21:druid:n" },
				{ 7 , "Tier21:hunter:n" },
				{ 9 , "Tier21:mage:n" },
				{ 11, "Tier21:monk:n" },
				{ 13, "Tier21:rogue:n" },
				{ 15, "Tier21:paladin:n" },
				{ 16, "Tier21:priest:n" },
				{ 18, "Tier21:shaman:n" },
				{ 20, "Tier21:warlock:n" },
				{ 22, "Tier21:warrior:n" },
			},
			[HEROIC_DIFF] = {
				{ 1 , "Tier21:deathknight:hB1" },
				{ 3 , "Tier21:demonhunter:hB1" },
				{ 5 , "Tier21:druid:hB1" },
				{ 7 , "Tier21:hunter:hB1" },
				{ 9 , "Tier21:mage:hB1" },
				{ 11, "Tier21:monk:hB1" },
				{ 13, "Tier21:rogue:hB1" },
				{ 15, "Tier21:paladin:hB1" },
				{ 16, "Tier21:priest:hB1" },
				{ 18, "Tier21:shaman:hB1" },
				{ 20, "Tier21:warlock:hB1" },
				{ 22, "Tier21:warrior:hB1" },
			},
			[MYTHIC_DIFF] = {
				{ 1 , "Tier21:deathknight:mB1" },
				{ 3 , "Tier21:demonhunter:mB1" },
				{ 5 , "Tier21:druid:mB1" },
				{ 7 , "Tier21:hunter:mB1" },
				{ 9 , "Tier21:mage:mB1" },
				{ 11, "Tier21:monk:mB1" },
				{ 13, "Tier21:rogue:mB1" },
				{ 15, "Tier21:paladin:mB1" },
				{ 16, "Tier21:priest:mB1" },
				{ 18, "Tier21:shaman:mB1" },
				{ 20, "Tier21:warlock:mB1" },
				{ 22, "Tier21:warrior:mB1" },
			},
		},
	},
}

data["TIERSETS_BYCLASS"] = {
	name = AL["Tier Sets - per Class"],
	ContentType = COLLECTION_CONTENT,
	TableType = SET_ITTYPE,
	items = { 
		{ -- DEATHKNIGHT
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[NORMAL_DIFF] = {
				{ 1 , "Tier7:deathknightblood:n" },
				{ 2 , "Tier7:deathknightdps:n" },
				{ 3 , "Tier7:deathknightblood:p25" },
				{ 4 , "Tier7:deathknightdps:p25" },
				{ 6 , "Tier8:deathknightblood:n" },
				{ 7 , "Tier8:deathknightdps:n" },
				{ 8 , "Tier8:deathknightblood:p25" },
				{ 9 , "Tier8:deathknightdps:p25" },
				{ 11, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightblood:n", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightblood:n" },
				{ 12, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightblood:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightblood:p25" },
				{ 13, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightblood:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightblood:p25h" },
				{ 14, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightdps:n", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightdps:n" },
				{ 15, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightdps:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightdps:p25" },
				{ 16, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:deathknightdps:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:deathknightdps:p25h" },
				{ 18, "Tier10:deathknightblood:n" },
				{ 19, "Tier10:deathknightdps:n" },
				{ 20, "Tier10:deathknightblood:p25" },
				{ 21, "Tier10:deathknightdps:p25" },
				{ 22, "Tier10:deathknightblood:p25h" },
				{ 23, "Tier10:deathknightdps:p25h" },
				{ 25, "Tier11:deathknightblood:n" },
				{ 26, "Tier11:deathknightdps:n" },
				{ 27, "Tier11:deathknightblood:h" },
				{ 28, "Tier11:deathknightdps:h" },
				{ 101, "Tier12:deathknightblood:n" },
				{ 102, "Tier12:deathknightdps:n" },
				{ 103, "Tier12:deathknightblood:h" },
				{ 104, "Tier12:deathknightdps:h" },
				{ 106, "Tier13:deathknightblood:rf" },
				{ 107, "Tier13:deathknightdps:rf" },
				{ 108, "Tier13:deathknightblood:n" },
				{ 109, "Tier13:deathknightdps:n" },
				{ 110, "Tier13:deathknightblood:h" },
				{ 111, "Tier13:deathknightdps:h" },
				{ 116, "Tier14:deathknightblood:rf" },
				{ 117, "Tier14:deathknightdps:rf" },
				{ 118, "Tier14:deathknightblood:n" },
				{ 119, "Tier14:deathknightdps:n" },
				{ 120, "Tier14:deathknightblood:h" },
				{ 121, "Tier14:deathknightdps:h" },
				{ 123, "Tier15:deathknightblood:rf" },
				{ 124, "Tier15:deathknightdps:rf" },
				{ 125, "Tier15:deathknightblood:n" },
				{ 126, "Tier15:deathknightdps:n" },
				{ 127, "Tier15:deathknightblood:h" },
				{ 128, "Tier15:deathknightdps:h" },
				{ 201, "Tier16:deathknightblood:rf" },
				{ 202, "Tier16:deathknightdps:rf" },
				{ 203, "Tier16:deathknightblood:n" },
				{ 204, "Tier16:deathknightdps:n" },
				{ 205, "Tier16:deathknightblood:h" },
				{ 206, "Tier16:deathknightdps:h" },
				{ 207, "Tier16:deathknightblood:m" },
				{ 208, "Tier16:deathknightdps:m" },
				{ 210, "Tier17:dk:n" },
				{ 211, "Tier17:dk:hB1" },
				{ 212, "Tier17:dk:mB1" },
				{ 216, "Tier18:dk:n" },
				{ 217, "Tier18:dk:hB1" },
				{ 218, "Tier18:dk:mB1" },
				{ 220, "Tier19:deathknight:rf" },
				{ 221, "Tier19:deathknight:n" },
				{ 222, "Tier19:deathknight:hB1" },
				{ 223, "Tier19:deathknight:mB1" },
				{ 225, "Tier20:deathknight:rf" },
				{ 226, "Tier20:deathknight:n" },
				{ 227, "Tier20:deathknight:hB1" },
				{ 228, "Tier20:deathknight:mB1" },
				{ 301, "Tier21:deathknight:rf" },
				{ 302, "Tier21:deathknight:n" },
				{ 303, "Tier21:deathknight:hB1" },
				{ 304, "Tier21:deathknight:mB1" },
			},
		},
		{ -- DEMONHUNTER
			name = ATLASLOOT_DEMONHUNTER_COLOR..ALIL["DEMONHUNTER"],
			[NORMAL_DIFF] = {
				{ 1 , "Tier19:demonhunter:rf" },
				{ 2 , "Tier19:demonhunter:n" },
				{ 3 , "Tier19:demonhunter:hB1" },
				{ 4 , "Tier19:demonhunter:mB1" },
				{ 6 , "Tier20:demonhunter:rf" },
				{ 7 , "Tier20:demonhunter:n" },
				{ 8 , "Tier20:demonhunter:hB1" },
				{ 9 , "Tier20:demonhunter:mB1" },
				{ 11 , "Tier21:demonhunter:rf" },
				{ 12 , "Tier21:demonhunter:n" },
				{ 13 , "Tier21:demonhunter:hB1" },
				{ 14 , "Tier21:demonhunter:mB1" },
			},
		},
		{ -- DRUID
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[NORMAL_DIFF] = {
				{ 1  , "Tier1:druid:n" },
				{ 3  , "Tier2:druid:n" },
				{ 5  , "Tier3:druid:n" },
				{ 7  , "Tier4:druidbalance:n" },
				{ 8  , "Tier4:druidferal:n" },
				{ 9  , "Tier4:druidrestoration:n" },
				{ 11 , "Tier5:druidbalance:p25" },
				{ 12 , "Tier5:druidferal:p25" },
				{ 13 , "Tier5:druidrestoration:p25" },
				{ 16 , "Tier6:druidbalance:p25" },
				{ 17 , "Tier6:druidferal:p25" },
				{ 18 , "Tier6:druidrestoration:p25" },
				{ 20 , "Tier7:druidbalance:n" },
				{ 21 , "Tier7:druidferal:n" },
				{ 22 , "Tier7:druidrestoration:n" },
				{ 23 , "Tier7:druidbalance:p25" },
				{ 24 , "Tier7:druidferal:p25" },
				{ 25 , "Tier7:druidrestoration:p25" },
				{ 101, "Tier8:druidbalance:n" },
				{ 102, "Tier8:druidferal:n" },
				{ 103, "Tier8:druidrestoration:n" },
				{ 104, "Tier8:druidbalance:p25" },
				{ 105, "Tier8:druidferal:p25" },
				{ 106, "Tier8:druidrestoration:p25" },
				{ 108, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidbalance:n", [ATLASLOOT_IT_HORDE] = "Tier9H:druidbalance:n" },
				{ 109, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidbalance:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:druidbalance:p25" },
				{ 110, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidbalance:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:druidbalance:p25h" },
				{ 111, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidferal:n", [ATLASLOOT_IT_HORDE] = "Tier9H:druidferal:n" },
				{ 112, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidferal:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:druidferal:p25" },
				{ 113, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidferal:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:druidferal:p25h" },
				{ 114, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidrestoration:n", [ATLASLOOT_IT_HORDE] = "Tier9H:druidrestoration:n" },
				{ 115, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidrestoration:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:druidrestoration:p25" },
				{ 116, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:druidrestoration:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:druidrestoration:p25h" },
				{ 118, "Tier10:druidbalance:n" },
				{ 119, "Tier10:druidferal:n" },
				{ 120, "Tier10:druidrestoration:n" },
				{ 121, "Tier10:druidbalance:p25" },
				{ 122, "Tier10:druidferal:p25" },
				{ 123, "Tier10:druidrestoration:p25" },
				{ 124, "Tier10:druidbalance:p25h" },
				{ 125, "Tier10:druidferal:p25h" },
				{ 126, "Tier10:druidrestoration:p25h" },
				{ 201, "Tier11:druidbalance:n" },
				{ 202, "Tier11:druidferal:n" },
				{ 203, "Tier11:druidrestoration:n" },
				{ 204, "Tier11:druidbalance:h" },
				{ 205, "Tier11:druidferal:h" },
				{ 206, "Tier11:druidrestoration:h" },
				{ 208, "Tier12:druidbalance:n" },
				{ 209, "Tier12:druidferal:n" },
				{ 210, "Tier12:druidrestoration:n" },
				{ 211, "Tier12:druidbalance:h" },
				{ 212, "Tier12:druidferal:h" },
				{ 213, "Tier12:druidrestoration:h" },
				{ 216, "Tier13:druidbalance:rf" },
				{ 217, "Tier13:druidferal:rf" },
				{ 218, "Tier13:druidrestoration:rf" },
				{ 219, "Tier13:druidbalance:n" },
				{ 220, "Tier13:druidferal:n" },
				{ 221, "Tier13:druidrestoration:n" },
				{ 222, "Tier13:druidbalance:h" },
				{ 223, "Tier13:druidferal:h" },
				{ 224, "Tier13:druidrestoration:h" },
				{ 301, "Tier14:druidbalance:rf" },
				{ 302, "Tier14:druidferal:rf" },
				{ 303, "Tier14:druidguardian:rf" },
				{ 304, "Tier14:druidrestoration:rf" },
				{ 305, "Tier14:druidbalance:n" },
				{ 306, "Tier14:druidferal:n" },
				{ 307, "Tier14:druidguardian:n" },
				{ 308, "Tier14:druidrestoration:n" },
				{ 309, "Tier14:druidbalance:h" },
				{ 310, "Tier14:druidferal:h" },
				{ 311, "Tier14:druidguardian:h" },
				{ 312, "Tier14:druidrestoration:h" },
				{ 316, "Tier15:druidbalance:rf" },
				{ 317, "Tier15:druidferal:rf" },
				{ 318, "Tier15:druidguardian:rf" },
				{ 319, "Tier15:druidrestoration:rf" },
				{ 320, "Tier15:druidbalance:n" },
				{ 321, "Tier15:druidferal:n" },
				{ 322, "Tier15:druidguardian:n" },
				{ 323, "Tier15:druidrestoration:n" },
				{ 324, "Tier15:druidbalance:h" },
				{ 325, "Tier15:druidferal:h" },
				{ 326, "Tier15:druidguardian:h" },
				{ 327, "Tier15:druidrestoration:h" },
				{ 401, "Tier16:druidbalance:rf" },
				{ 402, "Tier16:druidferal:rf" },
				{ 403, "Tier16:druidguardian:rf" },
				{ 404, "Tier16:druidrestoration:rf" },
				{ 405, "Tier16:druidbalance:n" },
				{ 406, "Tier16:druidferal:n" },
				{ 407, "Tier16:druidguardian:n" },
				{ 408, "Tier16:druidrestoration:n" },
				{ 409, "Tier16:druidbalance:h" },
				{ 410, "Tier16:druidferal:h" },
				{ 411, "Tier16:druidguardian:h" },
				{ 412, "Tier16:druidrestoration:h" },
				{ 413, "Tier16:druidbalance:m" },
				{ 414, "Tier16:druidferal:m" },
				{ 415, "Tier16:druidguardian:m" },
				{ 416, "Tier16:druidrestoration:m" },
				{ 418, "Tier17:druid:n" },
				{ 419, "Tier17:druid:hB1" },
				{ 420, "Tier17:druid:mB1" },
				{ 422, "Tier18:druid:n" },
				{ 423, "Tier18:druid:hB1" },
				{ 424, "Tier18:druid:mB1" },
				{ 426, "Tier19:druid:rf" },
				{ 427, "Tier19:druid:n" },
				{ 428, "Tier19:druid:hB1" },
				{ 429, "Tier19:druid:mB1" },
				{ 501, "Tier20:druid:rf" },
				{ 502, "Tier20:druid:n" },
				{ 503, "Tier20:druid:hB1" },
				{ 504, "Tier20:druid:mB1" },
				{ 506, "Tier21:druid:rf" },
				{ 507, "Tier21:druid:n" },
				{ 508, "Tier21:druid:hB1" },
				{ 509, "Tier21:druid:mB1" },
			},
		},
		{ -- HUNTER
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[NORMAL_DIFF] = {
				{ 1 , "Tier1:hunter:n" },
				{ 3 , "Tier2:hunter:n" },
				{ 5 , "Tier3:hunter:n" },
				{ 6 , "Tier4:hunter:n" },
				{ 8 , "Tier5:hunter:p25" },
				{ 11, "Tier6:hunter:p25" },
				{ 13, "Tier7:hunter:n" },
				{ 14, "Tier7:hunter:p25" },
				{ 16, "Tier8:hunter:n" },
				{ 17, "Tier8:hunter:p25" },
				{ 19, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:hunter:n", [ATLASLOOT_IT_HORDE] = "Tier9H:hunter:n" },
				{ 20, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:hunter:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:hunter:p25" },
				{ 21, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:hunter:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:hunter:p25h" },
				{ 23, "Tier10:hunter:n" },
				{ 24, "Tier10:hunter:p25" },
				{ 25, "Tier10:hunter:p25h" },
				{ 27, "Tier11:hunter:n" },
				{ 28, "Tier11:hunter:h" },
				{ 101, "Tier12:hunter:n" },
				{ 102, "Tier12:hunter:h" },
				{ 104, "Tier13:hunter:rf" },
				{ 105, "Tier13:hunter:n" },
				{ 106, "Tier13:hunter:h" },
				{ 108, "Tier14:hunter:rf" },
				{ 109, "Tier14:hunter:n" },
				{ 110, "Tier14:hunter:h" },
				{ 112, "Tier15:hunter:rf" },
				{ 113, "Tier15:hunter:n" },
				{ 114, "Tier15:hunter:h" },
				{ 116, "Tier16:hunter:rf" },
				{ 117, "Tier16:hunter:n" },
				{ 118, "Tier16:hunter:h" },
				{ 119, "Tier16:hunter:m" },
				{ 121, "Tier17:hunter:n" },
				{ 122, "Tier17:hunter:hB1" },
				{ 123, "Tier17:hunter:mB1" },
				{ 125, "Tier18:hunter:n" },
				{ 126, "Tier18:hunter:hB1" },
				{ 127, "Tier18:hunter:mB1" },
				{ 201, "Tier19:hunter:rf" },
				{ 202, "Tier19:hunter:n" },
				{ 203, "Tier19:hunter:hB1" },
				{ 204, "Tier19:hunter:mB1" },
				{ 206, "Tier20:hunter:rf" },
				{ 207, "Tier20:hunter:n" },
				{ 208, "Tier20:hunter:hB1" },
				{ 209, "Tier20:hunter:mB1" },
				{ 211, "Tier21:hunter:rf" },
				{ 212, "Tier21:hunter:n" },
				{ 213, "Tier21:hunter:hB1" },
				{ 214, "Tier21:hunter:mB1" },
			},
		},
		{ -- MAGE
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[NORMAL_DIFF] = {
				{ 1 , "Tier1:mage:n" },
				{ 3 , "Tier2:mage:n" },
				{ 5 , "Tier3:mage:n" },
				{ 7 , "Tier4:mage:n" },
				{ 9 , "Tier5:mage:p25" },
				{ 11, "Tier6:mage:p25" },
				{ 13, "Tier7:mage:n" },
				{ 14, "Tier7:mage:p25" },
				{ 16, "Tier8:mage:n" },
				{ 17, "Tier8:mage:p25" },
				{ 19, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:mage:n", [ATLASLOOT_IT_HORDE] = "Tier9H:mage:n" },
				{ 20, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:mage:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:mage:p25" },
				{ 21, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:mage:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:mage:p25h" },
				{ 23, "Tier10:mage:n" },
				{ 24, "Tier10:mage:p25" },
				{ 25, "Tier10:mage:p25h" },
				{ 27, "Tier11:mage:n" },
				{ 28, "Tier11:mage:h" },
				{ 101, "Tier12:mage:n" },
				{ 102, "Tier12:mage:h" },
				{ 104, "Tier13:mage:rf" },
				{ 105, "Tier13:mage:n" },
				{ 106, "Tier13:mage:h" },
				{ 108, "Tier14:mage:rf" },
				{ 109, "Tier14:mage:n" },
				{ 110, "Tier14:mage:h" },
				{ 112, "Tier15:mage:rf" },
				{ 113, "Tier15:mage:n" },
				{ 114, "Tier15:mage:h" },
				{ 116, "Tier16:mage:rf" },
				{ 117, "Tier16:mage:n" },
				{ 118, "Tier16:mage:h" },
				{ 119, "Tier16:mage:m" },
				{ 121, "Tier17:mage:n" },
				{ 122, "Tier17:mage:hB1" },
				{ 123, "Tier17:mage:mB1" },
				{ 125, "Tier18:mage:n" },
				{ 126, "Tier18:mage:hB1" },
				{ 127, "Tier18:mage:mB1" },
				{ 201, "Tier19:mage:rf" },
				{ 202, "Tier19:mage:n" },
				{ 203, "Tier19:mage:hB1" },
				{ 204, "Tier19:mage:mB1" },
				{ 206, "Tier20:mage:rf" },
				{ 207, "Tier20:mage:n" },
				{ 208, "Tier20:mage:hB1" },
				{ 209, "Tier20:mage:mB1" },
				{ 211, "Tier21:mage:rf" },
				{ 212, "Tier21:mage:n" },
				{ 213, "Tier21:mage:hB1" },
				{ 214, "Tier21:mage:mB1" },
			},
		},
		{ -- MONK
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[NORMAL_DIFF] = {
				{ 1 , "Tier14:monkbrewmaster:rf" },
				{ 2 , "Tier14:monkmistweaver:rf" },
				{ 3 , "Tier14:monkwindwalker:rf" },
				{ 4 , "Tier14:monkbrewmaster:n" },
				{ 5 , "Tier14:monkmistweaver:n" },
				{ 6 , "Tier14:monkwindwalker:n" },
				{ 7 , "Tier14:monkbrewmaster:h" },
				{ 8 , "Tier14:monkmistweaver:h" },
				{ 9 , "Tier14:monkwindwalker:h" },
				{ 16, "Tier15:monkbrewmaster:rf" },
				{ 17, "Tier15:monkmistweaver:rf" },
				{ 18, "Tier15:monkwindwalker:rf" },
				{ 19, "Tier15:monkbrewmaster:n" },
				{ 20, "Tier15:monkmistweaver:n" },
				{ 21, "Tier15:monkwindwalker:n" },
				{ 22, "Tier15:monkbrewmaster:h" },
				{ 23, "Tier15:monkmistweaver:h" },
				{ 24, "Tier15:monkwindwalker:h" },
				{ 101, "Tier16:monkbrewmaster:rf" },
				{ 102, "Tier16:monkmistweaver:rf" },
				{ 103, "Tier16:monkwindwalker:rf" },
				{ 104, "Tier16:monkbrewmaster:n" },
				{ 105, "Tier16:monkmistweaver:n" },
				{ 106, "Tier16:monkwindwalker:n" },
				{ 107, "Tier16:monkbrewmaster:h" },
				{ 108, "Tier16:monkmistweaver:h" },
				{ 109, "Tier16:monkwindwalker:h" },
				{ 110, "Tier16:monkbrewmaster:m" },
				{ 111, "Tier16:monkmistweaver:m" },
				{ 112, "Tier16:monkwindwalker:m" },
				{ 116, "Tier17:monk:n" },
				{ 117, "Tier17:monk:hB1" },
				{ 118, "Tier17:monk:mB1" },
				{ 120, "Tier18:monk:n" },
				{ 121, "Tier18:monk:hB1" },
				{ 122, "Tier18:monk:mB1" },
				{ 124, "Tier19:monk:rf" },
				{ 125, "Tier19:monk:n" },
				{ 126, "Tier19:monk:hB1" },
				{ 127, "Tier19:monk:mB1" },
				{ 201, "Tier20:monk:rf" },
				{ 202, "Tier20:monk:n" },
				{ 203, "Tier20:monk:hB1" },
				{ 204, "Tier20:monk:mB1" },
				{ 206, "Tier21:monk:rf" },
				{ 207, "Tier21:monk:n" },
				{ 208, "Tier21:monk:hB1" },
				{ 209, "Tier21:monk:mB1" },
			},
		},
		{ -- PALADIN
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[NORMAL_DIFF] = {
				{ 1 , "Tier1:paladin:n" },
				{ 3 , "Tier2:paladin:n" },
				{ 5 , "Tier3:paladin:n" },
				{ 7 , "Tier4:paladinholy:n" },
				{ 8 , "Tier4:paladinprotection:n" },
				{ 9 , "Tier4:paladinretribution:n" },
				{ 11, "Tier5:paladinholy:p25" },
				{ 12, "Tier5:paladinprotection:p25" },
				{ 13, "Tier5:paladinretribution:p25" },
				{ 16, "Tier6:paladinholy:p25" },
				{ 17, "Tier6:paladinprotection:p25" },
				{ 18, "Tier6:paladinretribution:p25" },
				{ 20, "Tier7:paladinholy:n" },
				{ 21, "Tier7:paladinprotection:n" },
				{ 22, "Tier7:paladinretribution:n" },
				{ 23, "Tier7:paladinholy:p25" },
				{ 24, "Tier7:paladinprotection:p25" },
				{ 25, "Tier7:paladinretribution:p25" },
				{ 101, "Tier8:paladinholy:n" },
				{ 102, "Tier8:paladinprotection:n" },
				{ 103, "Tier8:paladinretribution:n" },
				{ 104, "Tier8:paladinholy:p25" },
				{ 105, "Tier8:paladinprotection:p25" },
				{ 106, "Tier8:paladinretribution:p25" },
				{ 108, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinholy:n", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinholy:n" },
				{ 109, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinholy:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinholy:p25" },
				{ 110, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinholy:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinholy:p25h" },
				{ 111, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinprotection:n", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinprotection:n" },
				{ 112, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinprotection:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinprotection:p25" },
				{ 113, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinprotection:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinprotection:p25h" },
				{ 114, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinretribution:n", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinretribution:n" },
				{ 115, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinretribution:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinretribution:p25" },
				{ 116, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:paladinretribution:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:paladinretribution:p25h" },
				{ 118, "Tier10:paladinholy:n" },
				{ 119, "Tier10:paladinprotection:n" },
				{ 120, "Tier10:paladinretribution:n" },
				{ 121, "Tier10:paladinholy:p25" },
				{ 122, "Tier10:paladinprotection:p25" },
				{ 123, "Tier10:paladinretribution:p25" },
				{ 124, "Tier10:paladinholy:p25h" },
				{ 125, "Tier10:paladinprotection:p25h" },
				{ 126, "Tier10:paladinretribution:p25h" },
				{ 201, "Tier11:paladinholy:n" },
				{ 202, "Tier11:paladinprotection:n" },
				{ 203, "Tier11:paladinretribution:n" },
				{ 204, "Tier11:paladinholy:h" },
				{ 205, "Tier11:paladinprotection:h" },
				{ 206, "Tier11:paladinretribution:h" },
				{ 208, "Tier12:paladinholy:n" },
				{ 209, "Tier12:paladinprotection:n" },
				{ 210, "Tier12:paladinretribution:n" },
				{ 211, "Tier12:paladinholy:h" },
				{ 212, "Tier12:paladinprotection:h" },
				{ 213, "Tier12:paladinretribution:h" },
				{ 216, "Tier13:paladinholy:rf" },
				{ 217, "Tier13:paladinprotection:rf" },
				{ 218, "Tier13:paladinretribution:rf" },
				{ 219, "Tier13:paladinholy:n" },
				{ 220, "Tier13:paladinprotection:n" },
				{ 221, "Tier13:paladinretribution:n" },
				{ 222, "Tier13:paladinholy:h" },
				{ 223, "Tier13:paladinprotection:h" },
				{ 224, "Tier13:paladinretribution:h" },
				{ 301, "Tier14:paladinholy:rf" },
				{ 302, "Tier14:paladinprotection:rf" },
				{ 303, "Tier14:paladinretribution:rf" },
				{ 304, "Tier14:paladinholy:n" },
				{ 305, "Tier14:paladinprotection:n" },
				{ 306, "Tier14:paladinretribution:n" },
				{ 307, "Tier14:paladinholy:h" },
				{ 308, "Tier14:paladinprotection:h" },
				{ 309, "Tier14:paladinretribution:h" },
				{ 316, "Tier15:paladinholy:rf" },
				{ 317, "Tier15:paladinprotection:rf" },
				{ 318, "Tier15:paladinretribution:rf" },
				{ 319, "Tier15:paladinholy:n" },
				{ 320, "Tier15:paladinprotection:n" },
				{ 321, "Tier15:paladinretribution:n" },
				{ 322, "Tier15:paladinholy:h" },
				{ 323, "Tier15:paladinprotection:h" },
				{ 324, "Tier15:paladinretribution:h" },
				{ 401, "Tier16:paladinholy:rf" },
				{ 402, "Tier16:paladinprotection:rf" },
				{ 403, "Tier16:paladinretribution:rf" },
				{ 404, "Tier16:paladinholy:n" },
				{ 405, "Tier16:paladinprotection:n" },
				{ 406, "Tier16:paladinretribution:n" },
				{ 407, "Tier16:paladinholy:h" },
				{ 408, "Tier16:paladinprotection:h" },
				{ 409, "Tier16:paladinretribution:h" },
				{ 410, "Tier16:paladinholy:m" },
				{ 411, "Tier16:paladinprotection:m" },
				{ 412, "Tier16:paladinretribution:m" },
				{ 416, "Tier17:paladin:n" },
				{ 417, "Tier17:paladin:hB1" },
				{ 418, "Tier17:paladin:mB1" },
				{ 420, "Tier18:paladin:n" },
				{ 421, "Tier18:paladin:hB1" },
				{ 422, "Tier18:paladin:mB1" },
				{ 424, "Tier19:paladin:rf" },
				{ 425, "Tier19:paladin:n" },
				{ 426, "Tier19:paladin:hB1" },
				{ 427, "Tier19:paladin:mB1" },
				{ 501, "Tier20:paladin:rf" },
				{ 502, "Tier20:paladin:n" },
				{ 503, "Tier20:paladin:hB1" },
				{ 504, "Tier20:paladin:mB1" },
				{ 506, "Tier21:paladin:rf" },
				{ 507, "Tier21:paladin:n" },
				{ 508, "Tier21:paladin:hB1" },
				{ 509, "Tier21:paladin:mB1" },
			},
		},
		{ -- PRIEST
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[NORMAL_DIFF] = {
				{ 1 , "Tier1:priest:n" },
				{ 3 , "Tier2:priest:n" },
				{ 5 , "Tier3:priest:n" },
				{ 7 , "Tier4:priestheal:n" },
				{ 8 , "Tier4:priestshadow:n" },
				{ 10, "Tier5:priestheal:p25" },
				{ 11, "Tier5:priestshadow:p25" },
				{ 13, "Tier6:priestheal:p25" },
				{ 14, "Tier6:priestshadow:p25" },
				{ 16, "Tier7:priestheal:n" },
				{ 17, "Tier7:priestshadow:n" },
				{ 18, "Tier7:priestheal:p25" },
				{ 19, "Tier7:priestshadow:p25" },
				{ 21, "Tier8:priestheal:n" },
				{ 22, "Tier8:priestshadow:n" },
				{ 23, "Tier8:priestheal:p25" },
				{ 24, "Tier8:priestshadow:p25" },
				{ 101, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestheal:n", [ATLASLOOT_IT_HORDE] = "Tier9H:priestheal:n" },
				{ 102, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestheal:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:priestheal:p25" },
				{ 103, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestheal:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:priestheal:p25h" },
				{ 104, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestshadow:n", [ATLASLOOT_IT_HORDE] = "Tier9H:priestshadow:n" },
				{ 105, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestshadow:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:priestshadow:p25" },
				{ 106, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:priestshadow:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:priestshadow:p25h" },
				{ 108, "Tier10:priestheal:n" },
				{ 109, "Tier10:priestshadow:n" },
				{ 110, "Tier10:priestheal:p25" },
				{ 111, "Tier10:priestshadow:p25" },
				{ 112, "Tier10:priestheal:p25h" },
				{ 113, "Tier10:priestshadow:p25h" },
				{ 116, "Tier11:priestheal:n" },
				{ 117, "Tier11:priestshadow:n" },
				{ 118, "Tier11:priestheal:h" },
				{ 119, "Tier11:priestshadow:h" },
				{ 121, "Tier12:priestheal:n" },
				{ 122, "Tier12:priestshadow:n" },
				{ 123, "Tier12:priestheal:h" },
				{ 124, "Tier12:priestshadow:h" },
				{ 201, "Tier13:priestheal:rf" },
				{ 202, "Tier13:priestshadow:rf" },
				{ 203, "Tier13:priestheal:n" },
				{ 204, "Tier13:priestshadow:n" },
				{ 205, "Tier13:priestheal:h" },
				{ 206, "Tier13:priestshadow:h" },
				{ 208, "Tier14:priestheal:rf" },
				{ 209, "Tier14:priestshadow:rf" },
				{ 210, "Tier14:priestheal:n" },
				{ 211, "Tier14:priestshadow:n" },
				{ 212, "Tier14:priestheal:h" },
				{ 213, "Tier14:priestshadow:h" },
				{ 216, "Tier15:priestheal:rf" },
				{ 217, "Tier15:priestshadow:rf" },
				{ 218, "Tier15:priestheal:n" },
				{ 219, "Tier15:priestshadow:n" },
				{ 220, "Tier15:priestheal:h" },
				{ 221, "Tier15:priestshadow:h" },
				{ 223, "Tier16:priestheal:rf" },
				{ 224, "Tier16:priestshadow:rf" },
				{ 225, "Tier16:priestheal:n" },
				{ 226, "Tier16:priestshadow:n" },
				{ 227, "Tier16:priestheal:h" },
				{ 228, "Tier16:priestshadow:h" },
				{ 229, "Tier16:priestheal:m" },
				{ 230, "Tier16:priestshadow:m" },
				{ 301, "Tier17:priest:n" },
				{ 302, "Tier17:priest:hB1" },
				{ 303, "Tier17:priest:mB1" },
				{ 305, "Tier18:priest:n" },
				{ 306, "Tier18:priest:hB1" },
				{ 307, "Tier18:priest:mB1" },
				{ 309, "Tier19:priest:rf" },
				{ 310, "Tier19:priest:n" },
				{ 311, "Tier19:priest:hB1" },
				{ 312, "Tier19:priest:mB1" },
				{ 316, "Tier20:priest:rf" },
				{ 317, "Tier20:priest:n" },
				{ 318, "Tier20:priest:hB1" },
				{ 319, "Tier20:priest:mB1" },
				{ 321, "Tier21:priest:rf" },
				{ 322, "Tier21:priest:n" },
				{ 323, "Tier21:priest:hB1" },
				{ 324, "Tier21:priest:mB1" },
			},
		},
		{ -- ROGUE
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[NORMAL_DIFF] = {
				{ 1 , "Tier1:rogue:n" },
				{ 3 , "Tier2:rogue:n" },
				{ 5 , "Tier3:rogue:n" },
				{ 7 , "Tier4:rogue:n" },
				{ 9 , "Tier5:rogue:p25" },
				{ 11 , "Tier6:rogue:p25" },
				{ 13, "Tier7:rogue:n" },
				{ 14, "Tier7:rogue:p25" },
				{ 16, "Tier8:rogue:n" },
				{ 17, "Tier8:rogue:p25" },
				{ 19, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:rogue:n", [ATLASLOOT_IT_HORDE] = "Tier9H:rogue:n" },
				{ 20, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:rogue:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:rogue:p25" },
				{ 21, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:rogue:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:rogue:p25h" },
				{ 23, "Tier10:rogue:n" },
				{ 24, "Tier10:rogue:p25" },
				{ 25, "Tier10:rogue:p25h" },
				{ 27, "Tier11:rogue:n" },
				{ 28, "Tier11:rogue:h" },
				{ 101, "Tier12:rogue:n" },
				{ 102, "Tier12:rogue:h" },
				{ 104, "Tier13:rogue:rf" },
				{ 105, "Tier13:rogue:n" },
				{ 106, "Tier13:rogue:h" },
				{ 108, "Tier14:rogue:rf" },
				{ 109, "Tier14:rogue:n" },
				{ 110, "Tier14:rogue:h" },
				{ 112, "Tier15:rogue:rf" },
				{ 113, "Tier15:rogue:n" },
				{ 114, "Tier15:rogue:h" },
				{ 116, "Tier16:rogue:rf" },
				{ 117, "Tier16:rogue:n" },
				{ 118, "Tier16:rogue:h" },
				{ 119, "Tier16:rogue:m" },
				{ 121, "Tier17:rogue:n" },
				{ 122, "Tier17:rogue:hB1" },
				{ 123, "Tier17:rogue:mB1" },
				{ 125, "Tier18:rogue:n" },
				{ 126, "Tier18:rogue:hB1" },
				{ 127, "Tier18:rogue:mB1" },
				{ 201, "Tier19:rogue:rf" },
				{ 202, "Tier19:rogue:n" },
				{ 203, "Tier19:rogue:hB1" },
				{ 204, "Tier19:rogue:mB1" },
				{ 206, "Tier20:rogue:rf" },
				{ 207, "Tier20:rogue:n" },
				{ 208, "Tier20:rogue:hB1" },
				{ 209, "Tier20:rogue:mB1" },
				{ 211, "Tier21:rogue:rf" },
				{ 212, "Tier21:rogue:n" },
				{ 213, "Tier21:rogue:hB1" },
				{ 214, "Tier21:rogue:mB1" },
			},
		},
		{ -- SHAMAN
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[NORMAL_DIFF] = {
				{ 1 , "Tier1:shaman:n" },
				{ 3 , "Tier2:shaman:n" },
				{ 5 , "Tier3:shaman:n" },
				{ 7 , "Tier4:shamanelemental:n" },
				{ 8 , "Tier4:shamanenhancement:n" },
				{ 9 , "Tier4:shamanrestoration:n" },
				{ 11, "Tier5:shamanelemental:p25" },
				{ 12, "Tier5:shamanenhancement:p25" },
				{ 13, "Tier5:shamanrestoration:p25" },
				{ 16, "Tier6:shamanelemental:p25" },
				{ 17, "Tier6:shamanenhancement:p25" },
				{ 18, "Tier6:shamanrestoration:p25" },
				{ 20, "Tier7:shamanelemental:n" },
				{ 21, "Tier7:shamanenhancement:n" },
				{ 22, "Tier7:shamanrestoration:n" },
				{ 23, "Tier7:shamanelemental:p25" },
				{ 24, "Tier7:shamanenhancement:p25" },
				{ 25, "Tier7:shamanrestoration:p25" },
				{ 101, "Tier8:shamanelemental:n" },
				{ 102, "Tier8:shamanenhancement:n" },
				{ 103, "Tier8:shamanrestoration:n" },
				{ 104, "Tier8:shamanelemental:p25" },
				{ 105, "Tier8:shamanenhancement:p25" },
				{ 106, "Tier8:shamanrestoration:p25" },
				{ 108, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanelemental:n", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanelemental:n" },
				{ 109, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanelemental:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanelemental:p25" },
				{ 110, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanelemental:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanelemental:p25h" },
				{ 111, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanenhancement:n", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanenhancement:n" },
				{ 112, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanenhancement:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanenhancement:p25" },
				{ 113, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanenhancement:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanenhancement:p25h" },
				{ 114, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanrestoration:n", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanrestoration:n" },
				{ 115, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanrestoration:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanrestoration:p25" },
				{ 116, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:shamanrestoration:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:shamanrestoration:p25h" },
				{ 118, "Tier10:shamanelemental:n" },
				{ 119, "Tier10:shamanenhancement:n" },
				{ 120, "Tier10:shamanrestoration:n" },
				{ 121, "Tier10:shamanelemental:p25" },
				{ 122, "Tier10:shamanenhancement:p25" },
				{ 123, "Tier10:shamanrestoration:p25" },
				{ 124, "Tier10:shamanelemental:p25h" },
				{ 125, "Tier10:shamanenhancement:p25h" },
				{ 126, "Tier10:shamanrestoration:p25h" },
				{ 201, "Tier11:shamanelemental:n" },
				{ 202, "Tier11:shamanenhancement:n" },
				{ 203, "Tier11:shamanrestoration:n" },
				{ 204, "Tier11:shamanelemental:h" },
				{ 205, "Tier11:shamanenhancement:h" },
				{ 206, "Tier11:shamanrestoration:h" },
				{ 208, "Tier12:shamanelemental:n" },
				{ 209, "Tier12:shamanenhancement:n" },
				{ 210, "Tier12:shamanrestoration:n" },
				{ 211, "Tier12:shamanelemental:h" },
				{ 212, "Tier12:shamanenhancement:h" },
				{ 213, "Tier12:shamanrestoration:h" },
				{ 216, "Tier13:shamanelemental:rf" },
				{ 217, "Tier13:shamanenhancement:rf" },
				{ 218, "Tier13:shamanrestoration:rf" },
				{ 219, "Tier13:shamanelemental:n" },
				{ 220, "Tier13:shamanenhancement:n" },
				{ 221, "Tier13:shamanrestoration:n" },
				{ 222, "Tier13:shamanelemental:h" },
				{ 223, "Tier13:shamanenhancement:h" },
				{ 224, "Tier13:shamanrestoration:h" },
				{ 301, "Tier14:shamanelemental:rf" },
				{ 302, "Tier14:shamanenhancement:rf" },
				{ 303, "Tier14:shamanrestoration:rf" },
				{ 304, "Tier14:shamanelemental:n" },
				{ 305, "Tier14:shamanenhancement:n" },
				{ 306, "Tier14:shamanrestoration:n" },
				{ 307, "Tier14:shamanelemental:h" },
				{ 308, "Tier14:shamanenhancement:h" },
				{ 309, "Tier14:shamanrestoration:h" },
				{ 316, "Tier15:shamanelemental:rf" },
				{ 317, "Tier15:shamanenhancement:rf" },
				{ 318, "Tier15:shamanrestoration:rf" },
				{ 319, "Tier15:shamanelemental:n" },
				{ 320, "Tier15:shamanenhancement:n" },
				{ 321, "Tier15:shamanrestoration:n" },
				{ 322, "Tier15:shamanelemental:h" },
				{ 323, "Tier15:shamanenhancement:h" },
				{ 324, "Tier15:shamanrestoration:h" },
				{ 401, "Tier16:shamanelemental:rf" },
				{ 402, "Tier16:shamanenhancement:rf" },
				{ 403, "Tier16:shamanrestoration:rf" },
				{ 404, "Tier16:shamanelemental:n" },
				{ 405, "Tier16:shamanenhancement:n" },
				{ 406, "Tier16:shamanrestoration:n" },
				{ 407, "Tier16:shamanelemental:h" },
				{ 408, "Tier16:shamanenhancement:h" },
				{ 409, "Tier16:shamanrestoration:h" },
				{ 410, "Tier16:shamanelemental:m" },
				{ 411, "Tier16:shamanenhancement:m" },
				{ 412, "Tier16:shamanrestoration:m" },
				{ 416, "Tier17:shaman:n" },
				{ 417, "Tier17:shaman:hB1" },
				{ 418, "Tier17:shaman:mB1" },
				{ 420, "Tier18:shaman:n" },
				{ 421, "Tier18:shaman:hB1" },
				{ 422, "Tier18:shaman:mB1" },
				{ 424, "Tier19:shaman:rf" },
				{ 425, "Tier19:shaman:n" },
				{ 426, "Tier19:shaman:hB1" },
				{ 427, "Tier19:shaman:mB1" },
				{ 501, "Tier20:shaman:rf" },
				{ 502, "Tier20:shaman:n" },
				{ 503, "Tier20:shaman:hB1" },
				{ 504, "Tier20:shaman:mB1" },
				{ 506, "Tier21:shaman:rf" },
				{ 507, "Tier21:shaman:n" },
				{ 508, "Tier21:shaman:hB1" },
				{ 509, "Tier21:shaman:mB1" },
			},
		},
		{ -- WARLOCK
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[NORMAL_DIFF] = {
				{ 1 , "Tier1:warlock:n" },
				{ 3 , "Tier2:warlock:n" },
				{ 5 , "Tier3:warlock:n" },
				{ 7 , "Tier4:warlock:n" },
				{ 9 , "Tier5:warlock:p25" },
				{ 11, "Tier6:warlock:p25" },
				{ 13, "Tier7:warlock:n" },
				{ 14, "Tier7:warlock:p25" },
				{ 16, "Tier8:warlock:n" },
				{ 17, "Tier8:warlock:p25" },
				{ 19, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warlock:n", [ATLASLOOT_IT_HORDE] = "Tier9H:warlock:n" },
				{ 20, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warlock:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:warlock:p25" },
				{ 21, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warlock:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:warlock:p25h" },
				{ 23, "Tier10:warlock:n" },
				{ 24, "Tier10:warlock:p25" },
				{ 25, "Tier10:warlock:p25h" },
				{ 27, "Tier11:warlock:n" },
				{ 28, "Tier11:warlock:h" },
				{ 101, "Tier12:warlock:n" },
				{ 102, "Tier12:warlock:h" },
				{ 104, "Tier13:warlock:rf" },
				{ 105, "Tier13:warlock:n" },
				{ 106, "Tier13:warlock:h" },
				{ 109, "Tier14:warlock:rf" },
				{ 110, "Tier14:warlock:n" },
				{ 111, "Tier14:warlock:h" },
				{ 113, "Tier15:warlock:rf" },
				{ 114, "Tier15:warlock:n" },
				{ 115, "Tier15:warlock:h" },
				{ 116, "Tier16:warlock:rf" },
				{ 117, "Tier16:warlock:n" },
				{ 118, "Tier16:warlock:h" },
				{ 119, "Tier16:warlock:m" },
				{ 121, "Tier17:warlock:n" },
				{ 122, "Tier17:warlock:hB1" },
				{ 123, "Tier17:warlock:mB1" },
				{ 125, "Tier18:warlock:n" },
				{ 126, "Tier18:warlock:hB1" },
				{ 127, "Tier18:warlock:mB1" },
				{ 201, "Tier19:warlock:rf" },
				{ 202, "Tier19:warlock:n" },
				{ 203, "Tier19:warlock:hB1" },
				{ 204, "Tier19:warlock:mB1" },
				{ 206, "Tier20:warlock:rf" },
				{ 207, "Tier20:warlock:n" },
				{ 208, "Tier20:warlock:hB1" },
				{ 209, "Tier20:warlock:mB1" },
				{ 211, "Tier21:warlock:rf" },
				{ 212, "Tier21:warlock:n" },
				{ 213, "Tier21:warlock:hB1" },
				{ 214, "Tier21:warlock:mB1" },
			},
		},
		{ -- WARRIOR
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[NORMAL_DIFF] = {
				{ 1 , "Tier1:warrior:n" },
				{ 3 , "Tier2:warrior:n" },
				{ 5 , "Tier3:warrior:n" },
				{ 7 , "Tier4:warriordps:n" },
				{ 8 , "Tier4:warriorprotection:n" },
				{ 10, "Tier5:warriordps:p25" },
				{ 11, "Tier5:warriorprotection:p25" },
				{ 13, "Tier6:warriordps:p25" },
				{ 14, "Tier6:warriorprotection:p25" },
				{ 16, "Tier7:warriordps:n" },
				{ 17, "Tier7:warriorprotection:n" },
				{ 18, "Tier7:warriordps:p25" },
				{ 19, "Tier7:warriorprotection:p25" },
				{ 21, "Tier8:warriordps:n" },
				{ 22, "Tier8:warriorprotection:n" },
				{ 23, "Tier8:warriordps:p25" },
				{ 24, "Tier8:warriorprotection:p25" },
				{ 101, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriordps:n", [ATLASLOOT_IT_HORDE] = "Tier9H:warriordps:n" },
				{ 102, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriordps:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:warriordps:p25" },
				{ 103, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriordps:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:warriordps:p25h" },
				{ 104, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriorprotection:n", [ATLASLOOT_IT_HORDE] = "Tier9H:warriorprotection:n" },
				{ 105, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriorprotection:p25", [ATLASLOOT_IT_HORDE] = "Tier9H:warriorprotection:p25" },
				{ 106, [ATLASLOOT_IT_ALLIANCE] = "Tier9A:warriorprotection:p25h", [ATLASLOOT_IT_HORDE] = "Tier9H:warriorprotection:p25h" },
				{ 108, "Tier10:warriordps:n" },
				{ 109, "Tier10:warriorprotection:n" },
				{ 110, "Tier10:warriordps:p25" },
				{ 111, "Tier10:warriorprotection:p25" },
				{ 112, "Tier10:warriordps:p25h" },
				{ 113, "Tier10:warriorprotection:p25h" },
				{ 116, "Tier11:warriordps:n" },
				{ 117, "Tier11:warriorprotection:n" },
				{ 118, "Tier11:warriordps:h" },
				{ 119, "Tier11:warriorprotection:h" },
				{ 121, "Tier12:warriordps:n" },
				{ 122, "Tier12:warriorprotection:n" },
				{ 123, "Tier12:warriordps:h" },
				{ 124, "Tier12:warriorprotection:h" },
				{ 201, "Tier13:warriordps:rf" },
				{ 202, "Tier13:warriorprotection:rf" },
				{ 203, "Tier13:warriordps:n" },
				{ 204, "Tier13:warriorprotection:n" },
				{ 205, "Tier13:warriordps:h" },
				{ 206, "Tier13:warriorprotection:h" },
				{ 208, "Tier14:warriordps:rf" },
				{ 209, "Tier14:warriorprotection:rf" },
				{ 210, "Tier14:warriordps:n" },
				{ 211, "Tier14:warriorprotection:n" },
				{ 212, "Tier14:warriordps:h" },
				{ 213, "Tier14:warriorprotection:h" },
				{ 216, "Tier15:warriordps:rf" },
				{ 217, "Tier15:warriorprotection:rf" },
				{ 218, "Tier15:warriordps:n" },
				{ 219, "Tier15:warriorprotection:n" },
				{ 220, "Tier15:warriordps:h" },
				{ 221, "Tier15:warriorprotection:h" },
				{ 223, "Tier16:warriordps:rf" },
				{ 224, "Tier16:warriorprotection:rf" },
				{ 225, "Tier16:warriordps:n" },
				{ 226, "Tier16:warriorprotection:n" },
				{ 227, "Tier16:warriordps:h" },
				{ 228, "Tier16:warriorprotection:h" },
				{ 229, "Tier16:warriordps:m" },
				{ 230, "Tier16:warriorprotection:m" },
				{ 301, "Tier17:warrior:n" },
				{ 302, "Tier17:warrior:hB1" },
				{ 303, "Tier17:warrior:mB1" },
				{ 305, "Tier18:warrior:n" },
				{ 306, "Tier18:warrior:hB1" },
				{ 307, "Tier18:warrior:mB1" },
				{ 309, "Tier19:warrior:rf" },
				{ 310, "Tier19:warrior:n" },
				{ 311, "Tier19:warrior:hB1" },
				{ 312, "Tier19:warrior:mB1" },
				{ 316, "Tier20:warrior:rf" },
				{ 317, "Tier20:warrior:n" },
				{ 318, "Tier20:warrior:hB1" },
				{ 319, "Tier20:warrior:mB1" },
				{ 321, "Tier21:warrior:rf" },
				{ 322, "Tier21:warrior:n" },
				{ 323, "Tier21:warrior:hB1" },
				{ 324, "Tier21:warrior:mB1" },
			},
		},
	
	},
}

data["TIMELESSISLE"] = {
	name = ALIL["Timeless Isle"].." "..AL["Rewards"],
	ContentType = COLLECTION_CONTENT,
	items = {
		{
			name = ALIL["Timeless Isle"].." "..AL["Rewards"],
			[NORMAL_DIFF] = {
				{ 1, 103989, [PRICE_EXTRA_ITTYPE] = "timelesscoin:50000" },	-- Alacrity of Xuen
				{ 2, 103988, [PRICE_EXTRA_ITTYPE] = "timelesscoin:50000" },	-- Contemplation of Chi-Ji
				{ 3, 103986, [PRICE_EXTRA_ITTYPE] = "timelesscoin:50000" },	-- Discipline of Xuen
				{ 4, 103990, [PRICE_EXTRA_ITTYPE] = "timelesscoin:50000" },	-- Resolve of Niuzao
				{ 5, 103987, [PRICE_EXTRA_ITTYPE] = "timelesscoin:50000" },	-- Yu'lon's Bite
				{ 6, 103678, [PRICE_EXTRA_ITTYPE] = "timelesscoin:7500" },	-- Time-Lost Artifact
				{ 8, 103982, [PRICE_EXTRA_ITTYPE] = "timelesscoin:50000" },	-- Burden of Eternity
				{ 10, 87774, [PRICE_EXTRA_ITTYPE] = "timelesscoin:100000" },	-- Reins of the Heavenly Golden Cloud Serpent
				{ 11, 104295, [PRICE_EXTRA_ITTYPE] = "timelesscoin:7500" },	-- Harmonious Porcupette
				{ 12, 104332, [PRICE_EXTRA_ITTYPE] = "timelesscoin:7500" },	-- Sky Lantern
				{ 16, 105921, [PRICE_EXTRA_ITTYPE] = "timelesscoin:20000" },	-- Cloudscorcher Greatstaff
				{ 17, 105923, [PRICE_EXTRA_ITTYPE] = "timelesscoin:20000" },	-- Contemplation of Shaohao
				{ 18, 105927, [PRICE_EXTRA_ITTYPE] = "timelesscoin:20000" },	-- Featherdraw Longbow
				{ 19, 105924, [PRICE_EXTRA_ITTYPE] = "timelesscoin:10000" },	-- Hozen Can Opener
				{ 20, 105926, [PRICE_EXTRA_ITTYPE] = "timelesscoin:10000" },	-- Ordon Sacrificial Dagger
				{ 21, 105920, [PRICE_EXTRA_ITTYPE] = "timelesscoin:10000" },	-- Pandaren Peace Offering
				{ 22, 105929, [PRICE_EXTRA_ITTYPE] = "timelesscoin:10000" },	-- Scavenged Pandaren Dagger
				{ 23, 105925, [PRICE_EXTRA_ITTYPE] = "timelesscoin:20000" },	-- Yak-Herder's Longstaff
				{ 24, 105919, [PRICE_EXTRA_ITTYPE] = "timelesscoin:10000" },	-- Daylight Protectorate
				{ 25, 105922, [PRICE_EXTRA_ITTYPE] = "timelesscoin:10000" },	-- Shield of the Eternal Noon
				{ 27, 104013, [PRICE_EXTRA_ITTYPE] = "timelesscoin:7500" },	-- Timeless Cloth Armor Cache
				{ 28, 104012, [PRICE_EXTRA_ITTYPE] = "timelesscoin:7500" },	-- Timeless Leather Armor Cache
				{ 29, 104010, [PRICE_EXTRA_ITTYPE] = "timelesscoin:7500" },	-- Timeless Mail Armor Cache
				{ 30, 104009, [PRICE_EXTRA_ITTYPE] = "timelesscoin:7500" },	-- Timeless Plate Armor Cache
				{ 101, 103685, [PRICE_EXTRA_ITTYPE] = "timelesscoin:2500" },	-- Celestial Defender's Medallion
				{ 102, 101538, [PRICE_EXTRA_ITTYPE] = "timelesscoin:500" },	-- Kukuru's Cache Key
				{ 103, 103683, [PRICE_EXTRA_ITTYPE] = "timelesscoin:100" },	-- Mask of Anger
				{ 104, 103681, [PRICE_EXTRA_ITTYPE] = "timelesscoin:100" },	-- Mask of Doubt
				{ 105, 103679, [PRICE_EXTRA_ITTYPE] = "timelesscoin:100" },	-- Mask of Fear
				{ 106, 103680, [PRICE_EXTRA_ITTYPE] = "timelesscoin:100" },	-- Mask of Hatred
				{ 107, 103682, [PRICE_EXTRA_ITTYPE] = "timelesscoin:100" },	-- Mask of Violence
				{ 108, 103684, [PRICE_EXTRA_ITTYPE] = "timelesscoin:500" },	-- Scroll of Challenge
				{ 109, 103786, [PRICE_EXTRA_ITTYPE] = "timelesscoin:500", [ATLASLOOT_IT_AMOUNT1] = 5 },	-- "Dapper Gentleman" Costume
				{ 110, 103795, [PRICE_EXTRA_ITTYPE] = "timelesscoin:500", [ATLASLOOT_IT_AMOUNT1] = 5 },	-- "Dread Pirate" Costume
				{ 111, 103789, [PRICE_EXTRA_ITTYPE] = "timelesscoin:500", [ATLASLOOT_IT_AMOUNT1] = 5 },	-- "Little Princess" Costume
				{ 112, 103797, [PRICE_EXTRA_ITTYPE] = "timelesscoin:500", [ATLASLOOT_IT_AMOUNT1] = 5 },	-- Big Pink Bow
				{ 113, 71153, [PRICE_EXTRA_ITTYPE] = "timelesscoin:500", [ATLASLOOT_IT_AMOUNT1] = 25 },	-- Magical Pet Biscuit
				{ 114, 103977, [PRICE_EXTRA_ITTYPE] = "timelesscoin:500" },	-- Time-Worn Journal
				{ 116, 102467, [PRICE_EXTRA_ITTYPE] = "timelesscoin:2500" },	-- Censer of Eternal Agony
				{ 118, 103638, [PRICE_EXTRA_ITTYPE] = "bloodycoin:500" },	-- Reins of the Ashhide Mushan Beast
				{ 119, 103639, [PRICE_EXTRA_ITTYPE] = "bloodycoin:20" },	-- Pouch of White Ash
				{ 120, 103637, [PRICE_EXTRA_ITTYPE] = "bloodycoin:100" },	-- Vengeful Porcupette
				{ 121, 102463, [PRICE_EXTRA_ITTYPE] = "bloodycoin:50" },	-- Fire-Watcher's Oath
				{ 122, 102464, [PRICE_EXTRA_ITTYPE] = "bloodycoin:1" },	-- Black Ash
				{ 124, 102145, [PRICE_EXTRA_ITTYPE] = "101529:3" },	-- Chi-Chi, Hatchling of Chi-Ji
				{ 125, 101771, [PRICE_EXTRA_ITTYPE] = "101529:3" },	-- Xu-Fu, Cub of Xuen
				{ 126, 102147, [PRICE_EXTRA_ITTYPE] = "101529:3" },	-- Yu'la, Broodling of Yu'lon
				{ 127, 102146, [PRICE_EXTRA_ITTYPE] = "101529:3" },	-- Zao, Calfling of Niuzao
				{ 128, 98715, [PRICE_EXTRA_ITTYPE] = "101529:3" },	-- Marked Flawless Battle-Stone
				{ 129, 86143, [PRICE_EXTRA_ITTYPE] = "101529:1", [ATLASLOOT_IT_AMOUNT1] = 25 },	-- Battle Pet Bandage
				{ 130, 98114, [PRICE_EXTRA_ITTYPE] = "101529:1" },	-- Pet Treat
			},
		},
	},
}
