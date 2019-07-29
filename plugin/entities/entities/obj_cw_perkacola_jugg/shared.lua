
if SERVER then
	AddCSLuaFile("shared.lua")
end

ENT.Type = "anim"
ENT.PrintName = "Jugger-Nog"
ENT.Spawnable = true
ENT.Category = "Perk Machines"

ENT.Base = "obj_cw_perkacola"

ENT.AdminSpawnable = false
ENT.UsableInVehicle = false

ENT.Perk_Model = "models/alig96/perks/jugg/jugg_on.mdl"
ENT.Perk_Price = "2500" -- It has to be a string because of some f u n k y shit later on.
ENT.Perk_Class = "jugger-nog"
ENT.Perk_GiveSND = "nz/machines/jingle/jugg_get.wav"

ENT.Perk_DLight_Color = Color(255, 25, 25, 200)