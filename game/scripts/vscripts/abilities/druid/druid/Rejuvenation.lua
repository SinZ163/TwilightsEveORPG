teve_druid_druid_rejuvenation = class({})
LinkLuaModifier( "modifier_teve_druid_druid_rejuvenation", "abilities/druid/druid/modifier_teve_druid_druid_rejuvenation", LUA_MODIFIER_MOTION_NONE )

function teve_druid_druid_rejuvenation:OnSpellStart()
    print("Rejuvenation!!")
    local hTarget = self:GetCursorTarget()
    local rejuvenation_duration = 15
    hTarget:AddNewModifier( self:GetCaster(), self, "modifier_teve_druid_druid_rejuvenation", { duration = rejuvenation_duration } )
    EmitSoundOn("n_creep_ForestTrollHighPriest.Heal", hTarget)
end

function teve_druid_druid_rejuvenation:CastFilterResultTarget( hTarget )
    local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, self:GetTeamNumber() )
    if nResult ~= UF_SUCCESS then
        return nResult
    end

    return UF_SUCCESS
end

function teve_druid_druid_rejuvenation:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_3
end

function teve_druid_druid_rejuvenation:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 40 + (20 * level)
end