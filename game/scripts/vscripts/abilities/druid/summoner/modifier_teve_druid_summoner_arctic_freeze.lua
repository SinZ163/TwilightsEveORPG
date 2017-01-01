modifier_teve_druid_summoner_arctic_freeze = class ({})      

function modifier_teve_druid_summoner_arctic_freeze:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
    }
    return funcs
end

function modifier_teve_druid_summoner_arctic_freeze:GetModifierAttackSpeedBonus_Constant(params)
    return -10
end

function modifier_teve_druid_summoner_arctic_freeze:GetModifierMoveSpeedBonus_Percentage(params)
    return -20
end

function modifier_teve_druid_summoner_arctic_freeze:IsDebuff()
    return true
end