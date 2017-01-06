teve_druid_shaman_lightning_fury = class({})
LinkLuaModifier( "modifier_teve_druid_shaman_lightning_fury", "abilities/druid/shaman/modifier_teve_druid_shaman_lightning_fury", LUA_MODIFIER_MOTION_NONE )

function teve_druid_shaman_lightning_fury:OnSpellStart()
    print("Lightning Fury from Lua!")

    local hTarget = self:GetCursorTarget()

    local bounces = 4
    local bounce_aoe = 500
    local bounce_delay = 0.2
    self.damage = 130 * self:GetLevel()

    local next_target_position = self:LightningBounce(hTarget)

    local hit_targets = {}
    hit_targets[hTarget:GetEntityIndex()] = true

    Timers:CreateTimer(bounce_delay, function()
        local units = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), next_target_position, hTarget, bounce_aoe, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, true)

        if #units > 0 then
            local bounce_target
            for _,unit in pairs(units) do
                local entIdx = unit:GetEntityIndex()
                if not hit_targets[entIdx] then
                    bounce_target = unit
                    hit_targets[entIdx] = true
                    break
                end
            end

            if bounce_target then
                next_target_position = self:LightningBounce(bounce_target)
                
                bounces = bounces - 1
                if bounces > 0 then
                    return bounce_delay
                end
            end
        end
    end)
end

function teve_druid_shaman_lightning_fury:CastFilterResultTarget( hTarget )
    local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, self:GetTeamNumber() )
    if nResult ~= UF_SUCCESS then
        return nResult
    end

    return UF_SUCCESS
end

function teve_druid_shaman_lightning_fury:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_2
end

function teve_druid_shaman_lightning_fury:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 50 + (30 * level)
end

function teve_druid_shaman_lightning_fury:LightningBounce(target)
    local target_position = target:GetAbsOrigin()
    damage_table = {
        victim = target,
        attacker = self:GetCaster(),
        damage = self.damage,
        ability = self,
        damage_type = DAMAGE_TYPE_MAGICAL
    }
    ApplyDamage(damage_table)

    return target_position
end