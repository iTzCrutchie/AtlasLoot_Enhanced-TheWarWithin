local _G = getfenv(0)
local AtlasLoot = _G.AtlasLoot
local BonusRoll = {}
AtlasLoot.Addons.BonusRoll = BonusRoll
local QLF = AtlasLoot.GUI.QuickLootFrame
local AL = AtlasLoot.Locales

-- lua
local match = string.match
local tonumber = tonumber

-- DB
-- /run BonusRollFrame_StartBonusRoll(227131, "", 180, 1273)
-- /run BonusRollFrame_StartBonusRoll(190156, "", 180, 738)
-- [BonusRollID] = "tierID:instanceID:encounterID"		<- new
-- Use /dump GetJournalInfoForSpellConfirmation(spellID) to get instanceID and encounterID
-- Also look into here for more information: http://www.wowhead.com/spells/name:Bonus+Roll+Prompt
local BONUS_ROLL_IDS = {
	-- ## Battle for Azeroth
	-- Atal'Dazar
	[268472] = "8:968:2082",		-- Priestess Alun'za
	[268477] = "8:968:2036",		-- Vol'kaal
	[268479] = "8:968:2083",		-- Rezan
	[268481] = "8:968:2030",		-- Yazma
	-- Uldir
	-- Azeroth
	[275407] = "8:1028:2139",		-- T'zane
	[275408] = "8:1028:2198",		-- Warbringer Yenajz
	[275409] = "8:1028:2141",		-- Ji'arak
	[275411] = "8:1028:2199",		-- Azurethos, The Winged Typhoon
	[275413] = "8:1028:2210",		-- Dunegorger Kraulok
	[275414] = "8:1028:2197",		-- Hailstone Construct
	[275415] = "8:1028:2213",		-- Doom's Howl
	[275416] = "8:1028:2212",		-- The Lion's Roar

	-- ### Legion
	-- BrokenIsles
	[227128] = "7:822:1790",		-- Ana-Mouz
	[227129] = "7:822:1774",		-- Calamir
	[227130] = "7:822:1789",		-- Drugon the Frostblood
	[227131] = "7:822:1795",		-- Flotsam
	[227132] = "7:822:1770",		-- Humongris
	[227133] = "7:822:1769",		-- Levantus
	[227134] = "7:822:1783",		-- Na'zak the Fiend
	[227135] = "7:822:1749",		-- Nithogg
	[227136] = "7:822:1763",		-- Shar'thos
	[227137] = "7:822:1756",		-- The Soultakers
	[227138] = "7:822:1796",		-- Withered J'im
	-- Broken Shore
	[242970] = "7:822:1883",		-- Brutallus
	[242971] = "7:822:1884",		-- Malificus
	[242972] = "7:822:1885",		-- Si'vash
	[242969] = "7:822:1956",		-- Apocron
	-- Tomb of Sargeras
	[240655] = "7:875:1862",		-- Goroth
	[240656] = "7:875:1867",		-- Demonic Inquisition
	[240657] = "7:875:1856",		-- Harjatan
	[240659] = "7:875:1903",		-- Sisters of the Moon
	[240658] = "7:875:1861",		-- Mistress Sassz'ine
	[240660] = "7:875:1896",		-- The Desolate Host
	[240661] = "7:875:1897",		-- Maiden of Vigilance
	[240662] = "7:875:1873",		-- Fallen Avatar
	[240663] = "7:875:1898",		-- Kil'jaeden
	-- EmeraldNightmare
	[221046] = "7:768:1703",		-- Nythendra
	[221047] = "7:768:1738",		-- Il'gynoth, Heart of Corruption
	[221048] = "7:768:1744",		-- Elerethe Renferal
	[221049] = "7:768:1667",		-- Ursoc
	[221050] = "7:768:1704",		-- Dragons of Nightmare
	[221052] = "7:768:1750",		-- Cenarius
	[221053] = "7:768:1726",		-- Xavius
	-- TheNighthold
	[232436] = "7:786:1706",		-- Skorpyron
	[232437] = "7:786:1725",		-- Chronomatic Anomaly
	[232438] = "7:786:1731",		-- Trilliax
	[232439] = "7:786:1751",		-- Spellblade Aluriel
	[232440] = "7:786:1762",		-- Tichondrius
	[232441] = "7:786:1713",		-- Krosus
	[232442] = "7:786:1761",		-- High Botanist Tel'arn
	[232443] = "7:786:1732",		-- Star Augur Etraeus
	[232444] = "7:786:1743",		-- Grand Magistrix Elisande
	[232445] = "7:786:1737",		-- Gul'dan
	-- TrialOfValor
	[232466] = "7:861:1819",		-- Odyn
	[232467] = "7:861:1830",		-- Guarm
	[232468] = "7:861:1829",		-- Helya
	-- Antorus, the Burning Throne
	[250588] = "7:946:1992",		-- Garothi Worldbreaker
	[250598] = "7:946:1987",		-- Felhounds of Sargeras
	[250600] = "7:946:1997",		-- Antoran High Command
	[250601] = "7:946:1985",		-- Portal Keeper Hasabel
	[250602] = "7:946:2025",		-- Eonar the Life-Binder
	[250603] = "7:946:2009",		-- Imonar the Soulhunter
	[250604] = "7:946:2004",		-- Kin'garoth
	[250605] = "7:946:1983",		-- Varimathras
	[250606] = "7:946:1986",		-- The Coven of Shivarra
	[250607] = "7:946:1984",		-- Aggramar
	[250608] = "7:946:2031",		-- Argus the Unmaker
	-- Invasion Points
	[254441] = "7:959:2010",		-- Matron Folnuna
	[254437] = "7:959:2011",		-- Mistress Alluradel
	[254435] = "7:959:2012",		-- Inquisitor Meto
	[254443] = "7:959:2013",		-- Occularus
	[254446] = "7:959:2014",		-- Sotanathor
	[254439] = "7:959:2015",		-- Pit Lord Vilemus
	
	-- ### WoD
	-- BlackrockFoundry
	[177529] = "6:457:1161",		-- Gruul
	[177530] = "6:457:1202",		-- Oregorger
	[177536] = "6:457:1122",		-- Beastlord Darmac
	[177534] = "6:457:1123",		-- Flamebender Ka'graz
	[177533] = "6:457:1155",		-- Hans'gar & Franzok
	[177537] = "6:457:1147",		-- Operator Thogar
	[177531] = "6:457:1154",		-- Blast Furnace
	[177535] = "6:457:1162",		-- Kromog
	[177538] = "6:457:1203",		-- The Iron Maidens
	[177539] = "6:457:959",			-- Blackhand
	-- HellfireCitadel
	[188972] = "6:669:1426",		-- Mar'tak
	[188973] = "6:669:1425",		-- Iron Reaver
	[188974] = "6:669:1392",		-- Kormrok
	[188975] = "6:669:1432",		-- Council
	[188976] = "6:669:1396",		-- Kilrogg
	[188977] = "6:669:1372",		-- Gorefiend
	[188978] = "6:669:1433",		-- Iskar
	[188979] = "6:669:1427",		-- Socrethar
	[188980] = "6:669:1391",		-- Zakuum
	[188981] = "6:669:1447",		-- Xhulhorac
	[188982] = "6:669:1394",		-- Velhari
	[188983] = "6:669:1395",		-- Mannoroth
	[188984] = "6:669:1438",		-- Archimonde
	-- Highmaul
	[177521] = "6:477:1128",		-- Kargath Bladefist
	[177522] = "6:477:971",			-- Butcher
	[177523] = "6:477:1195",		-- Tectus
	[177524] = "6:477:1196",		-- Brackenspore
	[177525] = "6:477:1148",		-- Twin Ogron
	[177526] = "6:477:1153",		-- Ko'ragh
	[177528] = "6:477:1197",		-- Imperator Mar'gok
	-- Draenor
	--[[ no longer available
	[178847] = "6:557:1291",		-- Drov the Ruiner
	[178851] = "6:557:1262",		-- Rukhmar
	[178849] = "6:557:1211",		-- Tarlna the Ageless
	]]
	[188985] = "6:557:1452",		-- Supreme Lord Kazzak	
	
	-- ### MoP
	-- MoguShanVaults
	[125144] = "5:317:679",		-- The Stone Guard
	[132189] = "5:317:689",		-- Feng
	[132190] = "5:317:685",		-- Garajal
	[132191] = "5:317:687",		-- Spirit Kings
	[132192] = "5:317:726",		-- Elegon
	[132193] = "5:317:677",		-- Will of the Emperor
	-- HoF
	[132194] = "5:330:745",		-- Zorlok
	[132195] = "5:330:744",		-- Tayak
	[132196] = "5:330:713",		-- Garalon
	[132197] = "5:330:741",		-- Meljarak
	[132198] = "5:330:737",		-- Unsok
	[132199] = "5:330:743",		-- Shekzeer
	-- ToES
	[132200] = "5:320:683",		-- Protectors
	[132201] = "5:320:742",		-- Tsulong
	[132202] = "5:320:729",		-- LeiShi
	[132203] = "5:320:709",		-- ShaofFear
	-- ToT
	[139674] = "5:362:827",		-- Jinrokh
	[139677] = "5:362:819",		-- Horridon
	[139679] = "5:362:816",		-- Council
	[139680] = "5:362:825",		-- Tortos
	[139682] = "5:362:821",		-- Megaera
	[139684] = "5:362:828",		-- JiKun
	[139686] = "5:362:818",		-- Durumu
	[139687] = "5:362:820",		-- Primordius
	[139688] = "5:362:824",		-- Dark Animus
	[139689] = "5:362:817",		-- Iron Qon
	[139690] = "5:362:829",		-- Twin Consorts
	[139691] = "5:362:832",		-- Lei Shen
	[139692] = "5:362:831",		-- Raden
	-- SoO
	[145909] = "5:369:852",		-- Immerseus
	[145910] = "5:369:849",		-- Fallen Protectors
	[145911] = "5:369:866",		-- Norushen
	[145912] = "5:369:867",		-- Sha of Pride
	[145913] = "5:369:868",		-- Galakras
	[145914] = "5:369:864",		-- Iron Juggernaut
	[145915] = "5:369:856",		-- Dark Shaman
	[145916] = "5:369:850",		-- General Nazgrim
	[145917] = "5:369:846",		-- Malkorok
	[145918] = "5:369:865",		-- Siegecrafter Blackfuse
	[145919] = "5:369:870",		-- Spoils of Pandaria
	[145920] = "5:369:851",		-- Thok the Bloodthirsty
	[145921] = "5:369:853",		-- Klaxxi Paragons
	[145922] = "5:369:869",		-- Garrosh Hellscream
	-- Pandaria
	[132205] = "5:322:858",		-- Sha of Anger
	[132206] = "5:322:725",		-- Galleon
	[136381] = "5:322:814",		-- Nalak
	[137554] = "5:322:826",		-- Oondasta
	[148316] = "5:322:861",		-- Ordos
	[148317] = "5:322:857",		-- Celestials	( 857 - ChiJi, 858 - YuLon, 859 - NioZao, 859 - Xuen )
}

local function LoadQuickLootFrame(self)
	if AtlasLoot.db.Addons.BonusRoll.enabled and self.spellID and BONUS_ROLL_IDS[self.spellID] then
		local tierID, instanceID, encounterID = strsplit(":", BONUS_ROLL_IDS[self.spellID])
		QLF:SetEncounterJournalBonusRoll(tonumber(tierID), GetRaidDifficultyID() or 1, tonumber(instanceID), tonumber(encounterID))
	end
end

local function ClearQuickLootFrame(self)
	if AtlasLoot.db.Addons.BonusRoll.enabled and QLF.frame~=nil then
		QLF:Clear()
		QLF:Hide()
	end
end
BonusRollFrame:HookScript("OnShow", LoadQuickLootFrame)
BonusRollFrame:HookScript("OnHide", ClearQuickLootFrame)

function BonusRoll:Preview(id)
	LoadQuickLootFrame({spellID = id or 275409})
end
