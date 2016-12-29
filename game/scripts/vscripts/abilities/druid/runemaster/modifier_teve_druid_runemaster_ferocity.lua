modifier_teve_druid_runemaster_ferocity = class({})

function modifier_teve_druid_runemaster_ferocity:OnCreated(kv)
    self.args = {}
    self.args.chance = self:GetAbility():GetLevel()
    self.args.multiplier = 300
end

function modifier_teve_druid_runemaster_ferocity:OnRefresh(kv)
    self.args.chance = self:GetAbility():GetLevel()
    self.args.multiplier = 300
end

function modifier_teve_druid_runemaster_ferocity:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE,
        MODIFIER_PROPERTY_EVASION_CONSTANT
    }
    return funcs
end

function modifier_teve_druid_runemaster_ferocity:GetModifierPreAttack_CriticalStrike(params)
    if IsServer() and RandomInt(1, 100) <= self.args.chance then
        return self.args.multiplier
    else
        return false
    end
end

function modifier_teve_druid_runemaster_ferocity:GetModifierEvasion_Constant(params)
    return math.floor((self:GetAbility():GetLevel() + 9) / 10) * 10
end