teve_druid_shaman_lightning_fury = class({})
LinkLuaModifier( "modifier_teve_druid_shaman_lightning_fury", "abilities/druid/shaman/modifier_teve_druid_shaman_lightning_fury", LUA_MODIFIER_MOTION_NONE )

function teve_druid_shaman_lightning_fury:OnSpellStart()
    print("Lightning Fury from Lua!")

    local hTarget = self:GetCursorTarget()

    local bounces = 4
    local bounce_aoe = 500
    local bounce_delay = 0.2
    self.damage = 130 * self:GetLevel()
    self.caster = self:GetCaster()

    -- PARTICLE STUFF

    -- local attack_attack1 = self.caster:ScriptLookupAttachment("attach_attack1")
    -- local start_position = self.caster:GetAttachmentOrigin(attach_attack1)
    local start_position = self.caster:GetAbsOrigin()
    start_position.z = start_position.z + hTarget:GetBoundingMaxs().z

    -- END PARTICLE STUFF

    local next_target_position = self:LightningBounce(hTarget, start_position)

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
                next_target_position = self:LightningBounce(bounce_target, next_target_position)
                
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

function teve_druid_shaman_lightning_fury:LightningBounce(target, start_position)
    -- PARTICLE STUFF

    local attach_hitloc = target:ScriptLookupAttachment("attach_hitloc")
    local target_position = target:GetAttachmentOrigin(attach_hitloc)
    local particle = ParticleManager:CreateParticle("particles/items_fx/chain_lightning.vpcf", PATTACH_CUSTOMORIGIN, self.caster)
    ParticleManager:SetParticleControl(particle, 0, start_position)
    ParticleManager:SetParticleControl(particle, 1, target_position)

    -- END PARTICLE STUFF

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