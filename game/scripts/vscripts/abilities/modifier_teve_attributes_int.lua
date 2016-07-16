modifier_teve_attributes_int = class({})

function modifier_teve_attributes_int:OnCreated( kv )
	if IsServer() then
		self:GetParent():CalculateStatBonus()
	end
end
function modifier_teve_attributes_int:OnRefresh( kv )
	if IsServer() then
		self:GetParent():CalculateStatBonus()
	end
end
function modifier_teve_attributes_int:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MANA_BONUS,
        MODIFIER_PROPERTY_MANA_REGEN_PERCENTAGE,
        MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE
	}
	return funcs
end

function modifier_teve_attributes_int:GetModifierManaBonus(params)
    return 2*self:GetStackCount() --Dota gives 13 mana per int, TEvE gives 15, so two per int will make them compatible.
end

function modifier_teve_attributes_int:GetModifierPercentageManaRegen(params)
    return 0 - (0.03*self:GetStackCount()) -- Dota gives 4% mana regen per level, teve gives 1%, taking 3% per level away should make them compatible.
end
function modifier_teve_attributes_int:GetModifierSpellAmplify_Percentage(params)
    print(0 - (0.0625*self:GetStackCount()) .. " Spell Amplifiy Percentage")
    return 0 - (0.0625*self:GetStackCount())
end