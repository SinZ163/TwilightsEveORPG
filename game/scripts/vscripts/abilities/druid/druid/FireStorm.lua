teve_druid_druid_fire_storm = class({})
LinkLuaModifier( "modifier_teve_druid_druid_fire_storm", "abilities/druid/druid/modifier_teve_druid_druid_fire_storm", LUA_MODIFIER_MOTION_NONE )

function teve_druid_druid_fire_storm:OnSpellStart()
    print("Fire Storm from Lua!")
    local kv = {
        duration = 1.7 --0.7s delay + 1.0s damage time
    }
    CreateModifierThinker( self:GetCaster(), self, "modifier_teve_druid_druid_fire_storm", kv, self:GetCursorPosition(), self:GetCaster():GetTeamNumber(), false )
end

function teve_druid_druid_fire_storm:OnAbilityPhaseStart()
    EmitSoundOn("Hero_AbyssalUnderlord.Firestorm.Cast", self:GetCaster())
    return true
end

function teve_druid_druid_fire_storm:GetAOERadius()
    return 350
end

function teve_druid_druid_fire_storm:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_2
end

function teve_druid_druid_fire_storm:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 60 + (20 * level)
end