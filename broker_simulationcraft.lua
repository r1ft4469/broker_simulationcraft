-- Titan [SimulationCraft]
-- Description: Titan plug-in to open Simulation Craft
-- Author: r1fT
-- Version: @project-version@

LDB = LibStub:GetLibrary("LibDataBroker-1.1")
local OverallAvg
local EquippedAvg
local LDBSimulationcraft = LDB:NewDataObject("Broker_|cff008cffSimulationcraft|r", 
{
	type = "data source", 
	text = "", 
	OnClick = function(frame,button)
		if button == "LeftButton" then
			local editbox=ChatEdit_ChooseBoxForSend(DEFAULT_CHAT_FRAME);
			ChatEdit_ActivateChat(editbox);
			editbox:SetText("/simc");
			ChatEdit_OnEnterPressed(editbox);
		end
	end
})

local f = CreateFrame("Frame")
f:SetScript("OnEvent", function()
	LDBSimulationcraft.icon = "Interface\\Addons\\broker_simulationcraft\\Icon";
end) 
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")

function GetItemLevel(iLink)
    name, link, quality, iLvl, reqLevel, class, subclass, maxStack, equipSlot, texture, vendorPrice = GetItemInfo(iLink);
    if(iLvl == nil)then
        ilvl = 0;
    end
    return iLvl;
 end
 
 function LDBSimulationcraft.OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_NONE")
    GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT")
    GameTooltip:ClearLines()
    SimulationcraftMakeToolTip(GameTooltip)
    GameTooltip:Show()
end

function LDBSimulationcraft.OnLeave()
	GameTooltip:Hide()
end

function SimulationcraftMakeToolTip(self)
	self:AddLine("|cff00ff00SimulationCraft|r")
	self:AddLine(" ")
	SimCInvSlot = INVSLOT_HEAD
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Helm:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Helm:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_NECK
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Neck:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Neck:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_SHOULDER
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Shoulder:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Shoulder:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_BACK
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Back:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Back:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_CHEST
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Chest:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Chest:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_WAIST
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Waist:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Waist:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_LEGS
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Legs:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Legs:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_FEET
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Feet:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Feet:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_WRIST
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Wrist:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Wrist:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_HAND
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Hands:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Hands:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_FINGER1
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Ring:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Ring:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_FINGER2
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Ring:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Ring:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_TRINKET1
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Trinket:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Trinket:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	SimCInvSlot = INVSLOT_TRINKET2
	if GetInventoryItemLink("player", SimCInvSlot) ~= nil then
		iLink = GetInventoryItemLink("player", SimCInvSlot);
		iLvl = GetItemLevel(iLink);
		self:AddDoubleLine("|cFFF9CB03Trinket:",iLink.." - |cFFFFFFFF"..iLvl.."|r",1,1,1, 1,1,1);
		if PawnVersion ~= nil then
			Pawn_calc = PawnGetItemDataForInventorySlot(SimCInvSlot, false);
			Pawn_output = PawnGetAllItemValues(Pawn_calc.Stats,Pawn_calc.Level,Pawn_calc.SocketBonusStats);
			for key, value in pairs(Pawn_output) do
				for k, v in pairs(value) do
					if (v ~= 0) then
						if (k % 2 == 0) then
							SimCItem_value = "|cFF00FF00"..Pawn_round(v, 1).."|r"
							self:AddDoubleLine(SimCItem_label,SimCItem_value,1,1,1, 1,1,1);
						else
							SimCItem_label = "   |cFFFFFFFF*"..v.."|r"
						end
					else
						break
					end
				end
			end
		end
	else
		self:AddDoubleLine("|cFFF9CB03Trinket:","|cFFFFFFFFNone|r",1,1,1, 1,1,1);
	end
	EquippedAvg = string.format("%d",select(2,GetAverageItemLevel("player")));
	self:AddLine(" ");
	self:AddLine("Average Item Level: |cFF0055FF"..EquippedAvg.."|r ");
	self:AddLine("|cff00ff00Left-click for SimulationCraft export.|r");
	return
end

function Pawn_round(num, n)
	local mult = 10^(n or 0)
	return math.floor(num * mult + 0.5) / mult
end




