teve_attributes = class({})
LinkLuaModifier( "modifier_teve_attributes_agi", "abilities/modifier_teve_attributes_agi", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_teve_attributes_int", "abilities/modifier_teve_attributes_int", LUA_MODIFIER_MOTION_NONE )


function teve_attributes:OnSpellStart()
    print("###########################")
    print("Attributes Loaded.")
    print("###########################")
end
function teve_attributes:OnHeroCalculateStatBonus()
    print("Stat bonuses changed?!")
    local caster = self:GetCaster()
    local modifier_agi = caster:FindModifierByName("modifier_teve_attributes_agi")
    if modifier_agi == nil then
        modifier_agi = caster:AddNewModifier( self:GetCaster(), self, "modifier_teve_attributes_agi", nil )
    end
    local modifier_int = caster:FindModifierByName("modifier_teve_attributes_int")
    if modifier_int == nil then
        modifier_int = caster:AddNewModifier( self:GetCaster(), self, "modifier_teve_attributes_int", nil )
    end
    
    --Check if its different before setting, and if any are different, calculate stat bonus?
    if modifier_agi:GetStackCount() ~= math.floor(caster:GetAgility()) or modifier_int:GetStackCount() ~= math.floor(caster:GetIntellect()) then
        print("Stack count differs, update!")
        print("Expected AGI: "..modifier_agi:GetStackCount()..", Actual AGI: "..caster:GetAgility())
        print("Expected INT: "..modifier_int:GetStackCount()..", Actual INT: "..caster:GetIntellect())
        modifier_agi:SetStackCount(caster:GetAgility())
        modifier_int:SetStackCount(caster:GetIntellect())
        self:GetCaster():CalculateStatBonus()
    end
end