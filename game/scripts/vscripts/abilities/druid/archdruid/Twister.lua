teve_druid_archdruid_twister = class({})

function teve_druid_archdruid_twister:OnSpellStart()
    print("twister from Lua!")
    self.archdruid_twister_speed = 1000
    self.archdruid_twister_width_initial = 150
    self.archdruid_twister_width_end = 200
    self.archdruid_twister_distance = 600
    self.archdruid_twister_damage = 100 * self:GetLevel()

   

  
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

    self.archdruid_twister_speed = self.archdruid_twister_speed * ( self.archdruid_twister_distance / ( self.archdruid_twister_distance - self.archdruid_twister_width_initial ) )

    local info = {
        EffectName = "particles/units/heroes/hero_invoker/invoker_tornado.vpcf",
        Ability = self,
        vSpawnOrigin = self:GetCaster():GetOrigin(),
        fStartRadius = self.archdruid_twister_width_initial,
        fEndRadius = self.archdruid_twister_width_end,
        vVelocity = vDirection * self.archdruid_twister_speed,
        fDistance = self.archdruid_twister_distance,
        Source = self:GetCaster(),
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
    }

    ProjectileManager:CreateLinearProjectile ( info )
    
    EmitSoundOn ( "Hero_Invoker.Tornado.Cast", self:GetCaster() )
end

function teve_druid_archdruid_twister:OnProjectileHit ( hTarget, vLocation )
    if hTarget ~= nil and ( not hTarget:IsMagicImmune() ) and ( not hTarget:IsInvulnerable() ) then
        local damage = {
            victim = hTarget,
            attacker = self:GetCaster(),
            damage = self.archdruid_twister_damage,
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

function teve_druid_archdruid_twister:GetManaCost(level)
    if level == -1 then
        level = self:GetLevel()
    end
  
    return 60 + (20 * level )
end 
  
function teve_druid_archdruid_twister:GetCastAnimation()
    return ACT_DOTA_CAST_ABILITY_1
end