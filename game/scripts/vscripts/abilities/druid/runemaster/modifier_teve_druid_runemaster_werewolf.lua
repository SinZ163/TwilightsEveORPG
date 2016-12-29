modifier_teve_druid_runemaster_werewolf = class({})

function modifier_teve_druid_runemaster_werewolf:OnCreated(kv)
    if IsServer() then
        self:GetCaster():SetAttackCapability(DOTA_UNIT_CAP_MELEE_ATTACK)
    end
end

function modifier_teve_druid_runemaster_werewolf:OnDestroy(kv)
    if IsServer() then
        self:GetCaster():SetAttackCapability(DOTA_UNIT_CAP_RANGED_ATTACK)
    end
end

function modifier_teve_druid_runemaster_werewolf:DeclareFunctions()
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

function modifier_teve_druid_runemaster_werewolf:GetModifierModelChange()
    return "models/heroes/lycan/lycan_wolf.vmdl"
end

function modifier_teve_druid_runemaster_werewolf:GetModifierMoveSpeedOverride(params)
    return 460
end

function modifier_teve_druid_runemaster_werewolf:GetModifierBonusStats_Strength(params)
    --Runemaster has 80, we want 120. therefore add 120-80
    return 120-80
end

function modifier_teve_druid_runemaster_werewolf:GetModifierBonusStats_Agility(params)
    --Runemaster has 80, we want 120. therefore add 120-80
    return 120-80
end

function modifier_teve_druid_runemaster_werewolf:GetModifierBonusStats_Intellect(params)
    --Runemaster has 100, we want 150. therefore add 150-100
    return 150-100
end

function modifier_teve_druid_runemaster_werewolf:GetModifierBaseAttack_BonusDamage(params)
    --Runemaster has 635 base damage, we want to end up with 16000 "base" damage
    return 16000-635
end

function modifier_teve_druid_runemaster_werewolf:GetModifierAttackRangeBonus(params)
    --Runemaster has 500 attack range, all our melee heroes have 100 range.
    return 100-500
end

function modifier_teve_druid_runemaster_werewolf:GetModifierBaseAttackTimeConstant(params)
    return 0.8
end

function modifier_teve_druid_runemaster_werewolf:GetModifierPhysicalArmorBonus(params)
    --Runemaster already has 5 armor, we want 1500
    return 1000-5
end