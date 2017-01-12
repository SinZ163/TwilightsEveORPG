teve_druid_runemaster_feral_rage = class({})
LinkLuaModifier( "modifier_teve_druid_runemaster_feral_rage", "abilities/druid/runemaster/modifier_teve_druid_runemaster_feral_rage", LUA_MODIFIER_MOTION_NONE )

function teve_druid_runemaster_feral_rage:OnSpellStart()
    local feral_rage_duration = 10
    self:GetCaster():AddNewModifier( self:GetCaster(), self, "modifier_teve_druid_runemaster_feral_rage", { duration = feral_rage_duration } )

    if self:GetCaster():HasModifier("modifier_teve_druid_runemaster_werebear") then
        EmitSoundOn("Hero_LoneDruid.SavageRoar.Cast", self:GetCaster())
    elseif self:GetCaster():HasModifier("modifier_teve_druid_runemaster_werewolf") then
    	EmitSoundOn("Hero_Lycan.Howl", self:GetCaster())
    else
    	EmitSoundOn("Hero_Beastmaster.Primal_Roar", self:GetCaster())
    end
end

function teve_druid_runemaster_feral_rage:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 200 * level
end