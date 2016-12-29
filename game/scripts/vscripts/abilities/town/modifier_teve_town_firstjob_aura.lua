modifier_teve_town_firstjob_aura = class({})

function modifier_teve_town_firstjob_aura:IsAura()
    return true
end

function modifier_teve_town_firstjob_aura:GetModifierAura()
    return "modifier_teve_town_firstjob_aura_effect"
end

function modifier_teve_town_firstjob_aura:GetEffectName()
    return "particles/town/jobadvancement_firstjob_all.vpcf"
end

function modifier_teve_town_firstjob_aura:GetAuraRadius()
    return 200
end

function modifier_teve_town_firstjob_aura:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_teve_town_firstjob_aura:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO
end

function modifier_teve_town_firstjob_aura:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_INVULNERABLE
end