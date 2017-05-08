local quickloaded = true


SWEP.PrintName = "FBWP Sniper Base"


SWEP.Base = "weapon_base"


SWEP.Category = "FBWP"
SWEP.Author			= "FreezeBug"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
//SWEP.FeatureSet = bit.band(FBWP_FEATURE_IRONSIGNTS,FBWP_FEATURE)

SWEP.UseAmmo = false

SWEP.Spawnable			= true
SWEP.AdminOnly			= true

SWEP.Weight				= 5			-- Decides whether we should switch from/to this
SWEP.AutoSwitchTo		= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom		= true		-- Auto switch from if you pick up a better weapon

SWEP.ScopeTexture = "fbwp/scope.png"
SWEP.KnockbackFactor = 20

SWEP.Primary.ClipSize		= 4000				-- Size of a clip
SWEP.Primary.DefaultClip	= 999999			-- Default number of bullets in a clip
SWEP.Primary.Automatic		= true			-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"
SWEP.Primary.Delay = 0.1
SWEP.Primary.Sounds = {"ambient_mp3/rottenburg/tunneldoor_closed_loud.mp3","ambient_mp3/rottenburg/tunneldoor_open_complete.mp3"}
SWEP.Primary.EmptySound = ""
SWEP.Primary.Damage = 40
SWEP.Primary.NumPerShot = 1
SWEP.Primary.Cone = Vector(0,0,0)



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
SWEP.HasIronSights = true 
SWEP.IronTime = 0.1
SWEP.IronInSounds = {}
SWEP.IronOutSounds = {}


SWEP.HoldType = "shotgun"
SWEP.ScopedHoldType  = "ar2"
SWEP.ViewModelFOV = 78.793969849246
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/v_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false




SWEP.ViewModelBoneMods = {
	["ValveBiped.Gun"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(2.036, -1.668, -3.52), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01"] = { scale = Vector(1, 1, 1), pos = Vector(-1.297, -0.556, -1.668), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.186, 0), angle = Angle(0, 0, 0) }
}



SWEP.VElements = {
	["ammo"] = { type = "Model", model = "models/items/boxsrounds.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(11.947, 1.557, 3.635), angle = Angle(1.169, 90, -85.325), size = Vector(0.885, 0.885, 0.885), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["element_name"] = { type = "Model", model = "models/weapons/c_shotgun.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(16.104, -8.832, -38.961), angle = Angle(92.337, 3.506, -92.338), size = Vector(1.47, 1.47, 1.47), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["element_name+"] = { type = "Model", model = "models/weapons/c_shotgun.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(17.142, -8.832, -38.961), angle = Angle(92.337, 3.506, -92.338), size = Vector(1.47, 1.47, 1.47), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["element_name++"] = { type = "Model", model = "models/weapons/c_shotgun.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(15.064, -8.832, -38.961), angle = Angle(92.337, 3.506, -92.338), size = Vector(1.47, 1.47, 1.47), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["gunbase+++"] = { type = "Model", model = "models/weapons/w_shotgun.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(17.142, 1.557, -3.636), angle = Angle(19.87, 180, 180), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["gunbase"] = { type = "Model", model = "models/items/boxsrounds.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(18.181, 6.752, -4.676), angle = Angle(71.299, 19.87, -111.04), size = Vector(0.497, 0.497, 0.497), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["gunbase++"] = { type = "Model", model = "models/weapons/w_shotgun.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(17.142, 0, -3.636), angle = Angle(19.87, 180, 180), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["gunbase+"] = { type = "Model", model = "models/weapons/w_shotgun.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(17.142, -1.558, -3.636), angle = Angle(19.87, 180, 180), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


/// ABOVE HERE IS GENERATED CODE ///



function SWEP:DoPrimaryViewPunch()


end 


function SWEP:DoSecondaryViewPunch()


end 






function SWEP:PrimaryAttack()
	
	if ( !self:CanPrimaryAttack() ) then return end

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
		self.Owner:SetVelocity( self.Owner:GetAimVector() * -self.KnockbackFactor ) // Don't set KB Factor too high. People will fly around the map by shooting guns.
	end



end 

function SWEP:Think()
	
		if  self:GetNWBool("IronSights") then
			if self.ScopedHoldType then 
				self.Weapon:SetHoldType(self.ScopedHoldType)
			end 
		else 
			self.Weapon:SetHoldType(self.HoldType)
		end 
end 


function SWEP:SecondaryAttack()
	if ( !self:CanSecondaryAttack() ) then return end
	
	if SERVER then 
		if self.HasIronSights then 
			self:SetNWBool("IronSights",not self:GetNWBool("IronSights"))

			if self:GetNWBool("IronSights")==false then 
					if SERVER then 
						local snd = table.Random(self.IronInSounds) or ""
						self.Owner:EmitSound(snd)
						self.Owner:SetFOV(0,0.5)

					end 
			else 

				if SERVER then 
					local snd = table.Random(self.IronOutSounds) or ""
						self.Owner:EmitSound(snd)
					end 
					self:SetNextSecondaryFire(CurTime() + 0.7 )
					self.Owner:SetFOV(1,0.5)
				end 
			return false
		end 
	end 

	if not self.Secondary.Has then return end

	local snd = table.Random(self.Secondary.Sounds) or ""
	if SERVER then 
		sound.Play(snd,self.Weapon:GetPos(),100,100,1)
	end 

	self:ShootBullet(self.Secondary.Damage,self.Secondary.NumPerShot,self.Secondary.Cone)

	if self.UseAmmo then 
		self:TakeSecondaryAmmo(1)
	end
	
	self:DoSecondaryViewPunch()

	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay )

end 






function SWEP:CanPrimaryAttack()

	if self.CanPrimaryAttackFirst then 
		local rsl = self:CanPrimaryAttackFirst()
		if rsl==false then return false end 
	end 


	if ( self.UseAmmo and self.Weapon:Clip1() <= 0 ) then
	
		self.Weapon:EmitSound( self.Primary.EmptySound )
		self.Weapon:SetNextSecondaryFire( CurTime() + 0.2 )
		return false
	
	end
	return true 
end 



function SWEP:CanSecondaryAttack()

	if self.CanSecondaryAttackFirst then 
		local rsl = self:CanSecondaryAttackFirst()
		if rsl==false then return false end 
	end 


	if ( self.UseAmmo and self.Weapon:Clip2() <= 0 ) then
	
		self.Weapon:EmitSound( self.Secondary.EmptySound )
		self.Weapon:SetNextSecondaryFire( CurTime() + 0.2 )
		return false
	
	end

	return true 
end 



function SWEP:TakePrimaryAmmo( num )

	if self.UseAmmo then 
		-- Doesn't use clips
		if ( self.Weapon:Clip1() <= 0 ) then 
		
			if ( self:Ammo1() <= 0 ) then return end
			
			self.Owner:RemoveAmmo( num, self.Weapon:GetPrimaryAmmoType() )
		
		return end
		
		self.Weapon:SetClip1( self.Weapon:Clip1() - num )	
	end 
	
end




function SWEP:TakeSecondaryAmmo( num )
	if self.UseAmmo then 
		-- Doesn't use clips
		if ( self.Weapon:Clip2() <= 0 ) then 
		
			if ( self:Ammo2() <= 0 ) then return end
			
			self.Owner:RemoveAmmo( num, self.Weapon:GetSecondaryAmmoType() )
		
		return end
		
		self.Weapon:SetClip2( self.Weapon:Clip2() - num )	
	end
end



--[[---------------------------------------------------------
   Name: SWEP:Reload( )
   Desc: Reload is being pressed
-----------------------------------------------------------]]
function SWEP:Reload()
 
	if self.ReloadingTime and CurTime() <= self.ReloadingTime then return end
 	
	if self.UseAmmo and ( self:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 ) then
 
		self:DefaultReload( ACT_VM_RELOAD )
                local AnimationTime = self.Owner:GetViewModel():SequenceDuration()
                self.ReloadingTime = CurTime() + AnimationTime
                self:SetNextPrimaryFire(CurTime() + AnimationTime)
                self:SetNextSecondaryFire(CurTime() + AnimationTime)
 
	end
 
end




function SWEP:ShootBullet( damage, num_bullets, aimcone )
	
	local bullet = {}
	bullet.Num 		= num_bullets
	bullet.Src 		= self.Owner:GetShootPos()			-- Source
	bullet.Dir 		= self.Owner:GetAimVector()			-- Dir of bullet
	bullet.Spread 	= aimcone	-- Aim Cone
	bullet.Tracer	= 5									-- Show a tracer on every x bullets 
	bullet.Force	= 1									-- Amount of force to give to phys objects
	bullet.Damage	= damage
	bullet.AmmoType = "Pistol"
	
	self.Owner:FireBullets( bullet )
	 
		self:ShootEffects()
	
	
end

function SWEP:AdjustMouseSensitivity()
	if self:GetNWBool("IronFull")==true then 
		return 0.05
	end 
end


function SWEP:Initialize()

	if self.InitializeFirst then 
		self:InitializeFirst()
	end

	if CLIENT then
	
		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels
		
		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
				
				// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")			
				end
			end
		end
		
	end

end

function SWEP:Holster()
	if self.HolsterFirst then 
		self:HolsterFirst()
	end 

	self:SetNWBool("IronSights",false)
	self:SetNWBool("IronFull",false)
	if SERVER then 
		self.Owner:SetFOV(0,0)
	end 
	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	
	return true
end

function SWEP:OnRemove()
	if self.RemoveFirst then 
		self:RemoveFirst()
	end
	self:Holster()
end

