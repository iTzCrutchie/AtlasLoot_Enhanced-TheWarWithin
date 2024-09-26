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

-- 	------------------	--
--	Shared Loot Tables	--
--	------------------	--
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

--	---------	--
--	Instances	--
--	---------	--



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

--	--------	--
--	Dungeons	--
--	--------	--

data["Ara-Kara, City of Echoes"] = {
	EncounterJournalID = 1271,
	MapID = 2357,
	--AtlasMapID = "Arakara",
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


--	---------	--
--	Raids		--
--	---------	--

data["Nerub-ar"] = {

    EncounterJournalID  = 1273,
    MapID               = 2292,
    --AtlasMapID          = "Nerubar",
    ContentType         = RAID_CONTENT,
    items               = {

        { -- Ulgrax the Devourer
			EncounterJournalID = 2607,
			[RF_DIFF] = {

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

                { 23, 223123 }, -- Formula: Enchanted Gilded Harbringer Crest
                { 24, 223122 }, -- Formula: Enchanted Runed Harbringer Crest
                { 25, 223121 }, -- Formula: Enchanted Weathered Harbringer Crest

				{ 29, 211297 }, -- Fractured Spark of Omens
				{ 30, 220737 }, --Storm Spirit
			},
			[NORMAL_RAID_DIFF] = {
				GetItemsFromDiff = RF_DIFF
			},
			[HEROIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[MYTHIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
		},
        { -- The Bloodbound Horror

            EncounterJournalID = 2611,
            [RF_DIFF] = {

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

                { 23, 223122 }, -- Formula: Enchanted Runed Harbringer Crest

				{ 29, 211297 }, -- Fractured Spark of Omens
				{ 30, 220737 }, -- Storm Spirit
			},
			[NORMAL_RAID_DIFF] = {
				GetItemsFromDiff = RF_DIFF,
			},
			[HEROIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[MYTHIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
        },
		{ -- Sikran, Captain of the Sureki

			EncounterJournalID = 2599,
			[RF_DIFF] = {

				{ 1, 212416 }, -- Cosmic-tinged Treads

				{ 3, 212445 }, -- Chitin-Spiked Jackboots

				{ 5, 212415 }, -- Throne Defender's Bangles

				{ 7, 212427 }, -- Visor of the Ascended Captain

				{ 9, 212449 }, -- Sikran's Endless Arsenal
				{ 10, 225577 }, -- Sureki Zealot's Insignia

				{ 12, 212399 }, -- Splintershot Silkbow
				{ 13, 212405 }, -- Flawless Phase Blade
				{ 14, 212392 }, -- Duelist's Dancing Steel
				{ 15, 212413 }, -- Honored Executioner's Perforator

				{ 16, 225618 }, -- Dreadful Stalwart's Emblem
				{ 17, 225619 }, -- Mystic Stalwart's Emblem
				{ 18, 225620 }, -- Venerated Stalwart's Emblem
				{ 19, 225621 }, -- Zenith Stalwart's Emblem

				{ 21, 223097 }, -- Pattern: Adrenal Surge Clasp				
				{ 22, 223123 }, -- Formula: Enchanted Gilded Harbringer Crest
				{ 23, 223122 }, -- Formula: Enchanted Runed Harbringer Crest
				{ 24, 223121 }, -- Formula: Enchanted Weathered Harbringer Crest

				{ 29, 211297 }, -- Fractured Spark of Omens
			},
			[NORMAL_RAID_DIFF] = {
				GetItemsFromDiff = RF_DIFF,
			},
			[HEROIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[MYTHIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
		},

		{ -- Rasha'nan

			EncounterJournalID = 2609,
			[RF_DIFF] = {

				{ 1, 212440 }, -- Devotee's Dreadful Headdress

				{ 3, 225583 }, -- Behemoth's Eroded Cinch

				{ 5, 225586 }, -- Rasha'nan's Grotesque Talons

				{ 7, 212437 }, -- Ravaged Lamplighter's Manacles

				{ 9, 212448 }, -- Locket of Broken Memories
				{ 10, 212453 }, -- Skyterror's Corrosive Organ

				{ 12, 225574 }, -- Wings of Shattered Shadow
				{ 14, 212398 }, -- Bludgeons of Blistering Wind
				{ 15, 212391 }, -- Predator's Feasthooks

				{ 16, 225630 }, -- Dreadful Obsenity's Idol
				{ 17, 225631 }, -- Mystic Obscenity's Idol
				{ 18, 225632 }, -- Venerated Obscenity's Idol
				{ 19, 225633 }, -- Zenith Obscenity's Idol

				{ 21, 224435 }, -- Pattern: Duskthread Lining
			},
			[NORMAL_RAID_DIFF] = {
				GetItemsFromDiff = RF_DIFF,
			},
			[HEROIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[MYTHIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
		},

		{ -- Broodtwister Ovi'nax

			EncounterJournalID = 2612,
			[RF_DIFF] = {

				{ 1, 225582 }, -- Assimilated Eggshell Slippers

				{ 3, 225588 }, -- Sanguine Experiment's Bandages

				{ 5, 225580 }, -- Accelerated Ascension Coil

				{ 7, 212418 }, -- Black Blood Injectors

				{ 9, 225576 }, -- Writhing Ringworm
				{ 10, 212452 }, -- Gruesome Syringe
				{ 11, 220305 }, -- Ovi'nax's Mercurial Egg

				{ 13, 212389 }, -- Spire of Transfused Horrors
				{ 14, 212387 }, -- Broodtwister's Grim Catalyst

				{ 16, 225614 }, -- Dreadful Blasphemer's Effigy
				{ 17, 225615 }, -- Mystic Blasphemer's Effigy
				{ 18, 225616 }, -- Venerated Blasphemer's Effigy
				{ 19, 225617 }, -- Zenith Blasphemer's Ephigy

				{ 21, 226190 }, -- Recipe: Sticky Sweet Treat
				{ 22, 223123 }, -- Formula: Enchanted Gilded Harbringer Crest
				{ 23, 223122 }, -- Formula: Enchanted Runed Harbringer Crest
				{ 24, 223121 }, -- Formula: Enchanted Weathered Harbringer Crest

				{ 29, 211297 }, -- Fractured Spark of Omens
				{ 30, 220737 }, -- Storm Spirit
			},
			[NORMAL_RAID_DIFF] = {
				GetItemsFromDiff = RF_DIFF,
			},
			[HEROIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[MYTHIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
		},

		{ -- Nexus-Princess Ky'veza

			EncounterJournalID = 2601,
			[RF_DIFF] = {

				{ 1, 212441 }, -- Binding of the Starless Night

				{ 3, 225591 }, -- Fleeting Massacre Footpads

				{ 5, 225581 }, -- Ky'veza's Covert Clasp

				{ 7, 225589 }, -- Nether Bounty's Greatbelt

				{ 9, 221023 }, -- Treacherous Transmitter
				{ 10, 212456 }, -- Void Reaper's Contract

				{ 12, 219877 }, -- Void Reaper's Warp Blade
				{ 13, 212400 }, -- Shade-Touched Silencer
				{ 14, 225636 }, -- Regicide

				{ 16, 225626 }, -- Dreadful Slayer Icon
				{ 17, 225627 }, -- Mystic Slayer Icon
				{ 18, 225628 }, -- Venerated Slayer Icon
				{ 19, 225629 }, -- Zenith Slayer Icon

				{ 21, 223048 }, -- Plans: Siphoning Stiletto


			},
			[NORMAL_RAID_DIFF] = {
				GetItemsFromDiff = RF_DIFF,
			},
			[HEROIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[MYTHIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
		},

		{ -- The Silken Court

			EncounterJournalID = 2608,
			[RF_DIFF] = {

				{ 1, 225584 }, -- Skeinspinner's Duplicitous Cuffs

				{ 3, 212432 }, -- Thousand-Scar Implalers

				{ 5, 212429 }, -- Whispering Voidlight Spaulders

				{ 7, 212443 }, -- Shattershell Greaves

				{ 9, 225575 }, -- Silken Advisor's Favor
				{ 10, 212450 }, -- Swarmlord's Authority
				{ 11, 220202 }, -- Spymaster's Web

				{ 13, 212407 }, -- Anub'arash's Colossal Mandible
				{ 14, 212397 }, -- Takazj's Entropic Edict

				{ 16, 225622 }, -- Dreadful Conniver's Badge
				{ 17, 225623 }, -- Mystic Conniver's Badge
				{ 18, 225624 }, -- Venerated Conniver's Badge
				{ 19, 225625 }, -- Zenith Conniver's Badge

				{ 21, 223094 }, -- Design: Magnificient Jewler's Setting


			},
			[NORMAL_RAID_DIFF] = {
				GetItemsFromDiff = RF_DIFF,
			},
			[HEROIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[MYTHIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
		},

		{ -- Queen Ansurek

			EncounterJournalID = 2602,
			[RF_DIFF] = {

				{ 1, 225585 }, -- Acrid Ascendant's Sash
				{ 2, 212434 }, -- Voidspoken Sarong

				{ 4, 212444 }, -- Frame of Felled Insurgents
				{ 5, 212433 }, -- Omnivore's Venomous Camouflage

				{ 6, 212436 }, -- Clutches of Paranoia
				{ 7, 212435 }, -- Liquified Defector's Leggings

				{ 8, 225587 }, -- Devoted Offering's Irons
				{ 9, 212420 }, -- Quennsguard Carapace

				{ 11, 225578 }, -- Seal of the Poisoned Pact
				{ 12, 212454 }, -- Mad Queen's Mandate

				{ 16, 225579 }, -- Crest of the Caustic Despot
				{ 17, 212401 }, -- Ansurek's Final Judgement
				{ 18, 212394 }, -- Sovereign's Disdain

				{ 21, 223144 }, -- Formula: Enchant Weapon - Authority of the Depths

				{ 25, 225634 }, -- Web-Wrapped Curio

				{ 30, 224147, "mount" }, -- Reins of the Sureki Skyrazor


			},
			[NORMAL_RAID_DIFF] = {
				GetItemsFromDiff = RF_DIFF,
			},
			[HEROIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[MYTHIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
				{ 29, 224151, "mount" }, -- Reins of the Ascendant Skyrazor
			},
		},

		{ -- Trash BOE Drops

			name = AL["Trash Mobs"],

			[RF_DIFF] = {

				{ 1, 225720 }, -- Web Acolyte's Hood
				{ 2, 225721 }, -- Prime Slime Slippers

				{ 4, 225722 }, -- Adorned Lynxborne Pauldrons
				{ 5, 225723 }, -- Venom Stalker's Strap

				{ 6, 225724 }, -- Shrillwing Hunter's Prey
				{ 7, 225725 }, -- Lurking Maurauder's Bindings

				{ 8, 225727 }, -- Captured Earthen's Ironhorns
				{ 9, 225744 }, -- Heritage Militia's Stompers

				{ 11, 225728 }, -- Acidic Attendant's Loop


			},
			[NORMAL_RAID_DIFF] = {
				GetItemsFromDiff = RF_DIFF,
			},
			[HEROIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
			[MYTHIC_PRE_DIFF] = {
				GetItemsFromDiff = NORMAL_RAID_DIFF,
			},
		},

    	THEWARWITHIN_RAID_HERO_AC_TABLE

    }
}