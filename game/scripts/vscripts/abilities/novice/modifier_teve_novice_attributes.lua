modifier_teve_novice_attributes = class({})

function modifier_teve_novice_attributes:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS  
    }
    return funcs
end

function modifier_teve_novice_attributes:GetModifierBonusStats_Strength(params)
    return self:GetAbility():GetLevel() * 2
end
function modifier_teve_novice_attributes:GetModifierBonusStats_Agility(params)
    return self:GetAbility():GetLevel() * 2
end
function modifier_teve_novice_attributes:GetModifierBonusStats_Intellect(params)
    return self:GetAbility():GetLevel() * 2
end