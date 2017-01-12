teve_druid_summoner_armageddon = class({})
LinkLuaModifier( "modifier_teve_druid_summoner_armageddon", "abilities/druid/summoner/modifier_teve_druid_summoner_armageddon", LUA_MODIFIER_MOTION_NONE )

function teve_druid_summoner_armageddon:OnSpellStart()
    print("ARMAGEDDON!!!!")
    local kv = {
    	duration = 5
    }
    local armageddon_damage = self:GetLevel() * 3000

    local enemies = FindUnitsInRadius( self:GetCaster():GetTeamNumber(), self:GetCursorPosition(), self:GetCaster(), self:GetAOERadius(), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false )
    if #enemies > 0 then
        for _, enemy in pairs(enemies) do
            if enemy ~= nil and ( not enemy:IsInvulnerable() ) then
                local damage = {
                    victim = enemy,
                    attacker = self:GetCaster(),
                    damage = armageddon_damage,
                    damage_type = DAMAGE_TYPE_PURE,
                    ability = self
                }
                ApplyDamage( damage )
                enemy:AddNewModifier( self:GetCaster(), self, "modifier_teve_druid_summoner_armageddon", kv )
            end
        end
    end
    self.aoe = self:GetAOERadius()
    self.target = self:GetCursorPosition()
    local nFXIndex = ParticleManager:CreateParticle( "particles/hero/druid/summoner/summoner_armageddon.vpcf", PATTACH_CUSTOMORIGIN, nil)
    ParticleManager:SetParticleControl( nFXIndex, 0, self.target )
    ParticleManager:SetParticleControl( nFXIndex, 4, Vector(self.aoe, 1, 1) )
    ParticleManager:ReleaseParticleIndex( nFXIndex )
    EmitSoundOnLocationWithCaster( self.target, "Hero_OgreMagi.Fireblast.Target", self:GetCaster() )
end

function teve_druid_summoner_armageddon:GetAOERadius()
    return 600
end

function teve_druid_summoner_armageddon:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_4
end

function teve_druid_summoner_armageddon:GetManaCost(level)

    if level == -1 then
        level = self:GetLevel()
    end

    return 250 * level
end