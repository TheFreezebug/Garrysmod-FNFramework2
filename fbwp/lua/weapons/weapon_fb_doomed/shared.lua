local quickloaded = true


FBWP.IMPORT_BASE(SWEP,"weapon_fb_base") /// Same thing as SWEP.Base but not broken (SWEP.Base merge's tables, this overwrites.)

SWEP.PrintName = "Oh my god we're doomed"




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
SWEP.Primary.Sounds = {"items/pegleg_01.wav","items/pegleg_02.wav"}
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
SWEP.ViewModel = "models/weapons/c_crossbow.mdl"
SWEP.WorldModel = "models/weapons/w_crossbow.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {
	["ValveBiped.bowr2"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.bowl2"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(-17.963, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Crossbow_base"] = { scale = Vector(0.887, 0.887, 0.887), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.bolt"] = { scale = Vector(0.83, 0.83, 0.83), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.pull"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.bowl1"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(-3.889, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.bowr1"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}


SWEP.VElements = {
	["cactus"] = { type = "Model", model = "models/props_lab/cactus.mdl", bone = "ValveBiped.Crossbow_base", rel = "", pos = Vector(2.596, -2.3, 16.5), angle = Angle(0, 0, -90), size = Vector(0.172, 0.172, 0.172), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["battery1"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.Crossbow_base", rel = "", pos = Vector(0, -3.636, 4.8), angle = Angle(0, 87.662, -180), size = Vector(0.625, 0.497, 1.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["gas"] = { type = "Model", model = "models/props_c17/oildrum001_explosive.mdl", bone = "ValveBiped.Crossbow_base", rel = "", pos = Vector(0, 2.596, 11.947), angle = Angle(180, 99.35, 0), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["glow"] = { type = "Sprite", sprite = "sprites/blueglow1", bone = "ValveBiped.Crossbow_base", rel = "", pos = Vector(0, 0.518, -3.636), size = { x = 4.778, y = 4.778 }, color = Color(255, 0, 0, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["cone1"] = { type = "Model", model = "models/props_junk/TrafficCone001a.mdl", bone = "ValveBiped.Crossbow_base", rel = "battery1", pos = Vector(3, 0, 4.675), angle = Angle(-90, 0, 0), size = Vector(0.107, 0.107, 0.107), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["cone2"] = { type = "Model", model = "models/props_junk/TrafficCone001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "gas", pos = Vector(0, 0, -3.636), angle = Angle(0, 10.519, 180), size = Vector(0.301, 0.301, 0.301), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


SWEP.WElements = {
	["cactus"] = { type = "Model", model = "models/props_lab/cactus.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(18.142, 0.518, -3.636), angle = Angle(180, 0, 0), size = Vector(0.172, 0.172, 0.172), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["battery1"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.831, -0, -4.676), angle = Angle(-92.338, 10.519, -180), size = Vector(0.625, 0.497, 1.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["gas"] = { type = "Model", model = "models/props_c17/oildrum001_explosive.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.987, -0.519, -0.519), angle = Angle(87.662, 8.182, 0), size = Vector(0.107, 0.107, 0.107), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["glow"] = { type = "Sprite", sprite = "sprites/blueglow1", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(15, 0, -10), size = { x = 4.778, y = 4.778 }, color = Color(255, 0, 0, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["cone2"] = { type = "Model", model = "models/props_junk/TrafficCone001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "gas", pos = Vector(0, 0, -3.636), angle = Angle(0, 10.519, 180), size = Vector(0.172, 0.172, 0.172), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["cone1"] = { type = "Model", model = "models/props_junk/TrafficCone001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "battery1", pos = Vector(3, 0, 4.675), angle = Angle(-90, 0, 0), size = Vector(0.107, 0.107, 0.107), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
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

	if self.UseAmmo then 
		self:TakePrimaryAmmo(1)
	end
	
	self:DoPrimaryViewPunch()
    self:ShootEffects()
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay )
	if SERVER then 
		self.Owner:SetVelocity( self.Owner:GetAimVector() * -72 )
  local cb = ents.Create("crossbow_bolt")
  cb:SetPos(self.Owner:GetShootPos())
  cb:SetOwner(self.Owner)
 cb:SetAngles(self.Owner:EyeAngles())
 cb:SetModelScale(8,0)
 cb:Fire("SetTimer", "3")
 cb:PhysicsInit(SOLID_VPHYSICS)
    cb:Spawn()
    local cbs = cb:GetPhysicsObject()
 cb:SetVelocity(self.Owner:GetAimVector() * 4000) 
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

