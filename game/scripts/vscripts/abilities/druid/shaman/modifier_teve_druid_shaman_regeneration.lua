modifier_teve_druid_shaman_regeneration = class ({})

function modifier_teve_druid_shaman_regeneration:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
    }
    return funcs
end

function modifier_teve_druid_shaman_regeneration:GetModifierConstantManaRegen ( params )
    --30 total mana / 15 seconds
    return (30/15) * self:GetAbility():GetLevel()
end

function modifier_teve_druid_shaman_regeneration:GetModifierConstantHealthRegen ( params )
    --100 total health / 15 seconds
    return (100/15) * self:GetAbility():GetLevel()
end