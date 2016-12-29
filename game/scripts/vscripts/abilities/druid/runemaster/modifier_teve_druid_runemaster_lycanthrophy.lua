modifier_teve_druid_runemaster_lycanthrophy = class({})

function modifier_teve_druid_runemaster_lycanthrophy:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
    }
    return funcs
end

function modifier_teve_druid_runemaster_lycanthrophy:GetModifierAttackSpeedBonus_Constant(params)
    return 4 * self:GetAbility():GetLevel()
end    

function modifier_teve_druid_runemaster_lycanthrophy:GetModifierMoveSpeedBonus_Percentage(params)
    return math.floor((self:GetAbility():GetLevel() + 9) / 10) * 4
end