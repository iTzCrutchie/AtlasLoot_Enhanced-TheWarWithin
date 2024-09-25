-- $Id: Core.lua 8 2022-11-20 08:02:32Z arithmandar $
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
local data = AtlasLoot.ItemDB:Add(addonname, 10)

--[[
local moduleMeta = {
		addonName = addonname,
		icon = "Interface\\ICONS\\inv_achievement_raidnerubian_queenansurek",
		name = EXPANSION_NAME11,
		tt_title = nil,		-- ToolTip title
		tt_text = nil,		-- ToolTip text
}--]]

AtlasLoot:RegisterModules(addonname)

private.data = data