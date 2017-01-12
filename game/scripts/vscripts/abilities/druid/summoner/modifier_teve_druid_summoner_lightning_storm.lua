modifier_teve_druid_summoner_lightning_storm = class({})

function modifier_teve_druid_summoner_lightning_storm:OnCreated( kv )
    self.lightning_storm_damage = 700 * self:GetAbility():GetLevel()
    self.tick_rate = 0.1
    self.iter = 0

    if IsServer() then
        self:StartIntervalThink( self.tick_rate )
        EmitSoundOn("Hero_Razor.Storm.Loop", self:GetParent() )
    end
end

function modifier_teve_druid_summoner_lightning_storm:OnIntervalThink()
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
            local vTarget = self:GetParent():GetOrigin()

            for x=1,10 do
                local nFXIndex = ParticleManager:CreateParticle( "particles/hero/druid/summoner/summoner_lightning_storm.vpcf", PATTACH_WORLDORIGIN, self:GetCaster() )
                ParticleManager:SetParticleControl( nFXIndex, 0, self:GetParent():GetOrigin() + Vector(0, 0, 800)  )
                ParticleManager:SetParticleControl( nFXIndex, 1, self:GetParent():GetOrigin() + RandomVector( 250 ) )
                ParticleManager:ReleaseParticleIndex( nFXIndex )
                EmitSoundOnLocationWithCaster( vTarget, "Hero_Zuus.GodsWrath.Target", self:GetCaster() )
            end
        end

        self.iter = self.iter + 1
    end
end

function modifier_teve_druid_summoner_lightning_storm:OnDestroy()
    StopSoundOn("Hero_Razor.Storm.Loop", self:GetParent() )
end    