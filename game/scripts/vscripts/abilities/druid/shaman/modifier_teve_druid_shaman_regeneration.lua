modifier_teve_druid_shaman_regeneration = class ({})

function modifier_teve_druid_shaman_regeneration:OnCreated( kv )

    local caster = self:GetCaster()
    local hTarget = self:GetParent():GetAbsOrigin()

    local nFXIndex = ParticleManager:CreateParticle( "particles/hero/druid/shaman/shamanregeneration.vpcf", PATTACH_POINT_FOLLOW, self:GetParent() )
    ParticleManager:SetParticleControlEnt( nFXIndex, 0, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", hTarget, true)
    ParticleManager:SetParticleControlEnt( nFXIndex, 9, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", hTarget, true)

    self:AddParticle( nFXIndex, false, false, -1, false, false)
end 

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