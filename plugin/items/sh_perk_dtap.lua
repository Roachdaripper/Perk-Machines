
--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Double-Tap Root Beer";
ITEM.cost = 200;
ITEM.model = "models/alig96/perks/perkacola/perkacola.mdl";
--ITEM.model = "models/props_junk/garbage_plasticbottle001a.mdl";
ITEM.weight = 0.8;
ITEM.access = "v";
ITEM.useText = "Drink";
ITEM.business = false;
ITEM.category = "Perks";
ITEM.description = "A bottle with a brown colour and a crude label that reads\n'Double-Tap - Reach for the root-bear shelf!'.";

function ITEM:OnUse(player, itemEntity)
	player:EmitSound("nz/perks/open.wav")
	player:ViewPunch( Angle( -1, 1, 0 ) )
	timer.Simple(1.3,function()
		if !IsValid(player) then return end
		if !player:Alive() then return end
		
		player:EmitSound("nz/perks/drink.wav")
		player:ViewPunch( Angle( -2.5, 0, 0 ) )
		
		timer.Simple(1,function()
			if !IsValid(player) then return end
			if !player:Alive() then return end
			
			player:EmitSound("nz/perks/smash.wav")
			
			timer.Simple(.8,function()
				if !IsValid(player) then return end
				if !player:Alive() then return end
			
				player:EmitSound("nz/perks/burp.wav")
				
				player:SetArmor(player:Armor()+35)
				Clockwork.player:Notify(player, "The drink seems to be root beer. What a strange thing to put in a vending machine. [Armor +35]")
			end)
		end)
	end)
end;


-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnEntitySpawned(entity)
	entity:SetMaterial("models/perk_bottle/c_perk_bottle_dtap");
end;

ITEM:Register();