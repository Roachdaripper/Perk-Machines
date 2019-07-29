
if SERVER then
	AddCSLuaFile("shared.lua")
end

ENT.Type = "anim"
ENT.PrintName = "Revive-Soda"
ENT.Spawnable = true
ENT.Category = "Perk Machines"

ENT.Base = "obj_cw_perkacola"

ENT.AdminSpawnable = false
ENT.UsableInVehicle = false

ENT.Perk_Model = "models/alig96/perks/revive/revive_on.mdl"
ENT.Perk_Price = "1500" -- It has to be a string because of some f u n k y shit later on.
ENT.Perk_Class = "revive_soda"
ENT.Perk_GiveSND = "nz/machines/jingle/revive_get.wav"

ENT.Perk_DLight_Color = Color(50, 200, 250, 200)