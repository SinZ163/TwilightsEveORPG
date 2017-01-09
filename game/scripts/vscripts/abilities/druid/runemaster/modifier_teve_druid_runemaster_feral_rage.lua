modifier_teve_druid_runemaster_feral_rage = class ({})

function modifier_teve_druid_runemaster_feral_rage:OnCreated( kv )
    self.feral_rage_damage = 500 * self:GetAbility():GetLevel()

    local hTarget = self:GetParent():GetAbsOrigin()
    local nFXIndex = ParticleManager:CreateParticle( "particles/hero/druid/runemaster/runemasterferalrage.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
    ParticleManager:SetParticleControl( nFXIndex, 0, hTarget)
    ParticleManager:SetParticleControlEnt( nFXIndex, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_weapon", hTarget, true)

    self:AddParticle( nFXIndex, false, false, -1, false, false)
end    

function modifier_teve_druid_runemaster_feral_rage:OnRefresh ( kv )
    self.feral_rage_damage = 500 * self:GetAbility():GetLevel()
end

function modifier_teve_druid_runemaster_feral_rage:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
    return funcs
end

function modifier_teve_druid_runemaster_feral_rage:GetModifierPreAttack_BonusDamage( params )
    return 500 * self:GetAbility():GetLevel()
end

function modifier_teve_druid_runemaster_feral_rage:OnAttackLanded(params)
    if params["attacker"] == self:GetCaster() and params["damage_type"] == DAMAGE_TYPE_PHYSICAL then
        self.lifesteal_pct = 0.05 * math.ceil( self:GetAbility():GetLevel() / 10 )

        self.target_armour = params["target"]:GetPhysicalArmorValue()
        self.armour_constant = 0.06        --constant is 0.06 in dota but 0.01 in teve. change value to 0.01 once teve armour is implemented
        self.damage_mult = 1 - (self.armour_constant * self.target_armour / (1 + (self.armour_constant * self.target_armour)))
        self.total_damage = params["damage"] * self.damage_mult
        self.target_hp = params["target"]:GetHealth()

        if self.total_damage < self.target_hp then
            self.heal_amount = self.lifesteal_pct * self.total_damage
        else
            self.heal_amount = self.lifesteal_pct * self.target_hp
        end

        print("Lifestealing for " .. self.heal_amount)
        self:GetCaster():Heal(self.heal_amount, self:GetCaster())
        SendOverheadEventMessage(self:GetCaster(), OVERHEAD_ALERT_HEAL, self:GetCaster(), math.floor(self.heal_amount), nil)
    end
end
