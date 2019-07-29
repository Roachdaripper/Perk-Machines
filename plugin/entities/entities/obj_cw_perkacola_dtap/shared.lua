
if SERVER then
	AddCSLuaFile("shared.lua")
end

ENT.Type = "anim"
ENT.PrintName = "Root-Beer"
ENT.Spawnable = true
ENT.Category = "Perk Machines"

ENT.Base = "obj_cw_perkacola"

ENT.AdminSpawnable = false
ENT.UsableInVehicle = false

--ENT.Perk = {}
--ENT.Perk.DLight = {}

ENT.Perk_Model = "models/alig96/perks/doubletap/doubletap_on.mdl"
ENT.Perk_Price = "200" -- It has to be a string because of some f u n k y shit later on.
ENT.Perk_Class = "double-tap_root_beer"
ENT.Perk_GiveSND = "nz/machines/jingle/dtap_get.wav"

ENT.Perk_DLight_Color = Color(255, 200, 0, 200)