modifier_teve_druid_archdruid_thunderstorm_thinker = class({})

function modifier_teve_druid_archdruid_thunderstorm_thinker:OnCreated( kv )
	self.thunderstorm_damage = 20 * self:GetAbility():GetLevel()
	self.tick_rate = 0.4

	if IsServer() then
		self:StartIntervalThink( self.tick_rate )
	end
end

function modifier_teve_druid_archdruid_thunderstorm_thinker:OnIntervalThink()
	if IsServer() then
		local enemies = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetOrigin(), self:GetParent(), 350, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false )
		if #enemies > 0 then
			for _,enemy in pairs(enemies) do
				if enemy ~= nil and ( not enemy:IsMagicImmune() ) and ( not enemy:IsInvulnerable() ) then

		            local damage = {
		                attacker = self:GetCaster(),
		                victim = enemy,
		                damage = self.thunderstorm_damage,
                        damage_type = DAMAGE_TYPE_MAGICAL,
                        ability = self:GetAbility()        
                    }

                    ApplyDamage( damage )
                    --EmitSoundOn ()
	            end
            end	
        end
        --local nFXIndex = I'll do this later
    end
end    