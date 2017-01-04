modifier_teve_druid_druid_thorns_aura = class({})

function modifier_teve_druid_druid_thorns_aura:IsAura()
    return true
end

function modifier_teve_druid_druid_thorns_aura:IsHidden()
    return true
end

function modifier_teve_druid_druid_thorns_aura:GetAuraRadius()
    return 500
end

function modifier_teve_druid_druid_thorns_aura:GetModifierAura()
    return "modifier_teve_druid_druid_thorns_aura_buff"
end

-- function modifier_teve_druid_druid_thorns_aura:GetEffectName()
--     return "particles/hero/druid/druid/thorns_aura.vpcf"
-- end

-- function modifier_teve_druid_druid_thorns_aura:GetEffectAttachType()
--     return PATTACH_ABSORIGIN_FOLLOW
-- end
   
function modifier_teve_druid_druid_thorns_aura:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_teve_druid_druid_thorns_aura:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end