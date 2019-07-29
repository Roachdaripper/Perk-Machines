local PLUGIN = PLUGIN;

-- A function to load the monitors.
function PLUGIN:LoadPerks()
	local perkas = Clockwork.kernel:RestoreSchemaData("plugins/perkacola/"..game.GetMap());
	
	for k, v in pairs(perkas) do
		local entity = ents.Create(v.class);
		
		entity:SetPos(v.position);
		entity:Spawn();
		
		if (IsValid(entity)) then
			entity:SetAngles(v.angles);
		end;
	end;
end;

-- A function to save the monitors.
function PLUGIN:SavePerks()
	local perkas = {};
	
--	for k, v in pairs(ents.FindByClass("obj_cw_perkacola_*")) do
	for k,v in pairs(ents.GetAll()) do
		if string.find(v:GetClass(), "obj_cw_perkacola_") then
			perkas[#perkas + 1] = {
				angles = v:GetAngles(),
				position = v:GetPos(),
				class = v:GetClass()
			};
		end
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/perkacola/"..game.GetMap(), perkas);
end;
