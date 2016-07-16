modifier_teve_attributes_agi = class({})

function modifier_teve_attributes_agi:OnCreated( kv )
	if IsServer() then
		self:GetParent():CalculateStatBonus()
	end
end
function modifier_teve_attributes_agi:OnRefresh( kv )
	if IsServer() then
		self:GetParent():CalculateStatBonus()
	end
end
function modifier_teve_attributes_agi:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT 
	}
	return funcs
end

function modifier_teve_attributes_agi:GetModifierAttackSpeedBonus_Constant(params)
    return 0 - self:GetStackCount() --Dota gives 1 attackspeed per agi, TEvE doesn't so we subtract 1 per agi.
end
function modifier_teve_attributes_agi:GetModifierPhysicalArmorBonus(params)
    return (self:GetStackCount() / 12) - (self:GetStackCount() / 7) --Dota gives 1 armor per 7, we give 1 armor per 12, so we subtract dotas, and add ours.
end