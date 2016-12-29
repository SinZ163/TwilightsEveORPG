modifier_teve_druid_shapeshifter_werebear = class({})

function modifier_teve_druid_shapeshifter_werebear:OnCreated(kv)
    if IsServer() then
        self:GetCaster():SetAttackCapability(DOTA_UNIT_CAP_MELEE_ATTACK)
    end
end

function modifier_teve_druid_shapeshifter_werebear:OnDestroy(kv)
    if IsServer() then
        self:GetCaster():SetAttackCapability(DOTA_UNIT_CAP_RANGED_ATTACK)
    end
end

function modifier_teve_druid_shapeshifter_werebear:DeclareFunctions()
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

function modifier_teve_druid_shapeshifter_werebear:GetModifierModelChange()
    return "models/items/lone_druid/bear/spirit_of_the_atniw/spirit_of_the_atniw.vmdl"
end

function modifier_teve_druid_shapeshifter_werebear:GetModifierMoveSpeedOverride(params)
    return 340
end

function modifier_teve_druid_shapeshifter_werebear:GetModifierBonusStats_Strength(params)
    --Shapeshifter has 65, we want 80. therefore add 80-65
    return 80-65
end

function modifier_teve_druid_shapeshifter_werebear:GetModifierBonusStats_Agility(params)
    --Shapeshifter has 65, we want 80. therefore add 80-65
    return 80-65
end

function modifier_teve_druid_shapeshifter_werebear:GetModifierBonusStats_Intellect(params)
    --Shapeshifter has 80, we want 100. therefore add 100-80
    return 100-80
end

function modifier_teve_druid_shapeshifter_werebear:GetModifierBaseAttack_BonusDamage(params)
    --Shapeshifter has 210 base damage, we want to end up with 1450 "base" damage
    return 1450-210
end

function modifier_teve_druid_shapeshifter_werebear:GetModifierAttackRangeBonus(params)
    --Shapeshifter has 500 attack range, all our melee heroes have 100 range.
    return 100-500
end

function modifier_teve_druid_shapeshifter_werebear:GetModifierBaseAttackTimeConstant(params)
    return 1.5
end

function modifier_teve_druid_shapeshifter_werebear:GetModifierPhysicalArmorBonus(params)
    --Shapeshifter already has 3 armor, we want 125
    return 125-3
end