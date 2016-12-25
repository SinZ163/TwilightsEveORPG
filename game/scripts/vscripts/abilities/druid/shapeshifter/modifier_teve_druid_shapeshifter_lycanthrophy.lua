modifier_teve_druid_shapeshifter_lycanthrophy = class({})

function modifier_teve_druid_shapeshifter_lycanthrophy:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
    }
    return funcs
end

function modifier_teve_druid_shapeshifter_lycanthrophy:GetModifierAttackSpeedBonus_Constant(params)
    return 3 * self:GetAbility():GetLevel()
end    

function modifier_teve_druid_shapeshifter_lycanthrophy:GetModifierMoveSpeedBonus_Percentage(params)
    return math.floor((self:GetAbility():GetLevel() + 19) / 20) * 3
end