
FBWP.IMPORT_BASE(SWEP,"weapon_fb_base") /// Same thing as SWEP.Base but not broken (SWEP.Base merge's tables, this overwrites.)

SWEP.PrintName = "Fast Magnum"






SWEP.Author			= "FreezeBug"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
//SWEP.FeatureSet = bit.band(FBWP_FEATURE_IRONSIGNTS,FBWP_FEATURE)

SWEP.UseAmmo = true

SWEP.Spawnable			= true
SWEP.AdminOnly			= true

SWEP.Weight				= 5			-- Decides whether we should switch from/to this
SWEP.AutoSwitchTo		= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom		= true		-- Auto switch from if you pick up a better weapon

SWEP.KnockbackFactor = 150
SWEP.HasIronSights = false

SWEP.ReloadSpeed = 2

SWEP.Primary.ClipSize		= 6				-- Size of a clip
SWEP.Primary.DefaultClip	= 1000			-- Default number of bullets in a clip
SWEP.Primary.Automatic		= true			-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "357"
SWEP.Primary.Delay = 0.1
SWEP.Primary.Sounds = {"weapons/357_fire2.wav"}
SWEP.Primary.EmptySound = ""
SWEP.Primary.Damage = 50
SWEP.Primary.NumPerShot = 1
SWEP.Primary.Cone = Vector(0)


SWEP.Secondary.Has = false
//SWEP.Secondary.ClipSize		= 8					-- Size of a clip
//SWEP.Secondary.DefaultClip	= 999999			-- Default number of bullets in a clip
//SWEP.Secondary.Automatic	= false				-- Automatic/Semi Auto
//SWEP.Secondary.Ammo			= "Pistol"
//SWEP.Secondary.Delay = 0.3
//SWEP.Secondary.Sounds = {}
//SWEP.Secondary.EmptySound = ""
//SWEP.Secondary.Damage = 40
//SWEP.Secondary.NumPerShot = 10
//SWEP.Secondary.Cone = Vector(0,0,0)

SWEP.IronSightsPos = Vector(-12.351, 0, -0.88)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.Slot = 3 
SWEP.SlotPos = 4
SWEP.IronTime = 0.25
SWEP.IronInSounds = {}
SWEP.IronOutSounds = {}

SWEP.HoldType = "revolver"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/v_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {

}

SWEP.VElements = {

}
SWEP.WElements = {
	
}

SWEP.AltFireMode = false 






function SWEP:PrimaryAttack()
	
	if ( !self:CanPrimaryAttack() ) then return end
	self.AltFireMode = not self.AltFireMode
	local snd = table.Random(self.Primary.Sounds) or ""
	if SERVER then 
		sound.Play(snd,self.Weapon:GetPos(),100,100,1)
	end 

	self:ShootBullet(self.Primary.Damage,self.Primary.NumPerShot,self.Primary.Cone)

	if self.UseAmmo then 
		self:TakePrimaryAmmo(1)
	end
	
	self:DoPrimaryViewPunch()

	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay )
	if SERVER then 
		self.Owner:SetVelocity( self.Owner:GetAimVector() * -self.KnockbackFactor )
	end

end 

function SWEP:SecondaryAttack()

	self:PrimaryAttack()

end 

function SWEP:Reload()
 
	if self.ReloadingTime and CurTime() <= self.ReloadingTime then return end
 	
	if self.UseAmmo and ( self:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 ) then
                
                self:SendWeaponAnim( ACT_VM_RELOAD )
                 self.Owner:SetAnimation(PLAYER_RELOAD)
                if SERVER then 
                     self:SetPlaybackRate( self.ReloadSpeed )
                     
                     self.Owner:GetViewModel():SetPlaybackRate( self.ReloadSpeed )
                     self.Owner:SetPlaybackRate( self.ReloadSpeed )
                end
                    self.Owner:SetPlaybackRate( self.ReloadSpeed )
               
		         
                self.Reloading = true 
                local AnimationTime = self.Owner:GetViewModel():SequenceDuration() / self.ReloadSpeed
                self.ReloadingTime = CurTime() + AnimationTime
                self:SetNextPrimaryFire(CurTime() + AnimationTime)
                self:SetNextSecondaryFire(CurTime() + AnimationTime)
 
	end
 
end






function SWEP:OnReloaded()
  if SERVER then 
                 self:SetPlaybackRate( 1 )
                 self.Owner:GetViewModel():SetPlaybackRate( 1 )
    end
end

function SWEP:ThinkFirst()
    if self.Reloading==true then
        if CurTime() > self.ReloadingTime then 
            self.Reloading = false 
            self.Owner:RemoveAmmo(  self.Primary.ClipSize - self:Clip1() , self.Weapon:GetPrimaryAmmoType() )
            self:SetClip1(self.Primary.ClipSize)
        end
    
    end

end

function SWEP:ShootEffects()

	self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK ) 		-- View model animation
	self.Owner:MuzzleFlash()								-- Crappy muzzle light
	self.Owner:SetAnimation( PLAYER_ATTACK1 )				-- 3rd Person Animation

end

