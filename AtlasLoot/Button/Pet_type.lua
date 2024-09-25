-- Functions
local _G = getfenv(0)

-- Libraries
--lua
local type = type
local tonumber = tonumber
local str_match = string.match

-- blizzard
local IsAddOnLoaded, LoadAddOn = C_AddOns.IsAddOnLoaded, C_AddOns.LoadAddOn 
local ShowUIPanel = _G.ShowUIPanel
local C_PetJournal = _G.C_PetJournal
local C_PetJournal_GetPetInfoBySpeciesID = C_PetJournal.GetPetInfoBySpeciesID

local AtlasLoot = _G.AtlasLoot
local Pet = AtlasLoot.Button:AddType("Pet", "pet")
local Item = AtlasLoot.Button:GetType("Item")
local AL = AtlasLoot.Locales

local PET_COLOR = "|cffffff00"
local PET_JOURNAL_TEXTURE = "Interface\\PetBattles\\PetJournal"

local PetClickHandler = nil

function Pet.OnSet(button, second)
	if not PetClickHandler then
		PetClickHandler = AtlasLoot.ClickHandler:Add(
		"Pet",
		{
			GoTo = { "LeftButton", "None" },
			types = {
				GoTo = true,
			},
		},
		AtlasLoot.db.Button.Pet.ClickHandler, 
		{
			{ "GoTo",		AL["Show Pet in Journal"],			AL["Show Pet in Journal"] },
		})
	end
	if not button then return end
	if second and button.__atlaslootinfo.secType then
		if type(button.__atlaslootinfo.secType[2]) == "table" then
			button.secButton.PetID = button.__atlaslootinfo.secType[2][1]
			button.secButton.ItemID = button.__atlaslootinfo.secType[2][2]
		else
			button.secButton.PetID = button.__atlaslootinfo.secType[2]
		end
		Pet.Refresh(button.secButton)
	else
		if type(button.__atlaslootinfo.type[2]) == "table" then
			button.PetID = button.__atlaslootinfo.type[2][1]
			button.ItemID = button.__atlaslootinfo.type[2][2]
		else
			button.PetID = button.__atlaslootinfo.type[2]
		end
		Pet.Refresh(button)
	end
end

function Pet.OnMouseAction(button, mouseButton)
	if not mouseButton then return end
	mouseButton = PetClickHandler:Get(mouseButton)
	if mouseButton == "GoTo" then
		if not IsAddOnLoaded("Blizzard_Collections") then
			LoadAddOn("Blizzard_Collections")
		end
		
		ShowUIPanel(CollectionsJournal)
		CollectionsJournal_SetTab(CollectionsJournal, 2) -- 1 = Mounts
		PetJournal_ShowPetCardBySpeciesID(button.PetID)
	end
end

function Pet.OnClear(button)
	button.PetID = nil
	button.secButton.PetID = nil
	
	button.info = nil
	button.secButton.info = nil
	
	button.overlay:Hide()
	button.overlay:SetHeight(button.icon:GetWidth())
	button.overlay:SetWidth(button.icon:GetWidth())
	
	button.secButton.overlay:Hide()
	button.secButton.overlay:SetTexCoord(1, 1, 1, 1)
	button.secButton.overlay:SetHeight(button.icon:GetWidth())
	button.secButton.overlay:SetWidth(button.icon:GetWidth())
	
end

function Pet.OnEnter(button)
	Pet.ShowToolTipFrame(button)
end

function Pet.OnLeave(button)
	if Pet.tooltipFrame then Pet.tooltipFrame:Hide() end
	if button.ItemID then Item.OnLeave(button) end
end
--[[
self.TypeInfo.type:SetText(_G["BATTLE_PET_NAME_"..petType]);
	self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[petType]);
	self.TypeInfo.abilityID = PET_BATTLE_PET_TYPE_PASSIVES[petType];
	
		--Update pet abilites
	local abilities, levels = C_PetJournal.GetPetAbilityList(speciesID);
	for i=1,NUM_PET_ABILITIES do  -- 6 abilities
		local spellFrame = self["spell"..i];
		if abilities[i] and canBattle then
			local name, icon, petType = C_PetJournal.GetPetAbilityInfo(abilities[i]);
			local isNotUsable = not level or level < levels[i];
			spellFrame.icon:SetTexture(icon);
			spellFrame.icon:SetDesaturated(isNotUsable);
			spellFrame.LevelRequirement:SetText(levels[i]);
			spellFrame.LevelRequirement:SetShown(isNotUsable);
			spellFrame.BlackCover:SetShown(isNotUsable);
			if (not level or level < levels[i]) then
				spellFrame.additionalText = format(PET_ABILITY_REQUIRES_LEVEL, levels[i]);
			else
				spellFrame.additionalText = nil;
			end
			spellFrame.abilityID = abilities[i];
			spellFrame.petID = PetJournalPetCard.petID;
			spellFrame.speciesID = speciesID;
			spellFrame:Show();
		else
			spellFrame:Hide();
		end
	end
	
	<Texture name="$parentIconBorder" file="Interface\PetBattles\PetJournal" parentKey="iconBorder">
					<Anchors>
						<Anchor point="CENTER" relativeTo="$parentIcon" x="0" y="0"/>
					</Anchors>
					<Size x="53" y="54"/>
					<TexCoords left="0.41992188" right="0.52343750" top="0.02246094" bottom="0.07519531"/>	
				</Texture>
]]--
function Pet.Refresh(button)
	-- speciesName, speciesIcon, petType, companionID, tooltipSource, tooltipDescription, isWild, canBattle, isTradeable, isUnique, obtainable = C_PetJournal.GetPetInfoBySpeciesID(button.PetID)
	local speciesName, speciesIcon, petType, companionID, tooltipSource, tooltipDescription = C_PetJournal_GetPetInfoBySpeciesID(button.PetID)
	if not speciesName then return end
	if button.type == "secButton" then
		--/dump C_PetJournal.GetPetInfoBySpeciesID(1145)
	else
		button.name:SetText(PET_COLOR..speciesName)
		button.extra:SetText(_G["BATTLE_PET_NAME_"..petType])
	end

	
	button.overlay:Show()
	button.overlay:SetTexture(PET_JOURNAL_TEXTURE)
	button.overlay:SetTexCoord(0.41992188, 0.52343750, 0.02246094, 0.07519531)
	button.overlay:SetHeight(button.icon:GetHeight()*1.2)
	button.overlay:SetWidth(button.icon:GetWidth()*1.2)

	
	button.icon:SetTexture(speciesIcon)
	button.info = {speciesName, speciesIcon, petType, tooltipSource, tooltipDescription, companionID}
end

function Pet.GetStringContent(str)
	if tonumber(str) then
		return tonumber(str)
	else
		return {
			str_match(str, "(%d+)"),
			str_match(str, "i(%d+)"),	-- linked item
		}
	end
end

--################################
-- Pet frame
--################################
function Pet.ShowToolTipFrame(button)

	if not Pet.tooltipFrame then 
		local name = "AtlasLoot-PetToolTip"
		local frame = CreateFrame("Frame", name, nil, BackdropTemplateMixin and "BackdropTemplate" or nil)
		frame:SetClampedToScreen(true)
		frame:SetSize(300, 50)
		frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
							edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
							tile = true, tileSize = 16, edgeSize = 16, 
							insets = { left = 4, right = 4, top = 4, bottom = 4 }})
		frame:SetBackdropColor(0,0,0,1)
		
		frame.icon = frame:CreateTexture(name.."-icon", "ARTWORK")
		frame.icon:SetPoint("TOPLEFT", frame, "TOPLEFT", 5, -5)
		frame.icon:SetHeight(26)
		frame.icon:SetWidth(26)
		frame.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
		
		frame.name = frame:CreateFontString(name.."-name", "ARTWORK", "GameFontNormal")
		frame.name:SetPoint("TOPLEFT", frame.icon, "TOPRIGHT", 3, 0)
		frame.name:SetJustifyH("LEFT")
		frame.name:SetWidth(250)
		--frame.name:SetHeight(12)
		frame.name:SetTextColor(1, 1, 1, 1)
		
		frame.source = frame:CreateFontString(name.."-source", "ARTWORK", "GameFontNormalSmall")
		frame.source:SetPoint("TOPLEFT", frame.name, "BOTTOMLEFT", 0, -1)
		frame.source:SetJustifyH("LEFT")
		frame.source:SetJustifyV("TOP")
		frame.source:SetWidth(250)
		--frame.info:SetHeight(20)
		frame.source:SetTextColor(1, 1, 1, 1)
		
		frame.model = CreateFrame("PlayerModel", name.."-model")
		frame.model:ClearAllPoints()
		frame.model:SetParent(frame)
		frame.model:SetPoint("TOPLEFT", frame.icon, "BOTTOMLEFT", 0, -3)
		frame.model:SetSize(145,145)
		frame.model:SetRotation(MODELFRAME_DEFAULT_ROTATION)
		
		frame.desc = frame:CreateFontString(name.."-desc", "ARTWORK", "GameFontNormalSmall")
		frame.desc:SetPoint("TOPLEFT", frame.model, "TOPRIGHT", 0, -3)
		frame.desc:SetJustifyH("LEFT")
		frame.desc:SetJustifyV("TOP")
		frame.desc:SetWidth(145)
		frame.desc:SetHeight(145)
		frame.desc:SetTextColor(1, 1, 1, 1)

		frame.typeIcon = frame:CreateTexture(name.."-typeIcon", "ARTWORK")
		frame.typeIcon:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5)
		frame.typeIcon:SetHeight(20)
		frame.typeIcon:SetWidth(20)
		frame.typeIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
		frame.typeIcon:SetTexCoord(0.79687500, 0.49218750, 0.50390625, 0.65625000)
		
		Pet.tooltipFrame = frame
	end
	local tmp
	local frame = Pet.tooltipFrame
	frame:ClearAllPoints()
	frame:SetParent(button:GetParent():GetParent())
	frame:SetFrameStrata("TOOLTIP")
	frame:SetPoint("BOTTOMLEFT", button, "TOPRIGHT")
	
	frame.name:SetText(button.info[1])
	frame.source:SetText(button.info[4])
	frame.icon:SetTexture(button.info[2])
	tmp = frame.name:GetHeight()+frame.source:GetHeight()
	frame.icon:SetSize(tmp,tmp)
	frame:SetHeight(tmp+155)
	
	frame.desc:SetText(button.info[5])
	
	frame.model:SetCreature(button.info[6])
	frame.model:SetDoBlend(false)
	--frame.model:SetAnimation(0,-1) 0=alive, 6=dead
	
	frame.typeIcon:SetTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[button.info[3]])
	
	
	
	frame:Show()
	if button.ItemID then
		Item.OnEnter(button, {frame, "ANCHOR_TOPLEFT", 0, 2})
	end
end

