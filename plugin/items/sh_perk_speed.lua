local ITEM = Clockwork.item:New();
ITEM.name = "Speed Cola";
ITEM.model = "models/alig96/perks/perkacola/perkacola.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Drink";
ITEM.category = "Perks";
ITEM.description = "A bottle with a green colour and a crude label that reads\n'Speed Cola Speeds up your life!'.";

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
				
				local success, err = Clockwork.attributes:Update(player, "agility", 20);
				if (!success) then
					if (!err) then
						err = "Unspecified Error"
					end;
					Clockwork.player:Notify(player,"The drink is incredibly sugary and almost makes you want to run around. ["..err.."]");
				else
					Clockwork.player:Notify(player,"The drink is incredibly sugary and almost makes you want to run around. [+20 Agility]") 
				end;
			end)
		end)
	end)
end;

function ITEM:OnDrop(player, position) end;

function ITEM:OnEntitySpawned(entity)
	entity:SetMaterial("models/perk_bottle/c_perk_bottle_speed");
end;

ITEM:Register();