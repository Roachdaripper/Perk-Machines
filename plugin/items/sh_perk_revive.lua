local ITEM = Clockwork.item:New();
ITEM.name = "Revive Soda";
ITEM.model = "models/alig96/perks/perkacola/perkacola.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Drink";
ITEM.category = "Perks";
ITEM.description = "A bottle with a blue colour and a crude label that reads\n'Revive Soda - You need a little revive!'.";

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
				
				local success, err = Clockwork.attributes:Update(player, "medical", 20);
				if (!success) then
					if (!err) then
						err = "Unspecified Error"
					end;
					Clockwork.player:Notify(player,"The drink has a distinct 'fishy' taste to it. ["..err.."]");
				else
					Clockwork.player:Notify(player,"The drink has a distinct 'fishy' taste to it. [+20 Medical]") 
				end;
			end)
		end)
	end)
end;

function ITEM:OnDrop(player, position)  end;

function ITEM:OnEntitySpawned(entity)
	entity:SetMaterial("models/perk_bottle/c_perk_bottle_revive");
end;

ITEM:Register();