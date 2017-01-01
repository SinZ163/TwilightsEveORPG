teve_druid_summoner_regeneration = class({})
LinkLuaModifier( "modifier_teve_druid_summoner_regeneration", "abilities/druid/summoner/modifier_teve_druid_summoner_regeneration", LUA_MODIFIER_MOTION_NONE )

function teve_druid_summoner_regeneration:OnSpellStart()
    print("Regeneration!!")
    local hTarget = self:GetCursorTarget()
    local regeneration_duration = 5
    hTarget:AddNewModifier( self:GetCaster(), self, "modifier_teve_druid_summoner_regeneration", { duration = regeneration_duration } )
end

function teve_druid_summoner_regeneration:CastFilterResultTarget( hTarget )
    local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, self:GetTeamNumber() )
        if nResult ~= UF_SUCCESS then
            return nResult
        end

        return UF_SUCCESS
end

function teve_druid_summoner_regeneration:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_2
end

function teve_druid_summoner_regeneration:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 120 * level
end