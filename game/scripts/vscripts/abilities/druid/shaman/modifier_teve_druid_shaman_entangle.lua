modifier_teve_druid_shaman_entangle = class ({})

function modifier_teve_druid_shaman_entangle:OnCreated()
    self.entangle_damage = (50 * self:GetAbility():GetLevel()) / 2  --divided by 2 because tick_rate is 0.5
    self.tick_rate = 0.5
    if IsServer() then
        self:StartIntervalThink( self.tick_rate )
    end
end

function modifier_teve_druid_shaman_entangle:OnIntervalThink()
    if IsServer() then
        local damage = {
            attacker = self:GetCaster(),
            victim = self:GetParent(),
            damage = self.entangle_damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            ability = self:GetAbility()        
        }

        ApplyDamage( damage )
    end
end

function modifier_teve_druid_shaman_entangle:IsDebuff()
    return true
end

function modifier_teve_druid_shaman_entangle:CheckState()
    state = {
        [MODIFIER_STATE_ROOTED] = true
    }
    return state
end
