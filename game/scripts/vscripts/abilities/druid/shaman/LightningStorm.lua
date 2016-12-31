teve_druid_shaman_lightning_storm = class({})
LinkLuaModifier( "modifier_teve_druid_shaman_lightning_storm", "abilities/druid/shaman/modifier_teve_druid_shaman_lightning_storm", LUA_MODIFIER_MOTION_NONE )

function teve_druid_shaman_lightning_storm:OnSpellStart()
    print("Lightning Storm from Lua!")
    local kv = {
        duration = 3.3 --1.3s delay + 2.0s damage time
    }
    CreateModifierThinker( self:GetCaster(), self, "modifier_teve_druid_shaman_lightning_storm", kv, self:GetCursorPosition(), self:GetCaster():GetTeamNumber(), false )
end

function teve_druid_shaman_lightning_storm:GetAOERadius()
    return 350
end

function teve_druid_shaman_lightning_storm:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_4
end

function teve_druid_shaman_lightning_storm:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 40 + (30 * level)
end