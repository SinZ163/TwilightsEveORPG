modifier_teve_druid_summoner_regeneration = class ({})

function modifier_teve_druid_summoner_regeneration:OnCreated( kv )

    local caster = self:GetCaster()
    local hTarget = self:GetParent():GetAbsOrigin()

    local nFXIndex = ParticleManager:CreateParticle( "particles/hero/druid/summoner/summoner_regeneration.vpcf", PATTACH_POINT_FOLLOW, self:GetParent() )
    ParticleManager:SetParticleControlEnt( nFXIndex, 0, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", hTarget, true)
    ParticleManager:SetParticleControlEnt( nFXIndex, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", hTarget, true)

    self:AddParticle( nFXIndex, false, false, -1, false, false)
end

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