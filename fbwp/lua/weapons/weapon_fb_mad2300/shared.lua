
// SWEP.Base = "weapon_fb_base" -- This is broken shit that merges tables.

FBWP.IMPORT_BASE(SWEP,"weapon_fb_base") // This is not broken shit that replaces tables.
 


SWEP.PrintName = "Madsen 2300"

SWEP.Author			= "FreezeBug"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""


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
SWEP.Primary.Delay = 0.2
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
SWEP.Secondary.Delay = 8
SWEP.Secondary.Sounds = {"vo/engineer_gunslingertriplepunchfinal02.mp3"}
SWEP.Secondary.EmptySound = ""
SWEP.Secondary.Damage = 40
SWEP.Secondary.NumPerShot = 10
SWEP.Secondary.Cone = Vector(0,0,0)

print("reloading") 
 
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


print(SWEP.VElements)
print(SWEP.WElements)
SWEP.VElements = {
	["CHINGCHONG"] = { type = "Model", model = "models/Items/BoxSRounds.mdl", bone = "ValveBiped.muzzle", rel = "", pos = Vector(-17.143, -5.715, -0.519), angle = Angle(90, 8.182, -5.844), size = Vector(0.172, 0.69, 0.432), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["clip"] = { type = "Model", model = "models/Items/BoxSRounds.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.557, 0.518, -14.027), angle = Angle(5.843, 82.986, -85.325), size = Vector(0.237, 1.274, 0.237), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
function SWEP:DoSecondaryViewPunch()

end 

function SWEP:SecondaryAttack()
	if not self.Secondary.Has then return end
	if ( !self:CanSecondaryAttack() ) then return end

	self.Weapon:EmitSound(table.Random(self.Secondary.Sounds) or "")

	//self:ShootBullet(self.Secondary.Damage,self.Secondary.NumPerShot,self.Secondary.Cone)

	if self.UseAmmo then 
		self:TakeSecondaryAmmo(1)
	end
	
	self:DoSecondaryViewPunch()

	timer.Simple(2,function()
		for I=1,10 do 
			self.Owner:EmitSound("weapons/ar2/ar2_altfire.wav")
			util.ScreenShake( self.Owner:GetPos() , 500, 60, 0.3, 5000 )
		end
		if SERVER then 
			local BAM = ents.Create("base_anim")
				BAM:SetPos(self.Weapon:GetPos() + self.Owner:GetAimVector() * 4 + Vector(0,0,100))
				BAM:SetModel("models/Items/AR2_Grenade.mdl")
				BAM:SetModelScale(50,0)
				BAM:PhysicsInitSphere(200)
				BAM:GetPhysicsObject():EnableMotion(true)
				BAM:GetPhysicsObject():Wake()
				BAM:GetPhysicsObject():SetMass(50000)
				BAM:GetPhysicsObject():SetVelocityInstantaneous(self.Owner:GetAimVector() * 4000)

				timer.Simple(3,function()
					local BPOS = BAM:GetPos()
					BAM:Remove()
					local rem = ents.Create("base_anim")
					rem:SetPos(BPOS)

					rem:SetModel("models/Items/AR2_Grenade.mdl")
					
					rem:PhysicsInitSphere(10)
						rem:GetPhysicsObject():EnableMotion(true)
				rem:GetPhysicsObject():Wake()
				rem:GetPhysicsObject():SetMass(50000)


					ParticleEffect("cinefx_goldrush",BPOS,Angle(0,0,0),rem)

					timer.Simple(10,function()
						rem:Remove()
					end)
					for k,v in pairs(player.GetAll()) do 
						// v:EmitSound("mvm/mvm_tank_explode.wav")
					end 

					for k,v in pairs(ents.FindInSphere(BPOS,1000)) do 
						
							v:TakeDamage(300,self.Owner,self.Weapon)
					
					end 



				end) 
		end 
	end)
	

	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay )



end 

