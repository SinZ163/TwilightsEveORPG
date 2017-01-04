teve_druid_druid_thorns_aura = class({})
LinkLuaModifier( "modifier_teve_druid_druid_thorns_aura", "abilities/druid/druid/modifier_teve_druid_druid_thorns_aura", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_teve_druid_druid_thorns_aura_buff", "abilities/druid/druid/modifier_teve_druid_druid_thorns_aura_buff", LUA_MODIFIER_MOTION_NONE )

function teve_druid_druid_thorns_aura:GetIntrinsicModifierName()
    return "modifier_teve_druid_druid_thorns_aura"
end
