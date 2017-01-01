teve_druid_summoner_lightning_storm = class({})
LinkLuaModifier( "modifier_teve_druid_summoner_lightning_storm", "abilities/druid/summoner/modifier_teve_druid_summoner_lightning_storm", LUA_MODIFIER_MOTION_NONE )

function teve_druid_summoner_lightning_storm:OnSpellStart()
    print("Thunderstorm from Lua!")
    local kv = {
        duration = 2.5 --1.3s delay + 1.2s damage time
    }
    CreateModifierThinker( self:GetCaster(), self, "modifier_teve_druid_summoner_lightning_storm", kv, self:GetCursorPosition(), self:GetCaster():GetTeamNumber(), false )
end

function teve_druid_summoner_lightning_storm:GetAOERadius()
    return 350
end

function teve_druid_summoner_lightning_storm:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_1
end

function teve_druid_summoner_lightning_storm:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 200 * level
end