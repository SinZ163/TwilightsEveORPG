teve_druid_archdruid_thunderstorm = class({})

function teve_druid_archdruid_thunderstorm:OnSpellStart()
    print("Thunderstorm from Lua!")
end

function teve_druid_archdruid_thunderstorm:GetAOERadius()
    return 350
end

function teve_druid_archdruid_thunderstorm:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_4
end