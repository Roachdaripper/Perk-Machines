
if SERVER then
	AddCSLuaFile("shared.lua")
end

ENT.Type = "anim"
ENT.PrintName = "Perk-a-cola Base"
ENT.Spawnable = false

ENT.AdminSpawnable = false
ENT.UsableInVehicle = false
-- ENT.PhysgunDisabled = true

ENT.Perk_Model = "models/alig96/perks/speed/speed_on.mdl"
ENT.Perk_Price = "1500" -- It has to be a string because of some f u n k y shit later on.
ENT.Perk_Class = "perk_revive"
ENT.Perk_ErrSND ="roleplay/perkacolas/ply_cant_afford.mp3"
ENT.Perk_IdleSND = {"roleplay/perkacolas/random1.mp3","roleplay/perkacolas/random2.mp3","roleplay/perkacolas/random3.mp3"}
ENT.Perk_GiveSND = "nz/machines/jingle/revive_get.wav"

ENT.Perk_SNDTBL = {
	Buy="nz/perks/buy.wav",
	Open="nz/perks/open.wav",
	Drink="nz/perks/drink.wav",
	Smash="nz/perks/smash.wav",
	Burp="nz/perks/burp.wav",
}

ENT.Perk_DLight_Enabled = true
ENT.Perk_DLight_Color = Color(50, 200, 250, 200)

if SERVER then
	function ENT:Initialize()
		self:SetModel(self.Perk_Model)
		
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:SetSolid(SOLID_VPHYSICS)
		self:DrawShadow(false)
	end;

	-- Called when the entity's physics should be updated.
	function ENT:PhysicsUpdate(physicsObject)
		if (!self:IsPlayerHolding() and !self:IsConstrained()) then
			physicsObject:SetVelocity( Vector(0, 0, 0) )
			physicsObject:Sleep()
		end
	end

	-- Called when the entity is used.
	function ENT:Use(activator, caller)
		if (activator:IsPlayer() and activator:GetEyeTraceNoCursor().Entity == self) then
			local curTime = CurTime()
			Plyr = activator
			
			if (!self.nextUse or curTime >= self.nextUse) then
				if (curTime > self:GetDTFloat(0)) then
					self.nextUse = curTime + 3
					if (!Clockwork.player:CanAfford(activator, tonumber(self.Perk_Price))) then
						self:EmitSound(self.Perk_ErrSND)
						Clockwork.player:Notify(activator, "The machine spits out the coins you put in, clearly you didn't have enough cash.")
					elseif (!activator.nextPerk or curTime >= activator.nextPerk) then
						Clockwork.player:GiveCash(activator, tonumber("-"..self.Perk_Price), "Perk-a-Cola.")
						activator:GiveItem(Clockwork.item:CreateInstance(self.Perk_Class));
						self:EmitSound(self.Perk_SNDTBL.Buy)
						self:EmitSound(self.Perk_GiveSND)
					else
						self:EmitSound(self.Perk_ErrSND)
						Clockwork.player:Notify(activator, "The machine does not accept any more input from you, it giving no indication as to why.")
					end
				end
			end
		end
	end


	-- Called when a player attempts to use a tool.
	function ENT:CanTool(player, trace, tool)
		return false
	end
	function ENT:OnRemove()
		Plyr.nextPerk = CurTime() + 0
	end
end

if CLIENT then
	function ENT:Draw()
		if tobool(self.Perk_DLight_Enabled) then
			local dlight_perk = DynamicLight(self:EntIndex())
			if (dlight_perk) then
				local c = self.Perk_DLight_Color
				dlight_perk.Pos = self:GetPos() + ((self:GetForward()*25) + Vector(0,0,50))
				dlight_perk.r = c.r
				dlight_perk.g = c.g
				dlight_perk.b = c.b
				dlight_perk.Brightness = 1
				dlight_perk.Decay = 0.1 + math.Rand(0.01, 0.1)
				dlight_perk.Size = 150
				dlight_perk.DieTime = CurTime() + 0.1
			end
		end
		self:DrawModel()
	end
end
