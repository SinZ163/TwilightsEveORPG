teve_town_firstjob_aura = class({})
LinkLuaModifier("modifier_teve_town_firstjob_aura", "abilities/town/modifier_teve_town_firstjob_aura.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_teve_town_firstjob_aura_effect", "abilities/town/modifier_teve_town_firstjob_aura_effect.lua", LUA_MODIFIER_MOTION_NONE)

function teve_town_firstjob_aura:GetIntrinsicModifierName()
    return "modifier_teve_town_firstjob_aura"
end