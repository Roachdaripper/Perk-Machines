
if SERVER then
	AddCSLuaFile("shared.lua")
end

ENT.Type = "anim"
ENT.PrintName = "Speed-Cola"
ENT.Spawnable = true
ENT.Category = "Perk Machines"

ENT.Base = "obj_cw_perkacola"

ENT.AdminSpawnable = false
ENT.UsableInVehicle = false

ENT.Perk_Model = "models/alig96/perks/speed/speed_on.mdl"
ENT.Perk_Price = "3000" -- It has to be a string because of some f u n k y shit later on.
ENT.Perk_Class = "speed_cola"
ENT.Perk_GiveSND = "nz/machines/jingle/speed_get.wav"

ENT.Perk_DLight_Color = Color(25, 255, 25, 200)