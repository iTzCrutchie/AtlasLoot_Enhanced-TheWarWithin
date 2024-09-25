-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)

--[[
	format:
	{ name,	x,	y,	mapID,	
]]--

local ALName, ALPrivate = ...
local AtlasLoot = _G.AtlasLoot
local MapPOI = {}
AtlasLoot.MapPOI = MapPOI

-- lua
local string = _G.string
local format = string.format

-- WoW
local GetAreaMapInfo = _G.GetAreaMapInfo

-- local
local MAP_ID = {
	-- WoD
	DRAENOR = 1116,
	HORDE_GARRISON_1 = 1152,	-- FWHordeGarrisonLevel1
	HORDE_GARRISON_2 = 1153,	-- FWHordeGarrisonLevel2
	HORDE_GARRISON_3 = 1154,	-- FWHordeGarrisonLevel3
	ALLIANCE_GARRISON_1 = 1158,	-- SMVAllianceGarrisonLevel1
	ALLIANCE_GARRISON_2 = 1159,	-- SMVAllianceGarrisonLevel2
	ALLIANCE_GARRISON_3 = 1160,	-- SMVAllianceGarrisonLevel3
	PROVING_GROUNDS = 1148,
}
local MAP_DATA = {[0]="Azeroth",[1]="Kalimdor",[13]="test",[25]="ScottTest",[30]="PVPZone01",[33]="Shadowfang",[34]="StormwindJail",[35]="StormwindPrison",[36]="DeadminesInstance",[37]="PVPZone02",[42]="Collin",[43]="WailingCaverns",[44]="Monastery",[47]="RazorfenKraulInstance",[48]="Blackfathom",[70]="Uldaman",[90]="GnomeragonInstance",[109]="SunkenTemple",[129]="RazorfenDowns",[169]="EmeraldDream",[189]="MonasteryInstances",[209]="TanarisInstance",[229]="BlackRockSpire",[230]="BlackrockDepths",[249]="OnyxiaLairInstance",[269]="CavernsOfTime",[289]="SchoolofNecromancy",[309]="Zul'gurub",[329]="Stratholme",[349]="Mauradon",[369]="DeeprunTram",[389]="OrgrimmarInstance",[409]="MoltenCore",[429]="DireMaul",[449]="AlliancePVPBarracks",[450]="HordePVPBarracks",[451]="development",[469]="BlackwingLair",[489]="PVPZone03",[509]="AhnQiraj",[529]="PVPZone04",[530]="Expansion01",[531]="AhnQirajTemple",[532]="Karazahn",[533]="Stratholme Raid",[534]="HyjalPast",[540]="HellfireMilitary",[542]="HellfireDemon",[543]="HellfireRampart",[544]="HellfireRaid",[545]="CoilfangPumping",[546]="CoilfangMarsh",[547]="CoilfangDraenei",[548]="CoilfangRaid",[550]="TempestKeepRaid",[552]="TempestKeepArcane",[553]="TempestKeepAtrium",[554]="TempestKeepFactory",[555]="AuchindounShadow",[556]="AuchindounDemon",[557]="AuchindounEthereal",[558]="AuchindounDraenei",[559]="PVPZone05",[560]="HillsbradPast",[562]="bladesedgearena",[564]="BlackTemple",[565]="GruulsLair",[566]="NetherstormBG",[568]="ZulAman",[571]="Northrend",[572]="PVPLordaeron",[573]="ExteriorTest",[574]="Valgarde70",[575]="UtgardePinnacle",[576]="Nexus70",[578]="Nexus80",[580]="SunwellPlateau",[582]="Transport176244",[584]="Transport176231",[585]="Sunwell5ManFix",[586]="Transport181645",[587]="Transport177233",[588]="Transport176310",[589]="Transport175080",[590]="Transport176495",[591]="Transport164871",[592]="Transport186238",[593]="Transport20808",[594]="Transport187038",[595]="StratholmeCOT",[596]="Transport187263",[597]="CraigTest",[598]="Sunwell5Man",[599]="Ulduar70",[600]="DrakTheronKeep",[601]="Azjol_Uppercity",[602]="Ulduar80",[603]="UlduarRaid",[604]="GunDrak",[605]="development_nonweighted",[606]="QA_DVD",[607]="NorthrendBG",[608]="DalaranPrison",[609]="DeathKnightStart",[610]="Transport_Tirisfal _Vengeance_Landing",[612]="Transport_Menethil_Valgarde",[613]="Transport_Orgrimmar_Warsong_Hold",[614]="Transport_Stormwind_Valiance_Keep",[615]="ChamberOfAspectsBlack",[616]="NexusRaid",[617]="DalaranArena",[618]="OrgrimmarArena",[619]="Azjol_LowerCity",[620]="Transport_Moa'ki_Unu'pe",[621]="Transport_Moa'ki_Kamagua",[622]="Transport192241",[623]="Transport192242",[624]="WintergraspRaid",[627]="unused",[628]="IsleofConquest",[631]="IcecrownCitadel",[632]="IcecrownCitadel5Man",[637]="AbyssalMaw",[638]="Gilneas",[641]="Transport_AllianceAirshipBG",[642]="Transport_HordeAirshipBG",[643]="AbyssalMaw_Interior",[644]="Uldum",[645]="BlackRockSpire_4_0",[646]="Deephome",[647]="Transport_Orgrimmar_to_Thunderbluff",[648]="LostIsles",[649]="ArgentTournamentRaid",[650]="ArgentTournamentDungeon",[651]="ElevatorSpawnTest",[654]="Gilneas2",[655]="GilneasPhase1",[656]="GilneasPhase2",[657]="SkywallDungeon",[658]="QuarryofTears",[659]="LostIslesPhase1",[660]="Deephomeceiling",[661]="LostIslesPhase2",[662]="Transport197195",[668]="HallsOfReflection",[669]="BlackwingDescent",[670]="GrimBatolDungeon",[671]="GrimBatolRaid",[672]="Transport197347",[673]="Transport197348",[674]="Transport197349-2",[712]="Transport197349",[713]="Transport197350",[718]="Transport201834",[719]="MountHyjalPhase1",[720]="Firelands1",[721]="Firelands2",[723]="Stormwind",[724]="ChamberofAspectsRed",[725]="DeepholmeDungeon",[726]="CataclysmCTF",[727]="STV_Mine_BG",[728]="TheBattleforGilneas",[730]="MaelstromZone",[731]="DesolaceBomb",[732]="TolBarad",[734]="AhnQirajTerrace",[736]="TwilightHighlandsDragonmawPhase",[738]="Transport200100",[739]="Transport200101",[740]="Transport200102",[741]="Transport200103",[742]="Transport203729",[743]="Transport203730",[746]="UldumPhaseOasis",[747]="Transport 203732",[748]="Transport203858",[749]="Transport203859",[750]="Transport203860",[751]="RedgridgeOrcBomb",[752]="RedridgeBridgePhaseOne",[753]="RedridgeBridgePhaseTwo",[754]="SkywallRaid",[755]="UldumDungeon",[757]="BaradinHold",[759]="UldumPhasedEntrance",[760]="TwilightHighlandsPhasedEntrance",[761]="Gilneas_BG_2",[762]="Transport 203861",[763]="Transport 203862",[764]="UldumPhaseWreckedCamp",[765]="Transport203863",[766]="Transport 2033864",[767]="Transport 2033865",[859]="Zul_Gurub5Man",[860]="NewRaceStartZone",[861]="FirelandsDailies",[870]="HawaiiMainLand",[930]="ScenarioAlcazIsland",[938]="COTDragonblight",[939]="COTWarOfTheAncients",[940]="TheHourOfTwilight",[951]="NexusLegendary",[959]="ShadowpanHideout",[960]="EastTemple",[961]="StormstoutBrewery",[962]="TheGreatWall",[967]="DeathwingBack",[968]="EyeoftheStorm2.0",[971]="JadeForestAllianceHubPhase",[972]="JadeForestBattlefieldPhase",[974]="DarkmoonFaire",[975]="TurtleShipPhase01",[976]="TurtleShipPhase02",[977]="MaelstromDeathwingFight",[980]="TolVirArena",[994]="MoguDungeon",[995]="MoguInteriorRaid",[996]="MoguExteriorRaid",[998]="ValleyOfPower",[999]="BFTAllianceScenario",[1000]="BFTHordeScenario",[1001]="ScarletSanctuaryArmoryAndLibrary",[1004]="ScarletMonasteryCathedralGY",[1005]="BrewmasterScenario01",[1007]="NewScholomance",[1008]="MogushanPalace",[1009]="MantidRaid",[1010]="MistsCTF3",[1011]="MantidDungeon",[1014]="MonkAreaScenario",[1019]="RuinsOfTheramore",[1024]="PandaFishingVillageScenario",[1028]="MoguRuinsScenario",[1029]="AncientMoguCryptScenario",[1030]="AncientMoguCyptDestroyedScenario",[1031]="ProvingGroundsScenario",[1032]="PetBattleJadeForest",[1035]="ValleyOfPowerScenario",[1043]="RingOfValorScenario",[1048]="BrewmasterScenario03",[1049]="BlackOxTempleScenario",[1050]="ScenarioKlaxxiIsland",[1051]="ScenarioBrewmaster04",[1060]="LevelDesignLand-DevOnly",[1061]="HordeBeachDailyArea",[1062]="AllianceBeachDailyArea",[1064]="MoguIslandDailyArea",[1066]="StormwindGunshipPandariaStartArea",[1074]="OrgrimmarGunshipPandariaStart",[1075]="TheramoreScenarioPhase",[1076]="JadeForestHordeStartingArea",[1095]="HordeAmbushScenario",[1098]="ThunderIslandRaid",[1099]="NavalBattleScenario",[1101]="DefenseOfTheAleHouseBG",[1102]="HordeBaseBeachScenario",[1103]="AllianceBaseBeachScenario",[1104]="ALittlePatienceScenario",[1105]="GoldRushBG",[1106]="JainaDalaranScenario",[1107]="WarlockArea",[1112]="BlackTempleScenario",[1113]="DarkmoonCarousel",[1116]="Draenor",[1120]="ThunderKingHordeHub",[1121]="ThunderIslandAllianceHub",[1122]="CitySiegeMoguIslandProgressionScenario",[1123]="LightningForgeMoguIslandProgressionScenario",[1124]="ShipyardMoguIslandProgressionScenario",[1125]="AllianceHubMoguIslandProgressionScenario",[1126]="HordeHubMoguIslandProgressionScenario",[1127]="FinalGateMoguIslandProgressionScenario",[1128]="MoguIslandEventsHordeBase",[1129]="MoguIslandEventsAllianceBase",[1130]="ShimmerRidgeScenario",[1131]="DarkHordeScenario",[1132]="Transport218599",[1133]="Transport218600",[1134]="ShadoPanArena",[1135]="MoguIslandLootRoom",[1136]="OrgrimmarRaid",[1144]="HeartOfTheOldGodScenario",[1148]="ProvingGrounds",[1152]="FWHordeGarrisonLevel1",[1153]="FWHordeGarrisonLevel2",[1154]="FWHordeGarrisonLevel3",[1155]="Stormgarde Keep",[1157]="HalfhillScenario",[1158]="SMVAllianceGarrisonLevel1",[1159]="SMVAllianceGarrisonLevel2",[1160]="SMVAllianceGarrisonLevel3",[1161]="CelestialChallenge",[1166]="SmallBattlegroundA",[1168]="ThePurgeOfGrommarScenario",[1169]="SmallBattlegroundB",[1170]="SmallBattlegroundC",[1171]="SmallBattlegroundD",[1172]="Transport_Siege_of_Orgrimmar_Alliance",[1173]="Transport_Siege_of_Orgrimmar_Horde",[1175]="OgreCompound",[1176]="MoonCultistHideout",[1179]="WarcraftHeroes",[1181]="PattyMackTestGarrisonBldgMap",[1182]="DraenorAuchindoun",[1187]="GORAllianceGarrisonLevel1",[1188]="GORAllianceGarrisonLevel2",[1189]="GORAllianceGarrisonLevel3",[1190]="BlastedLands",[1191]="Ashran",[1192]="Transport_Iron_Horde_Gorgrond_Train",[1195]="WarWharfSmackdown",[1200]="BonetownScenario",[1203]="FrostfireFinaleScenario",[1205]="BlackrockFoundryRaid",[1207]="TaladorIronHordeFinaleScenario",[1208]="BlackrockFoundryTrainDepot",[1209]="ArakkoaDungeon",[1212]="6HU_GARRISON_Blacksmithing_hub",[1213]="alliance_garrison_alchemy",[1214]="alliance_garrison_enchanting",[1215]="garrison_alliance_engineering",[1216]="garrison_alliance_farmhouse",[1217]="garrison_alliance_inscription",[1218]="garrison_alliance_jewelcrafting",[1219]="garrison_alliance_leatherworking",[1220]="Troll Raid",[1221]="garrison_alliance_mine_1",[1222]="garrison_alliance_mine_2",[1223]="garrison_alliance_mine_3",[1224]="garrison_alliance_stable_1",[1225]="garrison_alliance_stable_2",[1226]="garrison_alliance_stable_3",[1227]="garrison_alliance_tailoring",[1228]="HighmaulOgreRaid",[1229]="garrison_alliance_inn_1",[1230]="garrison_alliance_barn",[1231]="Transport227523",[1232]="GorHordeGarrisonLevel0",[1233]="GORHordeGarrisonLevel3",[1234]="TALAllianceGarrisonLevel0",[1235]="TALAllianceGarrisonLevel3",[1236]="TALHordeGarrisonLevel0",[1237]="TALHordeGarrisonLevel3",[1238]="SOAAllianceGarrison0",[1239]="SOAAllianceGarrison3",[1240]="SOAHordeGarrison0",[1241]="SOAHordeGarrison3",[1242]="NAGAllianceGarrisonLevel0",[1243]="NAGAllianceGarrisonLevel3",[1244]="NAGHordeGarrisonLevel0",[1245]="NAGHordeGarrisonLevel3",[1247]="garrison_alliance_armory1",[1248]="garrison_alliance_barracks1",[1249]="garrison_alliance_engineering1",[1250]="alliance_garrison_herb_garden1",[1251]="alliance_garrison_inn1",[1252]="garrison_alliance_lumbermill1",[1253]="alliance_garrison_magetower1",[1254]="garrison_alliance_pet_stable1",[1255]="garrison_alliance_salvageyard1",[1256]="garrison_alliance_storehouse1",[1257]="garrison_alliance_trading_post1",[1258]="garrison_alliance_tailoring1",[1259]="garrison_alliance_enchanting",[1260]="garrison_alliance_blacksmith1",[1261]="garrison_alliance_plot_small",[1262]="garrison_alliance_plot_medium",[1263]="garrison_alliance_plot_large",[1264]="Propland-DevOnly",[1265]="TanaanJungleIntro",[1266]="CircleofBloodScenario",[1268]="TerongorsConfrontation",[1270]="devland3",[1273]="nagrand_garrison_camp_stable_2",[1277]="DefenseOfKaraborScenario",[1278]="garrison_horde_barracks1",[1279]="ShaperDungeon",[1280]="TrollRaid2",[1281]="garrison_horde_alchemy1",[1282]="garrison_horde_armory1",[1283]="garrison_horde_barn1",[1284]="garrison_horde_blacksmith1",[1285]="garrison_horde_enchanting1",[1286]="garrison_horde_engineering1",[1287]="garrison_horde_inn1",[1288]="garrison_horde_inscription1",[1289]="garrison_horde_jewelcrafting1",[1290]="garrison_horde_leatherworking1",[1291]="garrison_horde_lumbermill1",[1292]="garrison_horde_magetower1",[1293]="garrison_horde_mine1",[1294]="garrison_alliance_petstabe",[1295]="garrison_horde_salvageyard1",[1296]="garrison_horde_sparringarena1",[1297]="garrison_horde_stable1",[1298]="garrison_horde_storehouse1",[1299]="garrison_horde_tailoring1",[1300]="garrison_horde_tradingpost1",[1301]="garrison_horde_workshop1",[1302]="garrison_alliance_workshop1",[1303]="garrison_horde_farm1",[1304]="garrison_horde_plot_large",[1305]="garrison_horde_plot_medium",[1306]="garrison_horde_plot_small",[1307]="TanaanJungleIntroForgePhase",[1308]="garrison_horde_fishing1",[1309]="garrison_alliance_fishing1",[1310]="Expansion5QAModelMap",[1311]="outdoorGarrisonArenaHorde",[1312]="outdoorGarrisonArenaAlliance",[1313]="outdoorGarrisonLumberMillAlliance",[1314]="outdoorGarrisonLumberMillHorde",[1315]="outdoorGarrisonArmoryHorde",[1316]="outdoorGarrisonArmoryAlliance",[1317]="outdoorGarrisonMageTowerHorde",[1318]="outdoorGarrisonMageTowerAlliance",[1319]="outdoorGarrisonStablesHorde",[1320]="outdoorGarrisonStablesAlliance",[1321]="outdoorGarrisonWorkshopHorde",[1322]="outdoorGarrisonWorkshopAlliance",[1323]="outdoorGarrisonInnHorde",[1324]="outdoorGarrisonInnAlliance",[1325]="outdoorGarrisonTradingPostHorde",[1326]="outdoorGarrisonTradingPostAlliance",[1327]="outdoorGarrisonConstructionPlotHorde",[1328]="outdoorGarrisonConstructionPlotAlliance",[1329]="GrommasharScenario",[1330]="FWHordeGarrisonLeve2new",[1331]="SMVAllianceGarrisonLevel2new",[1332]="garrison_horde_barracks2",[1333]="garrison_horde_armory2",[1334]="garrison_horde_barn2",[1335]="garrison_horde_inn2",[1336]="garrison_horde_lumbermill2",[1337]="garrison_horde_magetower2",[1338]="garrison_horde_petstable2",[1339]="garrison_horde_stable2",[1340]="garrison_horde_tradingpost2",[1341]="garrison_horde_workshop2",[1342]="garrison_horde_barracks3",[1343]="garrison_horde_armory3",[1344]="garrison_horde_barn3",[1345]="garrison_horde_inn3",[1346]="garrison_horde_magetower3",[1347]="garrison_horde_petstable3",[1348]="garrison_horde_stable3",[1349]="garrison_horde_tradingpost3",[1350]="garrison_horde_workshop3",[1351]="Garrison_Alliance_Large_Construction",[1352]="Garrison_Alliance_Medium_Construction",[1353]="Garrison_Horde_Large_Construction",[1354]="Garrison_Horde_Medium_Construction",[1358]="UpperBlackRockSpire",[1361]="garrisonAllianceMageTower2",[1362]="garrisonAllianceMageTower3",[1363]="garrison_horde_mine2",[1364]="garrison_horde_mine3",[1367]="garrison_alliance_workshop2",[1368]="garrison_alliance_workshop3",[1369]="garrison_alliance_lumbermill2",[1370]="garrison_alliance_lumbermill3",[1371]="Garrison_Horde_Small_Construction",[1372]="Garrison_Alliance_Small_Construction",[1374]="AuchindounQuest",[1375]="alliance_garrison_alchemy_rank2",[1376]="alliance_garrison_alchemy_rank3",[1377]="garrison_alliance_blacksmith2",[1378]="garrison_alliance_enchanting2",[1379]="garrison_alliance_engineering2",[1380]="garrison_alliance_inscription2",[1381]="garrison_alliance_inscription3",[1382]="garrison_alliance_jewelcrafting2",[1383]="garrison_alliance_jewelcrafting3",[1384]="garrison_alliance_leatherworking2",[1385]="garrison_alliance_leatherworking3",[1386]="garrison_alliance_tailoring2",[1387]="garrison_alliance_storehouse2",[1388]="garrison_alliance_storehouse3",[1389]="garrison_horde_storehouse2",[1390]="garrison_horde_storehouse3",[1391]="garrison_alliance_salvageyard2",[1392]="garrison_alliance_salvageyard3",[1393]="garrison_horde_lumbermill3",[1394]="garrison_alliance_pet_stable2",[1395]="garrison_alliance_pet_stable3",[1396]="garrison_alliance_trading_post2",[1397]="garrison_alliance_trading_post3",[1398]="garrison_alliance_barn2",[1399]="garrison_alliance_barn3",[1400]="garrison_alliance_inn_2",[1401]="garrison_alliance_inn_3",[1402]="GorgrondFinaleScenario",[1403]="garrison_alliance_barracks2",[1404]="garrison_alliance_barracks3",[1405]="garrison_alliance_armory2",[1406]="garrison_alliance_armory3",[1407]="GorgrondFinaleScenarioMap",[1409]="garrison_horde_sparringarena2",[1410]="garrison_horde_sparringarena3",[1411]="garrison_horde_alchemy2",[1412]="garrison_horde_alchemy3",[1413]="garrison_horde_blacksmith2",[1414]="garrison_horde_blacksmith3",[1415]="garrison_horde_enchanting2",[1416]="garrison_horde_enchanting3",[1417]="garrison_horde_inscription2",[1418]="garrison_horde_inscription3",[1419]="garrison_horde_leatherworking2",[1420]="garrison_horde_leatherworking3",[1421]="garrison_horde_jewelcrafting2",[1422]="garrison_horde_jewelcrafting3",[1423]="garrison_horde_tailoring2",[1424]="garrison_horde_tailoring3",[1425]="garrison_horde_salvageyard2",[1426]="garrison_horde_salvageyard3",[1427]="PattyMackTestGarrisonBldgMap2",[1429]="garrison_horde_engineering2",[1430]="garrison_horde_engineering3",[1431]="SparringArenaLevel3Stadium",[1432]="garrison_horde_fishing2",[1433]="garrison_horde_fishing3",[1434]="garrison_alliance_fishing2",[1435]="garrison_alliance_fishing3",[1437]="garrison_alliance_petstable1",[1438]="garrison_alliance_petstable2",[1439]="garrison_alliance_petstable3",[1440]="garrison_alliance_infirmary1",[1441]="garrison_alliance_infirmary2",[1442]="garrison_alliance_infirmary3",[1446]="outdoorGarrisonConstructionPlotAllianceLarge",[1447]="outdoorGarrisonConstructionPlotHordeLarge",[1448]="HellfireRaid62",[1451]="TanaanLegionTest",[1453]="ScourgeofNorthshire",[1454]="ArtifactAshbringerOrigin",[1455]="EdgeofRealityMount",[1456]="NagaDungeon",[1457]="FXlDesignLand-DevOnly",[1458]="7_DungeonExteriorNeltharionsLair",[1459]="Transport_The_Iron_Mountain",[1460]="BrokenShoreScenario",[1461]="AzsunaScenario",[1462]="IllidansRock",[1463]="HelhiemExteriorArea",[1464]="TanaanJungle",[1465]="TanaanJungleNoHubsPhase",[1466]="Emerald_Nightmare_ValSharah_exterior",[1468]="WardenPrison",[1469]="MaelstromShaman",[1470]="Legion Dungeon",[1471]="1466",[1473]="GarrisonAllianceShipyard",[1474]="GarrisonHordeShipyard",[1475]="TheMawofNashal",[1476]="Transport_The_Maw_of_Nashal",[1477]="Valhallas",[1478]="ValSharahTempleofEluneScenario",[1479]="WarriorArtifactArea",[1480]="DeathKnightArtifactArea",[1481]="legionnexus",[1482]="GarrisonShipyardAllianceSubmarine",[1483]="GarrisonShipyardAllianceDestroyer",[1484]="GarrisonShipyardTransport",[1485]="GarrisonShipyardDreadnaught",[1486]="GarrisonShipyardCarrier",[1487]="GarrisonShipyardHordeSubmarine",[1488]="GarrisonShipyardHordeDestroyer",[1489]="Artifact-PortalWorldAcqusition",[1492]="Helheim",[1493]="WardenPrisonDungeon",[1494]="AcquisitionVioletHold",[1495]="AcquisitionWarriorProt",[1496]="GarrisonShipyardCarrierAlliance",[1497]="GarrisonShipyardGalleonHorde",[1498]="AcquisitionHavoc",[1499]="Artifact-Warrior Fury Acquisition",[1500]="ArtifactPaladinRetAcquisition",[1501]="BlackRookHoldDungeon",[1502]="DalaranUnderbelly",[1503]="ArtifactShamanElementalAcquisition",[1504]="BlackrookHoldArena",[1505]="NagrandArena2",[1509]="BloodtotemCavernFelPhase",[1510]="BloodtotemCavernTaurenPhase",[1511]="Artifact-WarriorFuryAcquisition",[1512]="Artifact-PriestHunterOrderHall",[1513]="Artifact-MageOrderHall",[1514]="Artifact-MonkOrderHall",[1515]="HulnHighmountain",[1516]="SuramarCatacombsDungeon",[1517]="StormheimPrescenarioWindrunner",[1518]="StormheimPrescenarioSkyfire",[1519]="ArtifactsDemonHunterOrderHall",[1520]="NightmareRaid",[1522]="ArtifactWarlockOrderHallScenario",[1523]="MardumScenario",[1526]="Artifact-WhiteTigerTempleAcquisition",[1527]="HighMountain",[1528]="Artifact-SkywallAcquisition",[1529]="KarazhanScenario",[1530]="SuramarRaid",[1532]="HighMountainMesa",[1533]="Artifact-KarazhanAcquisition",[1534]="Artifact-DefenseofMoongladeScenario",[1535]="DefenseofMoongladeScenario",[1536]="UrsocsLairScenario",[1537]="BoostExperience",[1538]="Karazhan Scenario",[1539]="Artifact-AcquisitionArmsHolyShadow",[1540]="Artifact-Dreamway",[1541]="Artifact-TerraceofEndlessSpringAcquisition",[1544]="LegionVioletHoldDungeon",[1545]="Artifact-Acquisition-CombatResto",[1547]="Artifacts-CombatAcquisitionShip",[1549]="TechTestSeamlessWorldTransitionA",[1550]="TechTestSeamlessWorldTransitionB",[1552]="ValsharahArena",[1553]="Artifact-Acquisition-Underlight",[1554]="BoostExperience2",[1555]="TransportBoostExperienceAllianceGunship",[1556]="TransportBoostExperienceHordeGunship",[1557]="BoostExperience2Horde",[1559]="TransportBoostExperienceHordeGunship2",[1560]="TransportBoostExperienceAllianceGunship2",[1561]="TechTestCosmeticParentPerformance",[1571]="SuramarCityDungeon",[1572]="MaelstromShamanHubIntroScenario",[1579]="UdluarScenario",[1580]="MaelstromTitanScenario",[1582]="Artifact�DalaranVaultAcquisition",[1583]="Artifact-DalaranVaultAcquisition",[1584]="JulienTestLand-DevOnly",[1586]="AssualtOnStormwind",[1588]="DevMapA",[1589]="DevMapB",[1590]="DevMapC",[1591]="DevMapD",[1592]="DevMapE",[1593]="DevMapF",[1594]="DevMapG",[1599]="ArtifactRestoAcqusition",[1600]="ArtifactThroneoftheTides",[1602]="SkywallDungeon_OrderHall",[1603]="AbyssalMaw_Interior_Scenario",[1604]="Artifact-PortalWorldNaskora",[1605]="FirelandsArtifact",[1607]="ArtifactAcquisitionSubtlety",[1608]="Hyjal Instance",[1609]="AcquisitionTempleofstorms",[1610]="Artifact-SerenityLegionScenario",[1611]="DeathKnightCampaign-LightsHopeChapel",[1612]="TheRuinsofFalanaar",[1616]="Faronaar",[1617]="DeathKnightCampaign-Undercity",[1618]="DeathKnightCampaign-ScarletMonastery",[1620]="ArtifactStormwind",[1621]="BlackTemple-Legion",[1622]="IllidanTemp",[1623]="MageCampaign-TheOculus",[1624]="BattleofExodar",[1625]="TrialoftheSerpent",[1626]="TheCollapseSuramarScenario",[1627]="FelHammerDHScenario",[1628]="Transport251513",[1629]="NetherlightTemplePrison",[1630]="TolBarad1",[1632]="TheArcwaySuramarScenario",[1637]="TransportAllianceShipPhaseableMO",[1638]="TransportHordeShipPhaseableMO",[1639]="TransportKvaldirShipPhaseableMO",[1642]="Zandalar",[1643]="KulTiras",[1644]="PlunderIsle",[1645]="Islands",[1646]="BlackRookSenario",[1647]="VoljinsFuneralPyre",[1648]="Helhiem2",[1649]="Transport254124",[1650]="Acherus",[1651]="Karazahn1",[1653]="LightsHeart",[1655]="8DevLand",[1657]="BladesEdgeArena2",[1658]="EnvironmentLandDevOnly",[1661]="Gnoll Revolution",[1662]="SuramarEndScenario",[1663]="DungeonBlockout",[1666]="BrokenShoreIntro",[1667]="LegionShipVertical",[1668]="LegionShipHorizontal",[1669]="Argus 1",[1670]="BrokenshorePristine",[1671]="BrokenShorePrepatch",[1672]="bladesedgearena2b",[1673]="EyeofEternityScenario",[1675]="WinterAB",[1676]="TombofSargerasRaid",[1677]="TombofSargerasDeungeon",[1678]="ABPhase1",[1679]="ABPhase2",[1680]="ABPhase3",[1681]="ABWinter",[1682]="ArtifactsDemonHunterOrderHallPhase",[1683]="ArtifactGnomeregan",[1684]="dreadscarriftwarlockplatform",[1685]="AITestMap8",[1686]="AITestMap8b",[1687]="WailingCavernsPetBattle",[1688]="DeadminesPetBattle",[1689]="EyeofEternityMageClassMount",[1690]="SnakeCave",[1691]="CookingImpossible",[1692]="PitofSaronDeathKnight",[1693]="MardumScenarioClientScene",[1694]="GnomereganPetBattle",[1695]="BrokenShoreBattleshipFinale",[1696]="LegionCommandCenter",[1697]="LegionSpiderCave",[1698]="ArtifactAcquisitionTank",[1699]="LegionFelCave",[1700]="LegionFelFirenovaArea",[1701]="LegionBarracks",[1702]="ArtifactHighmountainDualBoss",[1703]="HallsofValorScenario",[1704]="LegionShipHorizontalValsharah",[1705]="LegionShipHorizontalAzsuna",[1706]="LegionShipHorizontalHighMountain",[1707]="LegionShipHorizontalStormheim",[1708]="StratholmePaladinClassMount",[1710]="BlackRookHoldArtifactChallenge",[1711]="SouthseaPirateShip715BoatHoliday",[1712]="ArgusRaid",[1714]="HallsOfValorWarriorClassMount",[1715]="BlackrockMountainBrawl",[1716]="brokenshorewardentower",[1717]="AnimPlayground",[1718]="Nazjatar",[1719]="warlockmountscenario",[1723]="ColdridgeValley",[1726]="RaceTrackBG",[1728]="HallsofValorHunterScenario",[1729]="EyeofEternityMageClassMountShort",[1730]="ShrineofAvianaDefenseScenario",[1731]="DruidMountFinaleScenario",[1732]="FelwingLedgeDemonHunterClassMount",[1733]="AzerothsWarningScenario",[1734]="ThroneoftheFourWindsShamanClassMounts",[1735]="DKMountScenario",[1736]="RubySanctumDKMountScenario",[1737]="AkazamarakHatScenario",[1738]="LostGlacierDKMountScenario",[1739]="AITestMapABDebug",[1740]="AITestMapWSGDebug",[1741]="ExodarDalaran",[1744]="MogWeek",[1746]="ArcatrazScenario",[1747]="animationplayground",[1749]="WarfrontBarrens",[1750]="Azuremyst Isle (7.3 Intro)",[1751]="AllianceBattleship73Intro",[1752]="SunstriderShip73Intro",[1753]="ArgusDungeon",[1754]="PirateTownDungeon",[1756]="ChromieScenario",[1759]="Transport_WarfrontBarrensGunship",[1760]="LordaeronScenario",[1762]="CityofGoldInteriorDungeon",[1763]="CityofGoldExteriorDungeon",[1764]="EndlessHallsScenario",[1765]="WarfrontsPrototype",[1771]="KulTirasPrison",[1773]="VoildElf",[1774]="LightforgedDraenei",[1775]="HighmountainMaw",[1776]="OrgrimmarEmbassy",[1778]="ArgusRifts",[1779]="Argus_Rifts",[1780]="Islands8",[1782]="SilithusBG",[1784]="PA_SMALL_CAVE01_Pristine_A",[1785]="Islands_Pirateship_Plank",[1786]="Islands_Transport_Horde_Zeppelin",[1787]="Islands_PA_Mogu_Crypt_07",[1788]="Islands_6AS_Cave_01",[1789]="Islands_Saurok_Cave_Large",[1795]="ShwayderLand",[1802]="AzeriteBG",[1803]="AzeriteBG1",[1804]="WarfrontsPrototype3",[1805]="Islands_7HU_Transport_Alliance_Battleship01",[1806]="StormwindEmbassy",[1807]="Islands_6OR_Horde_Ship01",[1809]="MechagnomeIsland",[1811]="QuestTraining",[1812]="SuramarNightborneUnlock",[1813]="Islands801",[1814]="Islands802",[1815]="Silithus",[1817]="SilithusPhase01",[1818]="SilvermoonCity",[1822]="BoralusDungeon",[1825]="KulTirasArena",[1839]="KarazanChess",[1840]="SunwellUnlockScenario",[1841]="UnderrotDungeon",[1844]="Islands_7FK_Forsaken_Ship03",[1845]="Islands_7VR_Vrykul_Ship01",[1846]="Islands_6HU_Transport_Cargoship",[1847]="Dev Map  G",[1849]="Islands_ND_ICEBREAKER_SHIP_BG_TRANSPORT",[1850]="Islands_6HU_Transport_Buccaneer",[1851]="Islands_7FK_Transport_Buccaneer",[1852]="Islands_Horde_Submarine",[1853]="Islands_Alliance_Submarine",[1854]="Islands_7VS_Cavemicro03",[1855]="LightforgedVindicaar",[1856]="TransportAzeriteBGAllianceAirship",[1857]="TransportAzeriteBGHordeGunship",[1860]="LightforgedDraeneiVindicaar",[1861]="NazmirRaid",[1862]="DrustvarDungeon",[1863]="BLTestMap",[1864]="SeaPriestDungeon",[1865]="VoidElfHub",[1876]="WarfrontsArathi",[1877]="SnakeDungeon",[1878]="BlackrockDepthsDarkIron",[1879]="rymoore",[1880]="TitanIsland",[1881]="Islands9",[1882]="Islands10",[1883]="Islands01",[1884]="SiegeOfOrgrimmarZone",[1885]="Islands803",[1886]="Islands_7VR_Swamp_Prototype",[1887]="Islands_7VR_Swamp_Prototype2",[1888]="Islands888",[1889]="Islands666",[1890]="AssassinsScenarioDRU",[1891]="Islands805",[1892]="Islands11",[1893]="NecromancyIsland",[1895]="Islands1106",[1896]="Islands420",[1897]="Islands24",[1898]="Islands22",[1899]="Islands23",[1900]="Silithus_Airship_Alliance",[1901]="Silithus_Airship_Horde",[1902]="SilithusAllianceGunship",[1903]="SilithusHordeGunship",[1904]="escapefromstockades",[1906]="zandalarcontinentfinale",[1907]="Islands_Panderan_Farm",[1909]="TransportKulTirasBridgeportShip",[1910]="TransportKulTirasBridgeportMaidens",[1911]="ZandalariArena",[1912]="Islands_7az_cave02",[1913]="PhaseableMONazmirTriangulationPlatform",[1916]="PhaseableMONazmirShipWorldQuest",[1917]="GorgrondOrcs",[1918]="Kalimdor 2",[1919]="Islands_KL_Skywall_Entrance_Building_03",[1920]="Islands_MD_Flamegate_E",[1921]="Islands_8HU_Kultiras_ShipMedium01",[1922]="Islands_8TR_Zandalari_ShipMediumTransport01",[1923]="Islands_Deepholm_Mercury_Pool01",[1924]="Islands_7AZ_Vashjir_Small_Cave_A",[1925]="DevMapH",[1926]="KulTiranFlagship",[1927]="ZandalariFlagship",[1929]="HallOfCommunion(Destroyed)",[1930]="ZandalarAllianceIntroScenerio",[1931]="LordaeronBlight",[1932]="BlackrockDepthsDarkIron2",[1934]="Islands_8KUL_CaveMicro_freehold01",[1935]="Islands_8KUL_CaveMicro01",[1936]="Islands_8KUL_CaveMicro02",[1937]="Islands_8KUL_CaveMicro03",[1938]="Islands_8RIV_CaveMicro_01",[1939]="Islands_8RIV_CaveMicro_02",[1940]="StormwindEmbassyVoldunStatic",[1941]="TransportNazmirRaidElevator",[1942]="MoltenCoreDarkIron",[1943]="WarfrontsArathi - Alliance",[1944]="ScenarioThrosDeathRealm",[1945]="ArathiHighlands2",[1946]="ProtoShips",[1947]="TransportProtoAllianceShip",[1948]="TransportProtoHordeShip",[1949]="8BoostExperienceAlliance",[1950]="8BoostExperienceHorde",[1951]="8TransportBoostExperienceAllianceGunship",[1952]="8TransportBoostExperienceHordeGunship",[1953]="Islands_demigod_dome_living",[1954]="GreatSea",[1955]="ScenarioIslandsTutorial",[1956]="Islands_Hot_OldGod_03",[1957]="Islands_OldGod",[1958]="ZandalariTransportShip",[1959]="ZandalariTransportShipLarge",[1962]="GoblinShipFinal",[1963]="DevMapI",[1964]="WarCampaignHordeCh05Flagship",[1965]="WarCampaignHordeCh05Ship",[2066]="GreatSeaHorde",[2067]="GralsCall",[2068]="TirisfalGladesPhase01",[2069]="zuldazaralliancebombingrun",[2074]="8TransportBoralusStormwind",[2075]="Islands_7DU_Helheim_Ghostship",[2076]="FirelandsDarkIron",[2077]="Islands_ULDUM_INTERIOR_PYRAMID",[2078]="Islands_ULDUM_LARGE_PYRAMID_01",[2081]="BlackrockDepthsDarkIronHub",[2082]="Islands_PA_Mogu_Crypt_01",[2083]="Islands_PA_Mogu_Crypt_02",[2084]="Islands_PA_Mogu_Crypt_03",[2085]="Islands_PA_Mogu_Crypt_04",[2086]="Islands_PA_Mogu_Crypt_05",[2087]="Islands_PA_Mogu_Crypt_06",[2088]="Islands_PA_Mogu_Crypt_08",[2094]="8TransportBoralusCanals",[2095]="8TransportBoralusSound",[2101]="8TransportBoralusBarge",[2102]="8TransportBoralusShipSmall",[2103]="DarkshorePrepatchDarnassianShipCosmetic"}

function MapPOI:Create()

end

function MapPOI:GetMinimapData(mapId, mapWidth, mapHeight, centerPointX, centerPointY)
	--[[
		X1Y1-----
		|		 |
		|		 |
		|		 |
		 -----X2Y2
	]]--
	local mapDataId, _, _, X1, X2, Y1, Y2 = GetAreaMapInfo(mapId)
	
	if not mapDataId or not MAP_DATA[mapDataId] or not X1 or X1 == 0 then return end
	
	-- area width/height
	local areaWidth = abs(X2-X1)
	local areaHeight = abs(Y2-Y1)
	
	-- single tile size
	local tileSize = mapWidth / areaWidth * MINIMAP_TILE_YARD_SIZE
	local tileSizeY = mapHeight / areaHeight * MINIMAP_TILE_YARD_SIZE
	
	-- num and pos of tiles in the grid
	local numTileX, posTileX = modf(MINIMAP_GRID_SIZE - X1 / MINIMAP_TILE_YARD_SIZE)					
	local numTileY, posTileY = modf(MINIMAP_GRID_SIZE - Y1 / MINIMAP_TILE_YARD_SIZE)
	
	-- offsets
	local tileOffsetX = (X1 - ((numTileX - MINIMAP_GRID_SIZE) * -MINIMAP_TILE_YARD_SIZE)) / areaWidth
	local tileOffsetY = (Y1 - ((numTileY - MINIMAP_GRID_SIZE) * -MINIMAP_TILE_YARD_SIZE)) / areaHeight
	
	-- number of tiles X and Y
	local numTilesX = ceil((areaWidth + posTileX * MINIMAP_TILE_YARD_SIZE) / MINIMAP_TILE_YARD_SIZE)
	local numTilesY = ceil((areaHeight + posTileY * MINIMAP_TILE_YARD_SIZE) / MINIMAP_TILE_YARD_SIZE)
	
	-- return table
	local data = {
		tileSize = tileSize,
		numTilesX = numTilesX,
		numTilesY = numTilesY,
		numTimes = numTilesX * numTilesY,
		files = {},
	}
	
	-- the data for all files
	local textureWidth, textureHeight, point, texLeft, texRight, texTop, texBottom
	for y=1,numTilesY do
		for x=1,numTilesX do
		
			textureWidth, textureHeight = tileSize, tileSize
			texLeft, texRight, texTop, texBottom = 0, 1, 0, 1
		
			-- ####
			-- tex
			-- ####
			
			-- 1 tile
			if numTilesX == 1 and numTilesY == 1 then
				textureWidth = mapWidth
				textureHeight = mapHeight
				texLeft = posTileX
				texTop = posTileY
				texRight = (mapWidth + posTileX * tileSize) / tileSize
				texBottom = (mapHeight + posTileY * tileSize) / tileSize
			-- 1 tile width
			elseif numTilesX == 1 then
				textureWidth = mapWidth
				texLeft = posTileX
				texRight = (mapWidth + posTileX * tileSize) / tileSize
			-- 1 tile height
			elseif numTilesY == 1 then
				textureHeight = mapHeight
				texTop = posTileY
				texBottom = (mapHeight + posTileY * tileSize) / tileSize
			-- TOPLEFT
			elseif y == 1 and x == 1 then
				textureWidth = tileSize - posTileX*tileSize
				textureHeight = tileSize - posTileY*tileSize
				texLeft = posTileX
				texTop = posTileY
			-- TOPRIGHT
			elseif y == 1 and x == numTilesX then
				textureWidth = mapWidth - (tileOffsetX*mapWidth+tileSize*(x-1))
				textureHeight = tileSize - posTileY*tileSize
				texTop = posTileY
				texRight = textureWidth/tileSize
			-- BOTTOMLEFT
			elseif y == numTilesY and x == 1 then
				textureWidth = tileSize - posTileX*tileSize
				textureHeight = (-tileOffsetY*mapHeight-tileSize*(y-1)) + mapHeight
				texLeft = posTileX
				texBottom = textureHeight/tileSize
			-- BOTTOMRIGHT
			elseif y == numTilesY and x == numTilesX then
				textureWidth = mapWidth - (tileOffsetX*mapWidth+tileSize*(x-1))
				textureHeight = (-tileOffsetY*mapHeight-tileSize*(y-1)) + mapHeight
				texRight = textureWidth/tileSize
				texBottom = textureHeight/tileSize
			-- TOP
			elseif y == 1 then
				textureHeight = tileSize - posTileY*tileSize
				texTop = posTileY
			-- BOTTOM
			elseif y == numTilesY then
				textureHeight = (-tileOffsetY*mapHeight-tileSize*(y-1)) + mapHeight
				texBottom = textureHeight/tileSize
			-- LEFT
			elseif x == 1 then 
				textureWidth = tileSize - posTileX*tileSize
				texLeft = posTileX
			-- RIGHT
			elseif x == numTilesX then
				textureWidth = mapWidth - (tileOffsetX*mapWidth+tileSize*(x-1))
				texRight = textureWidth/tileSize
			end
			
			data.files[#data.files+1] = {
				width = textureWidth,
				height = textureHeight,
				path = format(MapData.MiniMapPath, MAP_DATA[mapDataId], numTileX+(x-1), numTileY+(y-1)),
				tex = {texLeft, texRight, texTop, texBottom},
			}
		end
	end
	
	return data
end

-- ###########################
-- GUI
-- ###########################
function MapPOI:GUI_Get()
	if not self.frame then
	
	end
	return self.frame
end
