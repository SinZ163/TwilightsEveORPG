modifier_teve_druid_runemaster_feral_rage = class ({})

function modifier_teve_druid_runemaster_feral_rage:OnCreated( kv )
    self.feral_rage_damage = 500 * self:GetAbility():GetLevel()
end    

function modifier_teve_druid_runemaster_feral_rage:OnRefresh ( kv )
    self.feral_rage_damage = 500 * self:GetAbility():GetLevel()
end

function modifier_teve_druid_runemaster_feral_rage:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE
}
    return funcs
end

function modifier_teve_druid_runemaster_feral_rage:GetModifierPreAttack_BonusDamage( params )
    return 500 * self:GetAbility():GetLevel()
end