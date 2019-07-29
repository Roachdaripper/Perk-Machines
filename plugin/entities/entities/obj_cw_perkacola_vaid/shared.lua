
if SERVER then
	AddCSLuaFile("shared.lua")
end

ENT.Type = "anim"
ENT.PrintName = "Vulture-Aid Elixir"
ENT.Spawnable = true
ENT.Category = "Perk Machines"

ENT.Base = "obj_cw_perkacola"

ENT.AdminSpawnable = false
ENT.UsableInVehicle = false

ENT.Perk_Model = "models/alig96/perks/vulture/vultureaid.mdl"
ENT.Perk_Price = "3000" -- It has to be a string because of some f u n k y shit later on.
ENT.Perk_Class = "vulture-aid_elixir"
ENT.Perk_GiveSND = "nz/machines/jingle/vulture_get.wav"

ENT.Perk_DLight_Color = Color(127, 0, 0, 200)