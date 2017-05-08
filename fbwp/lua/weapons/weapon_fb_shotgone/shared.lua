FBWP.IMPORT_BASE(SWEP,"weapon_fb_base") /// Same thing as SWEP.Base but not broken (SWEP.Base merge's tables, this overwrites.)

SWEP.PrintName = "Shotgone"




SWEP.Base = "weapon_base"

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

SWEP.KnockbackFactor = 200
SWEP.HasIronSights = false


SWEP.Primary.ClipSize		= 100				-- Size of a clip
SWEP.Primary.DefaultClip	= 500			-- Default number of bullets in a clip
SWEP.Primary.Automatic		= true			-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"
SWEP.Primary.Delay = 0.1
SWEP.Primary.Sounds = {"weapons/shotgun/shotgun_dbl_fire.wav"}
SWEP.Primary.EmptySound = ""
SWEP.Primary.Damage = 40
SWEP.Primary.NumPerShot = 10
SWEP.Primary.Cone = Vector(0.3 / 4,0.3 / 4,0)


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

SWEP.IronSightsPos = Vector(0, 0, 0)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.IronTime = 0.25
SWEP.IronInSounds = {}
SWEP.IronOutSounds = {}

SWEP.HoldType = "crossbow"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
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
		sound.Play(snd,self.Weapon:GetPos(),90,math.random(95,120),1)
	end 

	//self:ShootBullet(self.Primary.Damage,self.Primary.NumPerShot,self.Primary.Cone)
for I=1,5 do 
	if self.UseAmmo then 
		self:TakePrimaryAmmo(1)
	end
	
	self:DoPrimaryViewPunch()
    self:ShootEffects()
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay )
	if SERVER then 
		self.Owner:SetVelocity( self.Owner:GetAimVector() * -72 )
  local cb = ents.Create("grenade_ar2")
  cb:SetPos(self.Owner:GetShootPos())
  cb:SetOwner(self.Owner)
 cb:SetAngles(self.Owner:EyeAngles())
 cb:SetModelScale(8,0)

 cb:PhysicsInit(SOLID_VPHYSICS)
    cb:Spawn()
    local cbs = cb:GetPhysicsObject()
 cb:SetVelocity((self.Owner:GetAimVector() * 1500) + VectorRand() * 30) 
 cb:SetLocalAngularVelocity(AngleRand() )
	end
end
end 


function SWEP:SecondaryAttack()

	self:PrimaryAttack()

end 


function SWEP:ShootEffects()

	self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK ) 		-- View model animation
	self.Owner:MuzzleFlash()								-- Crappy muzzle light
	self.Owner:SetAnimation( PLAYER_ATTACK1 )				-- 3rd Person Animation

end