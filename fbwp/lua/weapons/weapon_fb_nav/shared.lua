//local SWEP = { Primary = {},Seconary = {}}
// SWEP.Base = "weapon_fb_base" -- This is broken shit that merges tables.

FBWP.IMPORT_BASE(SWEP,"weapon_fb_base") // This is not broken shit that replaces tables.
 


SWEP.PrintName = "what's this ice?"

SWEP.Author			= "FreezeBug"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.Speeds = {
    [1]=-72,
    [2]=-50,
    [3]=-36,
    [4]=-15,
    [5]=-10,
    [6]=-5,
}
SWEP.SpeedIDX = 0
SWEP.LastReloadt = 0
SWEP.UseAmmo = false // faggot

SWEP.Spawnable			= true
SWEP.AdminOnly			= true

SWEP.Weight				= 5			-- Decides whether we should switch from/to this
SWEP.AutoSwitchTo		= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom		= true		-- Auto switch from if you pick up a better weapon


SWEP.Primary.ClipSize		= 4000				-- Size of a clip
SWEP.Primary.DefaultClip	= 999999			-- Default number of bullets in a clip
SWEP.Primary.Automatic		= true			-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "shotgun"
SWEP.Primary.Delay = 0
SWEP.Primary.Sounds = {"weapons/ar2/fire1.wav"}
SWEP.Primary.EmptySound = ""
SWEP.Primary.Damage = 40
SWEP.Primary.NumPerShot = 1
SWEP.Primary.Cone = Vector(0.3/8,0.3/8,0)


SWEP.Secondary.Has = true
SWEP.Secondary.ClipSize		= 8					-- Size of a clip
SWEP.Secondary.DefaultClip	= 999999			-- Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				-- Automatic/Semi Auto
SWEP.Secondary.Ammo			= "Pistol"
SWEP.Secondary.Delay = 3
SWEP.Secondary.Sounds = {"vo/engineer_gunslingertriplepunchfinal02.mp3"}
SWEP.Secondary.EmptySound = ""
SWEP.Secondary.Damage = 40
SWEP.Secondary.NumPerShot = 10
SWEP.Secondary.Cone = Vector(0,0,0)

 
 
SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/v_smg1.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {}




SWEP.IronSightsPos = Vector(0.479, 0, 1.679)
SWEP.IronSightsAng = Vector(0, 0, 0)



SWEP.VElements = {
    ["magnet"] = { type = "Model", model = "models/props_wasteland/cranemagnet01a.mdl", bone = "ValveBiped.muzzle", rel = "", pos = Vector(0, 0, 0), angle = Angle(143.766, 92.337, -94.676), size = Vector(0.107, 0.107, 0.107), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


SWEP.WElements = {
    ["magnet"] = { type = "Model", model = "models/props_wasteland/cranemagnet01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(21.298, 1.557, -7.792), angle = Angle(80.649, 0, 0), size = Vector(0.107, 0.107, 0.107), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:DoSecondaryViewPunch()

end 

function SWEP:SecondaryAttack()

    self.Owner:SetLocalVelocity(Vector(0,0,0))


end 



function SWEP:Reload()
 if SERVER then 
 if not (self.LastReloadt + 0.7 < CurTime()) then return end
	if not self.Secondary.Has then return end
	if ( !self:CanSecondaryAttack() ) then return end

    if self.SpeedIDX + 1 > #self.Speeds then 
        self.SpeedIDX = 0
    end
    self.SpeedIDX = self.SpeedIDX + 1
    local newspeed =self.Speeds[self.SpeedIDX] 
    self.Owner:ChatPrint("New speed changed to "  .. newspeed)
    self.KnockbackFactor = newspeed


    self.LastReloadt = CurTime()
 end
end 


function SWEP:PrimaryAttack()
  if CLIENT then 
    	 if !self.Weapon.Sound  then 
        self.Weapon.Sound = CreateSound(self.Owner,"ambient/energy/force_field_loop1.wav")
        self.Weapon.Sound:Play()
      end
   end

	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay )
	if SERVER then 
 self.Owner:SetGravity(0.01)
		self.Owner:SetVelocity( self.Owner:GetAimVector() * -self.KnockbackFactor ) // Don't set KB Factor too high. People will fly around the map by shooting guns.
	end

 self:ShootEffects()



end 

function SWEP:ThinkFirst() 
    if CLIENT then 
        if self.Weapon.Sound then 
            self.Weapon.Sound:ChangePitch(self.Owner:GetVelocity():Length() / 100,0)
        end
    end 
end

function SWEP:ShootEffects()

	self.Weapon:SendWeaponAnim( ACT_VM_SECONDARYATTACK ) 		-- View model animation
	//self.Owner:MuzzleFlash()								-- Crappy muzzle light
	self.Owner:SetAnimation( PLAYER_ATTACK1 )				-- 3rd Person Animation

end


function SWEP:HolsterFirst()
    if CLIENT then 
        if self.Weapon.Sound then 
            self.Weapon.Sound:Stop()
            self.Weapon.Sound = nil
        end
    else 
         self.Owner:SetGravity(1)
    end
end


