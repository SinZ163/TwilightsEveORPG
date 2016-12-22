teve_druid_archdruid_thunderstorm = class({})
LinkLuaModifier( "modifier_teve_druid_archdruid_thunderstorm_thinker", "abilities/druid/archdruid/modifier_teve_druid_archdruid_thunderstorm_thinker", LUA_MODIFIER_MOTION_NONE )

function teve_druid_archdruid_thunderstorm:OnSpellStart()
    print("Thunderstorm from Lua!")
    local kv = {
        duration = 1.2 --Fact check plz
    }
    CreateModifierThinker( self:GetCaster(), self, "modifier_teve_druid_archdruid_thunderstorm_thinker", kv, self:GetCursorPosition(), self:GetCaster():GetTeamNumber(), false )
end

function teve_druid_archdruid_thunderstorm:GetAOERadius()
    return 350
end

function teve_druid_archdruid_thunderstorm:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_4
end

function teve_druid_archdruid_thunderstorm:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 50 + (25 * level )
end