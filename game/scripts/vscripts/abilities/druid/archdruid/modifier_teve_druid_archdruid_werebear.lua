modifier_teve_druid_archdruid_werebear = class({})

function modifier_teve_druid_archdruid_werebear:OnCreated(kv)
    if IsServer() then
        self:GetCaster():SetAttackCapability(DOTA_UNIT_CAP_MELEE_ATTACK)
    end
end

function modifier_teve_druid_archdruid_werebear:OnDestroy(kv)
    if IsServer() then
        self:GetCaster():SetAttackCapability(DOTA_UNIT_CAP_RANGED_ATTACK)
    end
end

function modifier_teve_druid_archdruid_werebear:DeclareFunctions()
	local funcs = {
        MODIFIER_PROPERTY_MODEL_CHANGE,
        MODIFIER_PROPERTY_MOVESPEED_BASE_OVERRIDE,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE,
        MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
        MODIFIER_PROPERTY_BASE_ATTACK_TIME_CONSTANT,
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
	}
	return funcs
end

function modifier_teve_druid_archdruid_werebear:GetModifierModelChange()
    return "models/heroes/lone_druid/true_form.vmdl"
end

function modifier_teve_druid_archdruid_werebear:GetModifierMoveSpeedOverride(params)
    return 300
end

function modifier_teve_druid_archdruid_werebear:GetModifierBonusStats_Strength(params)
    return 20
end

function modifier_teve_druid_archdruid_werebear:GetModifierBonusStats_Agility(params)
    return 20
end

function modifier_teve_druid_archdruid_werebear:GetModifierBonusStats_Intellect(params)
    return 20
end

function modifier_teve_druid_archdruid_werebear:GetModifierBaseAttack_BonusDamage(params)
    --ArchDruid has 50 base damage, we want to end up with 800 "base" damage
    return 800-50
end

function modifier_teve_druid_archdruid_werebear:GetModifierAttackRangeBonus(params)
    --ArchDruid has 500 attack range, all our melee heroes have 100 range.
    return 100-500
end

function modifier_teve_druid_archdruid_werebear:GetModifierBaseAttackTimeConstant(params)
    return 1.6
end

function modifier_teve_druid_archdruid_werebear:GetModifierPhysicalArmorBonus(params)
    --ArchDruid already has 2 armor, we want 25
    return 25-2
end