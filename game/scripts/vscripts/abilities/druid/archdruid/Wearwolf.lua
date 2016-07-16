teve_druid_archdruid_wearwolf = class({})

function teve_druid_archdruid_wearwolf:OnSpellStart()
    print("Wearwolf from Lua!")
end
function teve_druid_archdruid_wearwolf:GetChannelTime()
    return 6 - self:GetLevel()
end
function teve_druid_archdruid_wearwolf:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_2
end