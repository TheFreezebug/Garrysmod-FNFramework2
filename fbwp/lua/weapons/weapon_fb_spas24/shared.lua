local quickloaded = true


FBWP.IMPORT_BASE(SWEP,"weapon_fb_base") /// Same thing as SWEP.Base but not broken (SWEP.Base merge's tables, this overwrites.)

SWEP.PrintName = "SPAS 24"




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


SWEP.Primary.ClipSize		= 10				-- Size of a clip
SWEP.Primary.DefaultClip	= 999999			-- Default number of bullets in a clip
SWEP.Primary.Automatic		= true			-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"
SWEP.Primary.Delay = 0.3
SWEP.Primary.Sounds = {"ambient_mp3/rottenburg/tunneldoor_closed_loud.mp3","ambient_mp3/rottenburg/tunneldoor_open_complete.mp3"}
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

SWEP.IronSightsPos = Vector(-12.351, 0, -0.88)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.IronTime = 0.25
SWEP.IronInSounds = {}
SWEP.IronOutSounds = {}

SWEP.HoldType = "duel"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/v_pist_elite.mdl"
SWEP.WorldModel = "models/weapons/w_pist_elite.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["v_weapon.elite_right"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.Left_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(5.369, -0.926, 6.48), angle = Angle(0, 0, 0) },
	["v_weapon.Right_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(-5.37, -0.926, 6.852), angle = Angle(0, 0, 0) },
	["v_weapon.elite_left"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["left_shotgun"] = { type = "Model", model = "models/weapons/w_shot_m3super90.mdl", bone = "v_weapon.elite_left", rel = "", pos = Vector(-0.519, 0.518, -0.519), angle = Angle(90, 0, -90), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["left_shotgun+"] = { type = "Model", model = "models/weapons/w_shot_m3super90.mdl", bone = "v_weapon.elite_right", rel = "", pos = Vector(0.518, 0.518, -0.519), angle = Angle(90, 0, -90), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["left_shotgun"] = { type = "Model", model = "models/weapons/w_shot_m3super90.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(0.518, 0.518, -1.558), angle = Angle(0, 1.169, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["right_shotgun"] = { type = "Model", model = "models/weapons/w_shot_m3super90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.557, 1.557, 0.518), angle = Angle(0, -3.507, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
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
		self.Owner:SetVelocity( self.Owner:GetAimVector() * -72 )
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
