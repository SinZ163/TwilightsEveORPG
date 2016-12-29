modifier_teve_town_firstjob_aura_effect = class({})
function modifier_teve_town_firstjob_aura_effect:OnCreated(kv)
    if IsServer() then
        CustomGameEventManager:Send_ServerToPlayer(self:GetParent():GetPlayerOwner(), "teve_town_firstjob_spawn", {})
    end
end

function modifier_teve_town_firstjob_aura_effect:OnDestroy()
    if IsServer() then
        CustomGameEventManager:Send_ServerToPlayer(self:GetParent():GetPlayerOwner(), "teve_town_firstjob_death", {})
    end
end