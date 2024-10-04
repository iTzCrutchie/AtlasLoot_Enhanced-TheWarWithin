local select, type = select, type
local string = _G.string
local format = string.format
local rawset = rawset

-- WoW
local UnitFactionGroup = UnitFactionGroup
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...
local data = private.data
local addonname = FOLDER_NAME
-- ---------------- --
--  AtlasLoot Setup --
--  --------------- --
local AtlasLoot = _G.AtlasLoot
local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales
local BB = AtlasLoot.LibBabble:Get("LibBabble-Boss-3.0")
local Set = AtlasLoot.Data.Sets:RegisterNewSets(addonname)

-- change sortorder for factions
local ALLIANCE_DIFF, HORDE_DIFF
if UnitFactionGroup("player") == "Horde" then
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE)
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE)
else
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE)
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE)
end

local NORMAL_DIFF = data:AddDifficulty(AL["Normal"], "n", nil, 14)

local PVP_CONTENT = data:AddContentType(AL["PvP"], ATLASLOOT_PVP_COLOR)

local SOURCE_INFO = Set:AddInfoList(AL["Source"])

--[[ template
data["TWW_PvP1_Set"] = {
	name = format(EXPANSION_NAME10.." "..AL["Season %d"], 1).." "..AL["Class Sets"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{ -- DEATHKNIGHT
			name = ATLASLOOT_DEATHKNIGHT_COLOR..ALIL["DEATHKNIGHT"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{ -- DEMONHUNTER
			name = ATLASLOOT_DEMONHUNTER_COLOR..ALIL["DEMONHUNTER"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{ -- DRUID
			name = ATLASLOOT_DRUID_COLOR..ALIL["DRUID"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{ -- HUNTER
			name = ATLASLOOT_HUNTER_COLOR..ALIL["HUNTER"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{ -- MAGE
			name = ATLASLOOT_MAGE_COLOR..ALIL["MAGE"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{ -- MONK
			name = ATLASLOOT_MONK_COLOR..ALIL["MONK"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{ -- PALADIN
			name = ATLASLOOT_PALADIN_COLOR..ALIL["PALADIN"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{ -- PRIEST
			name = ATLASLOOT_PRIEST_COLOR..ALIL["PRIEST"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{ -- ROGUE
			name = ATLASLOOT_ROGUE_COLOR..ALIL["ROGUE"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{ -- SHAMAN
			name = ATLASLOOT_SHAMAN_COLOR..ALIL["SHAMAN"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{ -- WARLOCK
			name = ATLASLOOT_WARLOCK_COLOR..ALIL["WARLOCK"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{ -- WARRIOR
			name = ATLASLOOT_WARRIOR_COLOR..ALIL["WARRIOR"],
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}

data["TWW_PvP1_Gear"] = {
	name = format(EXPANSION_NAME10.." "..AL["Season %d"], 1).." "..AL["Non-Set Gear"],
	ContentType = NORMAL_ITTYPE,
	items = {
		{
			name = format(AL["Legion Season %d Elite"], 1),
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
		{
			name = format(AL["Legion Season %d"], 1),
			[ALLIANCE_DIFF] = {
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
			},
		},
	},
}
-- ]]

data["TWW_PvP1"] = {

    name = format(AL["Season %d"], 1),
    ContentType = PVP_CONTENT,
    items = {
        { -- Set Gear
            name = format(AL["Season %d"], 1) .. " Set Gear",
            [ALLIANCE_DIFF] = {
                {	-- Druid
                name = ALIL["DRUID"],
                subSetName = "druid",
                icon = "druid",
                [SOURCE_INFO] = "sourceTemplate",
                [NORMAL_DIFF] = {
                    21353,	-- Genesis Helm
                    21354,	-- Genesis Shoulderpads
                    21357,	-- Genesis Vest
                    21356,	-- Genesis Trousers
                    21355,	-- Genesis Boots
                },
            },
            },

            [HORDE_DIFF] = {
                GetItemsFromDiff = ALLIANCE_DIFF,
            },

        },
    }
}