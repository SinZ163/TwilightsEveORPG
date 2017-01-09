modifier_teve_druid_summoner_armageddon = class({})

function modifier_teve_druid_summoner_armageddon:OnCreated( kv )
    self.armageddon_damage = (5000 * self:GetAbility():GetLevel()) / 2  --divided by 2 because tick_rate is 0.5
    self.tick_rate = 0.5

    if IsServer() then
        self:StartIntervalThink( self.tick_rate )
        local hTarget = self:GetParent():GetAbsOrigin()
        local nFXIndex = ParticleManager:CreateParticle("particles/hero/druid/summoner/summoner_armageddon_burnfire.vpcf", PATTACH_POINT_FOLLOW, self:GetParent() )
        ParticleManager:SetParticleControlEnt(nFXIndex, 0, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", hTarget, true)
        self:AddParticle( nFXIndex, false, false, -1, false, false)
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
