teve_druid_archdruid_wearbear = class({})

function teve_druid_archdruid_wearbear:OnSpellStart()
    print("Wearbear from Lua!")
end

function teve_druid_archdruid_wearbear:GetChannelTime()
    return 6 - self:GetLevel()
end

function teve_druid_archdruid_wearbear:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_2
end