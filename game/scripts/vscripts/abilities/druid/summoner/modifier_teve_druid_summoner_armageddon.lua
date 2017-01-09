modifier_teve_druid_summoner_armageddon = class({})

function modifier_teve_druid_summoner_armageddon:OnCreated( kv )
    self.armageddon_damage = (5000 * self:GetAbility():GetLevel()) / 2  --divided by 2 because tick_rate is 0.5
    self.tick_rate = 0.5

    if IsServer() then
        self:StartIntervalThink( self.tick_rate )
    end
end

function modifier_teve_druid_summoner_armageddon:OnIntervalThink()
    if IsServer() then
        local damage = {
            attacker = self:GetCaster(),
            victim = self:GetParent(),
            damage = self.armageddon_damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            ability = self:GetAbility()        
        }

        ApplyDamage( damage )
    end
end

function modifier_teve_druid_summoner_armageddon:GetEffectName()
    return "particles/econ/courier/courier_onibi/courier_onibi_green_ambient_b.vpcf"
end
