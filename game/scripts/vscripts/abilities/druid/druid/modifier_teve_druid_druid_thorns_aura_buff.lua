modifier_teve_druid_druid_thorns_aura_buff = class({})

function modifier_teve_druid_druid_thorns_aura_buff:DeclareFunctions()
    local funcs = {
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
    return funcs
end

function modifier_teve_druid_druid_thorns_aura_buff:OnAttackLanded(params)
    if params["target"] == self:GetParent() and params["damage_type"] == DAMAGE_TYPE_PHYSICAL then
        -- for k,v in pairs(params) do
        --     print(k, v)
        -- end
        -- get damage done
        self.target_armour = params["target"]:GetPhysicalArmorValue()
        self.armour_constant = 0.06        --constant is 0.06 in dota but 0.01 in teve. change value to 0.01 once teve armour is implemented
        self.damage_mult = 1 - (self.armour_constant * self.target_armour / (1 + (self.armour_constant * self.target_armour)))
        self.total_damage = params["damage"] * self.damage_mult
        -- deal % back to attacker
        self.return_pct = self:GetAbility():GetLevel() * 0.03
        self.return_damage = self.return_pct * self.total_damage
        
        local damage = {
            attacker = self:GetCaster(),
            victim = params["attacker"],
            damage = self.return_damage,
            damage_type = DAMAGE_TYPE_PHYSICAL,
            ability = self:GetAbility()
        }

        ApplyDamage( damage )
    end
end