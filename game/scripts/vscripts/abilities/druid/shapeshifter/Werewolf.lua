teve_druid_shapeshifter_werewolf = class({})
LinkLuaModifier( "modifier_teve_druid_shapeshifter_werewolf", "abilities/druid/shapeshifter/modifier_teve_druid_shapeshifter_werewolf", LUA_MODIFIER_MOTION_NONE )

function teve_druid_shapeshifter_werewolf:OnSpellStart()
    print("Wearwolf from Lua!")
end

function teve_druid_shapeshifter_werewolf:OnChannelFinish(interrupted)
    if interrupted then
        --TODO: put more shit here
        return
    end
    if self:GetCaster():HasModifier("modifier_teve_druid_shapeshifter_werewolf") then
        --Removing werewolf, going back to human.
        self:GetCaster():RemoveModifierByName("modifier_teve_druid_shapeshifter_werewolf")
        return
    elseif self:GetCaster():HasModifier("modifier_teve_druid_shapeshifter_werebear") then
        --Removing werebear, going to werewolf
        self:GetCaster():RemoveModifierByName("modifier_teve_druid_shapeshifter_werebear")
    end
    --We might have been human or werebear, who cares we are werewolf now.
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_teve_druid_shapeshifter_werewolf", {})
end

function teve_druid_shapeshifter_werewolf:GetChannelTime()
    return 6 - self:GetLevel()
end

function teve_druid_shapeshifter_werewolf:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_4
end