teve_druid_archdruid_twister = class({})

function teve_druid_archdruid_twister:OnSpellStart()
    print("twister from Lua!")
end

function teve_druid_archdruid_twister:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_1
end