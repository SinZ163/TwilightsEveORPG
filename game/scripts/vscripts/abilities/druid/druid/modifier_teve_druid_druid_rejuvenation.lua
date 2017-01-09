modifier_teve_druid_druid_rejuvenation = class ({})

function modifier_teve_druid_druid_rejuvenation:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
    }
    return funcs
end

function modifier_teve_druid_druid_rejuvenation:GetModifierConstantHealthRegen ( params )
    --100 total health / 15 seconds
    return (100 / 15) * self:GetAbility():GetLevel()
end

function modifier_teve_druid_druid_rejuvenation:GetEffectName()
    return "particles/items_fx/healing_tango.vpcf"
end