local quickloaded = true


SWEP.PrintName = "FBWP Gun Base"
SWEP.Category = "FBWP"

SWEP.Base = "weapon_base"

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

SWEP.KnockbackFactor = -72

SWEP.Primary.ClipSize		= 4000				-- Size of a clip
SWEP.Primary.DefaultClip	= 999999			-- Default number of bullets in a clip
SWEP.Primary.Automatic		= true			-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"
SWEP.Primary.Delay = 0.1
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
SWEP.HasIronSights = true 
SWEP.IronTime = 0.25
SWEP.IronInSounds = {}
SWEP.IronOutSounds = {}


SWEP.HoldType = "shotgun"
SWEP.ScopedHoldType = "smg"
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
		if self.ThinkFirst then 
			self:ThinkFirst()
		end 
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
					end 
			else 

				if SERVER then 
					local snd = table.Random(self.IronOutSounds) or ""
						self.Owner:EmitSound(snd)
					end 
					self:SetNextSecondaryFire(CurTime() + 0.7 )
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










function SWEP:ShootBullet( damage, num_bullets, aimcone, AtckOverride )
	
	local bullet = {}
	bullet.Num 		= num_bullets
	bullet.Src 		= self.Owner:GetShootPos()			-- Source
	if AtckOverride then 
		bullet.Attacker = AtckOverride
	end 
	bullet.Dir 		= self.Owner:GetAimVector()			-- Dir of bullet
	bullet.Spread 	= aimcone	-- Aim Cone
	bullet.Tracer	= 5									-- Show a tracer on every x bullets 
	bullet.Force	= 1									-- Amount of force to give to phys objects
	bullet.Damage	= damage
	bullet.AmmoType = "Pistol"
	
	self.Owner:FireBullets( bullet )
	 
		self:ShootEffects()
	
	
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

if CLIENT then


	function SWEP:HUDShouldDraw(elemname) 
		if self.UseAmmo==false then 
			if elemname=="CHudAmmo" then 
				return false 
			end
			if elemname=="CHudSecondaryAmmo" then 
				return false
			end
		end
		if self.Secondary.Has==false then 
				if elemname=="CHudSecondaryAmmo" then 
					return false
				end
		end 
		return true
	end



	function SWEP:GetViewModelPosition( pos, ang )

		if ( !self.IronSightsPos ) then return pos, ang end

		local bIron = self.Weapon:GetNetworkedBool( "Ironsights" )
		
		if ( bIron != self.bLastIron ) then
		
			self.bLastIron = bIron 
			self.fIronTime = CurTime()
			
			if ( bIron ) then 
				self.SwayScale 	= 0.3
				self.BobScale 	= 0.1
			else 
				self.SwayScale 	= 1.0
				self.BobScale 	= 1.0
			end
		
		end
		
		local fIronTime = self.fIronTime or 0

		if ( !bIron and fIronTime < CurTime() - self.IronTime ) then 
			return pos, ang 
		end
		
		local Mul = 1.0
		
		if ( fIronTime > CurTime() - self.IronTime) then
		
			Mul = math.Clamp( (CurTime() - fIronTime) / self.IronTime, 0, 1 )
			
			if (!bIron) then Mul = 1 - Mul end
		
		end

		local Offset	= self.IronSightsPos
		
		if ( self.IronSightsAng ) then
		
			ang = ang * 1
			ang:RotateAroundAxis( ang:Right(), 		self.IronSightsAng.x * Mul )
			ang:RotateAroundAxis( ang:Up(), 		self.IronSightsAng.y * Mul )
			ang:RotateAroundAxis( ang:Forward(), 	self.IronSightsAng.z * Mul )
		
		
		end
		
		local Right 	= ang:Right()
		local Up 		= ang:Up()
		local Forward 	= ang:Forward()
		
		

		pos = pos + Offset.x * Right * Mul
		pos = pos + Offset.y * Forward * Mul
		pos = pos + Offset.z * Up * Mul

		return pos, ang
		
	end



	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		if self.ViewModelDrawnFirst then 
			self:ViewModelDrawnFirst()
		end
		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end
		
		if (!self.VElements) then return end
		
		self:UpdateBonePositions(vm)

		if (!self.vRenderOrder) then
			
			// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}

			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end
			
		end

		for k, name in ipairs( self.vRenderOrder ) do
		
			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (!v.bone) then continue end
			
			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
			
			if (!pos) then continue end
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		if self.DrawWorldModelFirst then 
			self:DrawWorldModelFirst()
		end 
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end
		
		if (!self.WElements) then return end
		
		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end

		end
		
		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end
		
		for k, name in pairs( self.wRenderOrder ) do
		
			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			
			local v = basetab[tab.rel]
			
			if (!v) then return end
			
			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )
			
			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
		else
		
			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end
			
			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			
			if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end
		
		end
		
		return pos, ang
	end

	function SWEP:CreateModels( tab )

		if (!tab) then return end

		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
				
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
				
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
				
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end
			
			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end
				
				loopthrough = allbones
			end
			// !! ----------- !! //
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				
				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				
				s = s * ms
				// !! ----------- !! //
				
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
		   
	end
	 
	function SWEP:ResetBonePositions(vm)
		
		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end
		
	end

	/**************************
		Global utility code
	**************************/

	// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	// Does not copy entities of course, only copies their reference.
	// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end
		
		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		
		return res
		
	end
	
end
