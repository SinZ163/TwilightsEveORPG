modifier_teve_druid_runemaster_werebear = class({})

function modifier_teve_druid_runemaster_werebear:OnCreated(kv)
    if IsServer() then
        self:GetCaster():SetAttackCapability(DOTA_UNIT_CAP_MELEE_ATTACK)
    end
end

function modifier_teve_druid_runemaster_werebear:OnDestroy(kv)
    if IsServer() then
        self:GetCaster():SetAttackCapability(DOTA_UNIT_CAP_RANGED_ATTACK)
    end
end

function modifier_teve_druid_runemaster_werebear:DeclareFunctions()
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

function modifier_teve_druid_runemaster_werebear:GetModifierModelChange()
    return "models/heroes/lone_druid/spirit_bear.vmdl"
end

function modifier_teve_druid_runemaster_werebear:GetModifierMoveSpeedOverride(params)
    return 380
end

function modifier_teve_druid_runemaster_werebear:GetModifierBonusStats_Strength(params)
    --Runemaster has 80, we want 120. therefore add 120-80
    return 120-80
end

function modifier_teve_druid_runemaster_werebear:GetModifierBonusStats_Agility(params)
    --Runemaster has 80, we want 120. therefore add 120-80
    return 120-80
end

function modifier_teve_druid_runemaster_werebear:GetModifierBonusStats_Intellect(params)
    --Runemaster has 100, we want 150. therefore add 150-100
    return 150-100
end

function modifier_teve_druid_runemaster_werebear:GetModifierBaseAttack_BonusDamage(params)
    --Runemaster has 635 base damage, we want to end up with 20000 "base" damage
    return 20000-635
end

function modifier_teve_druid_runemaster_werebear:GetModifierAttackRangeBonus(params)
    --Runemaster has 500 attack range, all our melee heroes have 100 range.
    return 100-500
end

function modifier_teve_druid_runemaster_werebear:GetModifierBaseAttackTimeConstant(params)
    return 1.4
end

function modifier_teve_druid_runemaster_werebear:GetModifierPhysicalArmorBonus(params)
    --Runemaster already has 5 armor, we want 1500
    return 1500-5
end