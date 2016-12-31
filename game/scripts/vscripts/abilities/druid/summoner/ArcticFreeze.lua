teve_druid_summoner_arctic_freeze = class({})
LinkLuaModifier( "modifier_teve_druid_summoner_arctic_freeze", "abilities/druid/summoner/modifier_teve_druid_summoner_arctic_freeze", LUA_MODIFIER_MOTION_NONE )

function teve_druid_summoner_arctic_freeze:OnSpellStart()
    local arctic_freeze_duration = 3
    local arctic_freeze_damage = self:GetLevel() * 1000

    local enemies = FindUnitsInRadius( self:GetCaster():GetTeamNumber(), self:GetCaster():GetOrigin(), self:GetCaster(), self:GetAOERadius(), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false )
    if #enemies > 0 then
        for _, enemy in pairs(enemies) do
            if enemy ~= nil and ( not enemy:IsMagicImmune() ) and ( not enemy:IsInvulnerable() ) then
                local damage = {
                    victim = enemy,
                    attacker = self:GetCaster(),
                    damage = arctic_freeze_damage,
                    damage_type = DAMAGE_TYPE_MAGICAL,
                    ability = self
                }
                ApplyDamage( damage )
                enemy:AddNewModifier( self:GetCaster(), self, "modifier_teve_druid_summoner_arctic_freeze", { duration = arctic_freeze_duration } )
            end
        end
    end
end

function teve_druid_summoner_arctic_freeze:GetAOERadius()
    return 600
end

function teve_druid_summoner_arctic_freeze:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_3
end

function teve_druid_summoner_arctic_freeze:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 150 * level
end