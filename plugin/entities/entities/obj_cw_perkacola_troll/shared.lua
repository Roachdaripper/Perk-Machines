
if SERVER then
	AddCSLuaFile("shared.lua")
end

ENT.Type = "anim"
ENT.PrintName = "PhD?"
ENT.Spawnable = true
ENT.Category = "Perk Machines"

ENT.Base = "obj_cw_perkacola"

ENT.AdminSpawnable = false
ENT.UsableInVehicle = false

ENT.Perk_Model = "models/alig96/perks/phd/phdflopper.mdl"
ENT.Perk_Price = "200" -- It has to be a string because of some f u n k y shit later on.
ENT.Perk_Class = "phd_flopper"
ENT.Perk_GiveSND = "nz/machines/jingle/phd_get.wav"

ENT.Perk_DLight_Color = Color(255, 250, 0, 200)