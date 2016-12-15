teve_druid_archdruid_werebear = class({})
LinkLuaModifier( "modifier_teve_druid_archdruid_werebear", "abilities/druid/archdruid/modifier_teve_druid_archdruid_werebear", LUA_MODIFIER_MOTION_NONE )

function teve_druid_archdruid_werebear:OnSpellStart()
    print("Wearbear from Lua!")
end

function teve_druid_archdruid_werebear:OnChannelFinish(interrupted)
    if interrupted then
        --TODO: put more shit here
        return
    end
    if self:GetCaster():HasModifier("modifier_teve_druid_archdruid_werebear") then
        --Removing werebear, going back to human.
        self:GetCaster():RemoveModifierByName("modifier_teve_druid_archdruid_werebear")
        return
    elseif self:GetCaster():HasModifier("modifier_teve_druid_archdruid_werewolf") then
        --Removing werewolf, going to werebear
        self:GetCaster():RemoveModifierByName("modifier_teve_druid_archdruid_werewolf")
    end
    --We might have been human or werewolf, who cares we are werebear now.
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_teve_druid_archdruid_werebear", {})
end

function teve_druid_archdruid_werebear:GetChannelTime()
    return 6 - self:GetLevel()
end

function teve_druid_archdruid_werebear:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_2
end