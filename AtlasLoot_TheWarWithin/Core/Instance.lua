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

local RF_DIFF = data:AddDifficulty(AL["Raid Finder"], "LFRWithPreset", {
	Item = {
		item2bonus = "TWWMaxItemLvl",
		autoCompleteItem2 = true,
		addDifficultyBonus = true,
	},
}, 17)
local NORMAL_DIFF = data:AddDifficulty(AL["Normal"], "n", {
	Item = {
		item1bonus = "Scaling",
		addDifficultyBonus = true,
	},
}, 1)
local NORMAL_RAID_DIFF = data:AddDifficulty(AL["Normal"], "NormalRaidWithPreset", {
	Item = {
		item2bonus = "TWWMaxItemLvl",
		autoCompleteItem2 = true,
		addDifficultyBonus = true,
	},
}, 14)
local NORMAL_DUNGEON_DIFF = data:AddDifficulty(AL["Normal"], "DungeonWithPreset", {
	Item = {
		item1bonus = "Scaling",
		item2bonus = "TWWMaxItemLvl",
		autoCompleteItem2 = true,
		addDifficultyBonus = true,
	},
}, 1)
local HEROIC_DIFF = data:AddDifficulty(AL["Heroic"], "h", nil, 2)
local HEROIC_DUNGEON_DIFF = data:AddDifficulty(AL["Heroic"], "HeroicDungeonWithPreset", {
	Item = {
		item2bonus = "TWWMaxItemLvl", --"BfAHCDungeonTitanforged",
		autoCompleteItem2 = true,
		addDifficultyBonus = true,
	},
}, 2)
local MYTHICD_DIFF = data:AddDifficulty(AL["Mythic"], "h", nil, 23)
local MYTHICD_DUNGEON_DIFF = data:AddDifficulty(AL["Mythic"], "MythicDungeonWithPreset", {
	Item = {
		item2bonus = "TWWMaxItemLvl",
		autoCompleteItem2 = true,
		addDifficultyBonus = true,
	},
}, 23)
local MYTHICD2_DIFF = data:AddDifficulty(AL["Mythic"], "h", nil, 23)
local MYTHICD2_DUNGEON_DIFF = data:AddDifficulty(AL["Mythic"], "MythicDungeon2WithPreset", {
	Item = {
		item1bonus = "LegionMDungeon2",
		item2bonus = "TWWMaxItemLvl",
		autoCompleteItem2 = true,
		addDifficultyBonus = true,
	},
}, 23)
local HEROIC_PRE_DIFF = data:AddDifficulty(AL["Heroic"], "HeroicWithPreset", {
	Item = {
		item2bonus = "TWWMaxItemLvl",
		autoCompleteItem2 = true,
		addDifficultyBonus = true,
	},
}, 15)
local MYTHIC_DIFF = data:AddDifficulty(AL["Mythic"], "m", nil, 16)
local MYTHIC_PRE_DIFF = data:AddDifficulty(AL["Mythic"], "MyhticWithPreset", {
	Item = {
		item2bonus = "TWWMaxItemLvl",
		autoCompleteItem2 = true,
		addDifficultyBonus = true,
	},
}, 16)

local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")
local RAID_ITTYPE = data:AddItemTableType("Item", "Item") -- Normal, Thunder-/Warforged...
local AC_ITTYPE = data:AddItemTableType("Achievement", "Item")

local DUNGEON_CONTENT = data:AddContentType(AL["Dungeons"], ATLASLOOT_DUNGEON_COLOR)
local RAID_CONTENT = data:AddContentType(AL["Raids"], ATLASLOOT_RAID_COLOR)

-- Shared loot tables
local THEWARWITHIN_RAID_HERO_AC_TABLE = {	--[Glory of the Nerub-ar Raider]
	name = select(2, GetAchievementInfo(40232)),
	TableType = AC_ITTYPE,
	ExtraList = true,
	CoinTexture = "Achievement",
	[MYTHIC_DIFF] = {

		{ 1, 40232, --[[ "mount223266" ]] },
		{ 3, 40261 },   { 18, 40260 },
		{ 4, 40255 },   { 19, 40262 },
		{ 5, 40263 },   { 20, 40264 },
		{ 6, 40730 },   { 21, 40266 },

	},
}

-- /////////////////////////////////
-- Instance
-- /////////////////////////////////
--[[
data["InstanceName"] = {
	EncounterJournalID = 111,
	MapID = 749,
	ContentType = DUNGEON_CONTENT / RAID_CONTENT,
	TableType = RAID_ITTYPE,
	items = 
	{
		{ -- bossN
			EncounterJournalID = 1111,
			[NORMAL_RAID_DIFF] = {
			},
		},
	}
}
]]

-- Dungeons

data["Ara-Kara, City of Echoes"] = {
	EncounterJournalID = 1271,
	MapID = 2357,
	AtlasMapID = "Arakara",
	ContentType = DUNGEON_CONTENT,
	items = 
	{
		{ -- Avanoxx
			EncounterJournalID = 2583,
			[NORMAL_DUNGEON_DIFF] = {

			},
			[HEROIC_DUNGEON_DIFF] = {
				GetItemsFromDiff = NORMAL_DUNGEON_DIFF,
			},
			[MYTHICD_DUNGEON_DIFF] = {
				GetItemsFromDiff = NORMAL_DUNGEON_DIFF,
			},
		},
		{ -- Anub'zekt
			EncounterJournalID = 2584,
			[NORMAL_DUNGEON_DIFF] = {

			},
			[HEROIC_DUNGEON_DIFF] = {
				GetItemsFromDiff = NORMAL_DUNGEON_DIFF,
			},
			[MYTHICD_DUNGEON_DIFF] = {
				GetItemsFromDiff = NORMAL_DUNGEON_DIFF,

			},
		},
		{ -- Ki'katal the Harvester
			EncounterJournalID = 2585,
			[NORMAL_DUNGEON_DIFF] = {

			},
			[HEROIC_DUNGEON_DIFF] = {
				GetItemsFromDiff = NORMAL_DUNGEON_DIFF,
			},
			[MYTHICD_DUNGEON_DIFF] = {
				GetItemsFromDiff = NORMAL_DUNGEON_DIFF,
			},
		},
	}
}


-- Raids

data["Nerub-ar"] = {

    EncounterJournalID  = 1273,
    MapID               = 2292,
    AtlasMapID          = "Nerubar",
    ContentType         = RAID_CONTENT,
    items               = {

        { -- Ulgrax the Devourer
			EncounterJournalID = 2607,
			[NORMAL_RAID_DIFF] = {

                { 1, 212419 }, -- Bile-Soaked Harness
                { 2, 212426 }, -- Crunchyy Intruder's Wristband

                { 4, 212423 }, -- Rebel's Drained Marrowslacks
                { 5, 212425 }, -- Devourer's Taut Innards

                { 7, 212428 }, -- Final Meal's Horns
                { 8, 212431 }, -- Undermoth-Lined Footpads

                { 10, 212424 }, -- Seasoned Earthen Boulderplates
                { 11, 212442 }, -- Greatbelt of the Hungerer

                { 16, 212386 }, -- Husk of Swallowing Darkness
                { 17, 219915 }, -- Foul Behemoth's Chelicera
                { 18, 212446 }, -- Royal Emblem of Nerub-ar

                { 20, 212388 }, --Ulgrax's Morsel-Masher
                { 21, 212409 }, --Venom-Etched Claw

                { 23, 220737 }, --Storm Spirit
			},
			[HEROIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[MYTHIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[RF_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
                { 24, 211297 }, -- Fractured Spark of Omens
                { 25, 223123 }, -- Formula: Enchanted Gilded Harbringer Crest
                { 26, 223122 }, -- Formula: Enchanted Runed Harbringer Crest
                { 27, 223121 }, -- Formula: Enchanted Weathered Harbringer Crest
			},
		},
        { -- The Bloodbound Horror

            EncounterJournalID = 2611,
            [NORMAL_RAID_DIFF] = {

                { 1, 212430 }, -- Shattered Eye Cincture
                { 2, 212439 }, -- Beacons of the False Dawn

                { 4, 212438 }, -- Polluted Spectre's Wraps
                { 5, 212417 }, -- Beyond's Dark visage

                { 7, 212421 }, -- Goresplattered Membrane
                { 8, 212414 }, -- Lost Watcher's Remains

                { 10, 212422 }, -- Bloodbound Horror's Legplates
                { 11, 225590 }, -- Boots of the Black Bulwark

                { 16, 212451 }, -- Aberrant Spellforge
                { 17, 219917 }, -- Creeping Coagulum
                { 18, 212447 }, -- Key to the Unseeming

                { 20, 212395 }, -- Blood-Kissed Kukri
                { 21, 212404 }, -- Scepter of Manifested Miasma

                { 23, 220737 }, -- Storm Spirit
			},
			[HEROIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[MYTHIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[RF_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
                { 24, 211297 }, -- Fractured Spark of Omens
                { 25, 223122 }, -- Formula: Enchanted Runed Harbringer Crest

			},
        },


        THEWARWITHIN_RAID_HERO_AC_TABLE

    }
}