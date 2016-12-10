modifier_teve_novice_frenzy = class({})

function modifier_teve_novice_frenzy:DeclareFunctions()
	local funcs = {
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
	}
	return funcs
end

function modifier_teve_novice_frenzy:GetEffectName()
    return "particles/items2_fx/mask_of_madness.vpcf"
end
function modifier_teve_novice_frenzy:GetEffectAttachType()
    return "follow_hitloc"
end

function modifier_teve_novice_frenzy:GetModifierAttackSpeedBonus_Constant(params)
    return 20 * (self:GetAbility():GetLevel() + 1)
end
function modifier_teve_novice_frenzy:GetModifierMoveSpeedBonus_Percentage(params)
    return 20
end