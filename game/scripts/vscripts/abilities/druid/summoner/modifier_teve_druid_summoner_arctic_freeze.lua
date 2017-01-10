modifier_teve_druid_summoner_arctic_freeze = class ({})      

function modifier_teve_druid_summoner_arctic_freeze:OnCreated()
    local caster = self:GetCaster()
    local hTarget = self:GetParent():GetAbsOrigin()

    local nFXIndex = ParticleManager:CreateParticle( "particles/units/heroes/hero_crystalmaiden/maiden_frostbite_buff.vpcf", PATTACH_POINT_FOLLOW, self:GetParent() )
    ParticleManager:SetParticleControlEnt( nFXIndex, 0, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", hTarget, true)
    self:AddParticle( nFXIndex, false, false, -1, false, false)
end 

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