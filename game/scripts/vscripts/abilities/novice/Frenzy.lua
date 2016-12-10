teve_novice_frenzy = class({})
LinkLuaModifier( "modifier_teve_novice_frenzy", "abilities/novice/modifier_teve_novice_frenzy", LUA_MODIFIER_MOTION_NONE )

function teve_novice_frenzy:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_teve_novice_frenzy", {duration = 10.0})
end