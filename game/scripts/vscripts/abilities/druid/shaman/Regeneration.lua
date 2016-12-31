teve_druid_shaman_regeneration = class({})
LinkLuaModifier( "modifier_teve_druid_shaman_regeneration", "abilities/druid/shaman/modifier_teve_druid_shaman_regeneration", LUA_MODIFIER_MOTION_NONE )

function teve_druid_shaman_regeneration:OnSpellStart()
    print("Regeneration!!")
    local hTarget = self:GetCursorTarget()
    local regeneration_duration = 15
    hTarget:AddNewModifier( self:GetCaster(), self, "modifier_teve_druid_shaman_regeneration", { duration = regeneration_duration } )
end

function teve_druid_shaman_regeneration:CastFilterResultTarget( hTarget )
    local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, self:GetTeamNumber() )
    if nResult ~= UF_SUCCESS then
        return nResult
    end

    return UF_SUCCESS
end

function teve_druid_shaman_regeneration:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 50 + (25 * level)        --Is this correct?
end