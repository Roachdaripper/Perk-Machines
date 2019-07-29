local ITEM = Clockwork.item:New();
ITEM.name = "Stamin-Up Brew";
ITEM.model = "models/alig96/perks/perkacola/perkacola.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Drink";
ITEM.category = "Perks";
ITEM.description = "A bottle with a yellow colour and a crude label that reads\n'Stamin-Up Brew - Sounds like it's Stamin-Up time!'.";

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
				
				local success, err = Clockwork.attributes:Update(player, "stamina", 20);
				if (!success) then
					if (!err) then
						err = "Unspecified Error"
					end;
					Clockwork.player:Notify(player,"You feel relief as you no longer feel exhausted. ["..err.."]");
				else
					Clockwork.player:Notify(player,"You feel relief as you no longer feel exhausted. [+20 Stamina]") 
				end;
			end)
		end)
	end)
end;

function ITEM:OnDrop(player, position) end;

function ITEM:OnEntitySpawned(entity)
	entity:SetMaterial("models/perk_bottle/c_perk_bottle_stamin");
end;

ITEM:Register();