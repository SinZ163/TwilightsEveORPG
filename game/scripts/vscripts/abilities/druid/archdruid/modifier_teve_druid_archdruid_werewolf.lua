modifier_teve_druid_archdruid_werewolf = class({})

function modifier_teve_druid_archdruid_werewolf:OnCreated(kv)
    if IsServer() then
        self:GetCaster():SetAttackCapability(DOTA_UNIT_CAP_MELEE_ATTACK)
    end
end

function modifier_teve_druid_archdruid_werewolf:OnDestroy(kv)
    if IsServer() then
        self:GetCaster():SetAttackCapability(DOTA_UNIT_CAP_RANGED_ATTACK)
    end
end

function modifier_teve_druid_archdruid_werewolf:DeclareFunctions()
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

function modifier_teve_druid_archdruid_werewolf:GetModifierModelChange()
    return "models/heroes/lycan/summon_wolves.vmdl"
end

function modifier_teve_druid_archdruid_werewolf:GetModifierMoveSpeedOverride(params)
    return 380
end

function modifier_teve_druid_archdruid_werewolf:GetModifierBonusStats_Strength(params)
    return 20
end

function modifier_teve_druid_archdruid_werewolf:GetModifierBonusStats_Agility(params)
    return 20
end

function modifier_teve_druid_archdruid_werewolf:GetModifierBonusStats_Intellect(params)
    return 20
end

function modifier_teve_druid_archdruid_werewolf:GetModifierBaseAttack_BonusDamage(params)
    --ArchDruid has 50 base damage, we want to end up with 500 "base" damage
    return 500-50
end

function modifier_teve_druid_archdruid_werewolf:GetModifierAttackRangeBonus(params)
    --ArchDruid has 500 attack range, all our melee heroes have 100 range.
    return 100-500
end

function modifier_teve_druid_archdruid_werewolf:GetModifierBaseAttackTimeConstant(params)
    return 1.5
end

function modifier_teve_druid_archdruid_werewolf:GetModifierPhysicalArmorBonus(params)
    --ArchDruid already has 2 armor, we want 5
    return 5-2
end