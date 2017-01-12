teve_druid_shaman_entangle = class({})
LinkLuaModifier( "modifier_teve_druid_shaman_entangle", "abilities/druid/shaman/modifier_teve_druid_shaman_entangle", LUA_MODIFIER_MOTION_NONE )

function teve_druid_shaman_entangle:OnSpellStart()
    print("Entangle from Lua!")

    local hTarget = self:GetCursorTarget()
    hTarget:AddNewModifier( self:GetCaster(), self, "modifier_teve_druid_shaman_entangle", { duration = 3 } )
    EmitSoundOnLocationWithCaster( hTarget:GetOrigin(),"Hero_Treant.Overgrowth.Target", self:GetCaster() )
    EmitSoundOnLocationWithCaster( hTarget:GetOrigin(),"Hero_Treant.Overgrowth.Cast", self:GetCaster() )
end

function teve_druid_shaman_entangle:OnAbilityPhaseStart()
    EmitSoundOn("Hero_Treant.Overgrowth.CastAnim", self:GetCaster() )
    return true
end

function teve_druid_shaman_entangle:CastFilterResultTarget( hTarget )
    local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, self:GetTeamNumber() )
    if nResult ~= UF_SUCCESS then
        return nResult
    end

    return UF_SUCCESS
end

function teve_druid_shaman_entangle:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_2
end

function teve_druid_shaman_entangle:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 25 + (25 * level)
end