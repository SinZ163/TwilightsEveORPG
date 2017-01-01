modifier_teve_druid_shaman_lightning_storm = class({})

function modifier_teve_druid_shaman_lightning_storm:OnCreated( kv )
    self.lightning_storm_damage = 40 * self:GetAbility():GetLevel()
    self.tick_rate = 0.1
    self.iter = 0

    if IsServer() then
        self:StartIntervalThink( self.tick_rate )
    end
end

function modifier_teve_druid_shaman_lightning_storm:OnIntervalThink()
    if IsServer() then
        if self.iter > 13 and self.iter % 4 == 0 then     --trigger if 1.3 seconds have passed and it is an interval of 0.4 for the damage

            local enemies = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetOrigin(), self:GetParent(), 350, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false )
            if #enemies > 0 then
                for _,enemy in pairs(enemies) do
                    if enemy ~= nil and ( not enemy:IsMagicImmune() ) and ( not enemy:IsInvulnerable() ) then

                        local damage = {
                            attacker = self:GetCaster(),
                            victim = enemy,
                            damage = self.lightning_storm_damage,
                            damage_type = DAMAGE_TYPE_MAGICAL,
                            ability = self:GetAbility()        
                        }

                        ApplyDamage( damage )
                        --EmitSoundOn ()
                    end
                end 
            end
        end

        self.iter = self.iter + 1
        --local nFXIndex = I'll do this later
    end
end
