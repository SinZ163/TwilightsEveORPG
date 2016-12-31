teve_druid_summoner_tornado = class({})

function teve_druid_summoner_tornado:OnSpellStart()
    print("Tornado from Lua!")
    self.summoner_tornado_speed = 1000
    self.summoner_tornado_width_initial = 150
    self.summoner_tornado_width_end = 200
    self.summoner_tornado_distance = 500
    self.summoner_tornado_damage = 1200 * self:GetLevel()

   

  
    --Do we want unit targetting??? nope
    local vPos = nil
    if self:GetCursorTarget() then
        vPos = self:GetCursorTarget():GetOrigin()
    else
        vPos = self:GetCursorPosition() 
    end

    local vDirection = vPos - self:GetCaster():GetOrigin()
    vDirection.z = 0.0
    vDirection = vDirection:Normalized()

    self.summoner_tornado_speed = self.summoner_tornado_speed * ( self.summoner_tornado_distance / ( self.summoner_tornado_distance - self.summoner_tornado_width_initial ) )

    local info = {
        EffectName = "particles/units/heroes/hero_invoker/invoker_tornado.vpcf",
        Ability = self,
        vSpawnOrigin = self:GetCaster():GetOrigin(),
        fStartRadius = self.summoner_tornado_width_initial,
        fEndRadius = self.summoner_tornado_width_end,
        vVelocity = vDirection * self.summoner_tornado_speed,
        fDistance = self.summoner_tornado_distance,
        Source = self:GetCaster(),
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
    }

    ProjectileManager:CreateLinearProjectile ( info )
    
    EmitSoundOn ( "Hero_Invoker.Tornado.Cast", self:GetCaster() )
end

function teve_druid_summoner_tornado:OnProjectileHit ( hTarget, vLocation )
    if hTarget ~= nil and ( not hTarget:IsMagicImmune() ) and ( not hTarget:IsInvulnerable() ) then
        local damage = {
            victim = hTarget,
            attacker = self:GetCaster(),
            damage = self.summoner_tornado_damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            ability = self
        }    

        ApplyDamage( damage )

        local vDirection = vLocation - self:GetCaster():GetOrigin()
        vDirection.z = 0.0
        vDirection = vDirection:Normalized()
    end

    return false
end        

function teve_druid_summoner_tornado:GetManaCost(level)
    if level == -1 then
        level = self:GetLevel()
    end
  
    return 200 * level
end 
  
function teve_druid_summoner_tornado:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_1
end