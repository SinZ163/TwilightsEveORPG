modifier_teve_druid_summoner_regeneration = class ({})

function modifier_teve_druid_summoner_regeneration:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
    }
    return funcs
end

function modifier_teve_druid_summoner_regeneration:GetModifierConstantManaRegen ( params )
    --600 total mana / 5 seconds
    return (600/5) * self:GetAbility():GetLevel()
end

function modifier_teve_druid_summoner_regeneration:GetModifierConstantHealthRegen ( params )
    --400 total health / 5 seconds
    return (400/5) * self:GetAbility():GetLevel()
end