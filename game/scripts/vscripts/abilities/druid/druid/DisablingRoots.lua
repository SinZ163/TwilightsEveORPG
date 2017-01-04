teve_druid_druid_disabling_roots = class({})
LinkLuaModifier( "modifier_teve_druid_druid_disabling_roots", "abilities/druid/druid/modifier_teve_druid_druid_disabling_roots", LUA_MODIFIER_MOTION_NONE )

function teve_druid_druid_disabling_roots:OnSpellStart()
    print("Disabling Roots from Lua!")

    local hTarget = self:GetCursorTarget()

    local kv = {
        duration = math.ceil(self:GetLevel() / 2)   -- +1 second every 2 levels
    }

    hTarget:AddNewModifier( self:GetCaster(), self, "modifier_teve_druid_druid_disabling_roots", kv )
end

function teve_druid_druid_disabling_roots:CastFilterResultTarget( hTarget )
    local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, self:GetTeamNumber() )
    if nResult ~= UF_SUCCESS then
        return nResult
    end

    return UF_SUCCESS
end

function teve_druid_druid_disabling_roots:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_3
end

function teve_druid_druid_disabling_roots:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 40 + (20 * level)
end
