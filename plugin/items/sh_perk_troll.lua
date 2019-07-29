local ITEM = Clockwork.item:New();
ITEM.name = "PhD. Flopper";
ITEM.model = "models/alig96/perks/perkacola/perkacola.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Drink";
ITEM.category = "Perks";
ITEM.description = "A bottle with a blue colour and a crude label that has a picture of a bear on it, perhaps the machine was stocked incorrectly?";

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
				
				player:SetHealth(player:Health()+25)
				player:SetArmor(player:Armor()+25)
				Clockwork.player:Notify(player, "The drink is just plain (albeit purified) water. How odd. [Health +25, Armor +25]")
			end)
		end)
	end)
end;

function ITEM:OnDrop(player, position) end;

function ITEM:OnEntitySpawned(entity)
	entity:SetMaterial("models/perk_bottle/c_perk_bottle_teddy");
end;

ITEM:Register();