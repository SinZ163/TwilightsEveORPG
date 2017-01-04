modifier_teve_druid_druid_disabling_roots = class ({})

function modifier_teve_druid_druid_disabling_roots:OnCreated()
    self.disabling_roots_damage = 50 + (10 * self:GetAbility():GetLevel()) / 2  --divided by 2 because tick_rate is 0.5
    self.tick_rate = 0.5
    if IsServer() then
        self:StartIntervalThink( self.tick_rate )
    end
end

function modifier_teve_druid_druid_disabling_roots:OnIntervalThink()
    if IsServer() then
        local damage = {
            attacker = self:GetCaster(),
            victim = self:GetParent(),
            damage = self.disabling_roots_damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            ability = self:GetAbility()        
        }

        ApplyDamage( damage )
    end
end

function modifier_teve_druid_druid_disabling_roots:IsDebuff()
    return true
end

function modifier_teve_druid_druid_disabling_roots:CheckState()
    state = {
        [MODIFIER_STATE_ROOTED] = true
    }
    return state
end
