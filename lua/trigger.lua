if BDL and IsValid(BDL) then
    BDL:Remove()
end

http.Fetch("http://merp.ga/share/2016-12/luatrigger.png",function(A)
    file.Write("lt.png",A)
end)

if CLIENT then 
    
    Render = render  
    
    function Render.DrawCenteredBox(x,y,w,h)
    	surface.DrawTexturedRect( x - (w/2) , y - (h /2)  , w , h  )
    end 
    
    
    function Render.DrawTexturedVectorBox(min,max,tex)
    	local ap1,ap2
     local min,max = min,max
    	
    		if (min.x < max.x) then 
    			local a2x0 =  min.x 
    
    			min.x = max.x
    			max.x = a2x0
    
    		end
    		
    
    		if (min.y < max.y) then 
    			local a2x0 =  min.y
    
    			min.y = max.y
    			max.y = a2x0
    
    		end
    
    		if (min.z < max.z) then 
    			local a2x0 =  min.z
    
    			min.z = max.z
    			max.z = a2x0
    
    		end
    
    
    
    
    
    
    		ap1 = max
    		ap2 = min
    
    
    
    
    		
    
    	local luatrigger = tex
    	
    	local face1_point = ap1 + Vector(0,ap2.y - ap1.ya,ap2.z - ap1.z) // Get corner 1 
    	local face1_height = ap2.z - ap1.z
    	local face1_length = ap2.y - ap1.y
    
    		
    	cam.Start3D2D( face1_point - Vector(0,ap2.y - ap1.y,0) , Angle(90,180,0), 1 ) //
    		surface.SetMaterial(luatrigger)
    		surface.SetDrawColor(Color(255,255,255))
    		surface.DrawTexturedRectUV( 0, 0, face1_height, face1_length  , 0, 0, face1_height / 64, face1_length  / 64 )
    	cam.End3D2D()
    	
    	
    	local face2_point = ap1	+ Vector((ap2.x -ap1.x),face1_length,0) 
    	local face2_height = face1_height
    	local face2_length = ap2.x - ap1.x
    	
    	cam.Start3D2D( face2_point , Angle(-90,-90,0), 1 ) 
    		surface.SetMaterial(luatrigger)
    		surface.SetDrawColor(Color(255,255,255))
    		surface.DrawTexturedRectUV( 0, 0, face2_height, face2_length  , 0, 0,  face2_height / 64, face2_length / 64 )
    	cam.End3D2D()
    	
    	
    	
    	local face3_point = ap1 + Vector(ap2.x- ap1.x,ap2.y - ap1.ya,ap2.z - ap1.z) // Get corner 1 
    	local face3_height = ap2.z - ap1.z
    	local face3_length = ap2.y - ap1.y
    
    		
    	cam.Start3D2D( face3_point , Angle(90,0,0), 1 ) 
    		surface.SetMaterial(luatrigger)
    		surface.SetDrawColor(Color(255,255,255))
    		surface.DrawTexturedRectUV( 0, 0, face3_height, face3_length  , 0, 0,  face3_height / 64, face3_length / 64 )
    	cam.End3D2D()
    	
    	
    	
    	local face4_point = ap1	+ Vector(0,0,0) 
    	local face4_height = face1_height
    	local face4_length = ap2.x - ap1.x
    	
    	cam.Start3D2D( face4_point , Angle(-90,90,0), 1 ) 
    		surface.SetMaterial(luatrigger)
    		surface.SetDrawColor(Color(255,255,255))
    		surface.DrawTexturedRectUV( 0, 0, face4_height, face4_length  , 0, 0,  face4_height / 64, face4_length / 64 )
    	cam.End3D2D()
    	
    	
    	
    		
    	local face5_point = ap1	+ Vector(0,0,0) 
    	local face5_height = ap2.x - ap1.x
    	local face5_length = ap2.y - ap1.y
    	
    	cam.Start3D2D( face5_point , Angle(-180,180,0), 1 )
    		surface.SetMaterial(luatrigger)
    		surface.SetDrawColor(Color(255,255,255))
    		surface.DrawTexturedRectUV( 0, 0, face5_height, face5_length  , 0, 0,  face5_height / 64, face5_length / 64 )
    	cam.End3D2D()
    	
    	
    	local face6_point = ap1	+ Vector((ap2.x - ap1.x),0,face1_height) 
    	local face6_height = ap2.x - ap1.x
    	local face6_length = ap2.y - ap1.y
    	
    	cam.Start3D2D( face6_point , Angle(0,180,0), 1 ) 
    		surface.SetMaterial(luatrigger)
    		surface.SetDrawColor(Color(255,255,255))
    		surface.DrawTexturedRectUV( 0, 0, face6_height, face6_length  , 0, 0,  face6_height / 64, face6_length / 64 )
    	cam.End3D2D()
    	
    	
    	
    
    
    
    
    
    
    
    
    
    end
end




ENT = {}
ENT.Type = "anim"
ENT.Base = "base_entity"

ENT.AttackPlayer = nil
ENT.d1 = Vector(-9720.4756,2529.7837,2048)
ENT.d2 = Vector(-10405.7217,4758.6489,2682.4578)
ENT.szos =  ((ENT.d2 - ENT.d1)/2) 
local Luat = Material("data/lt.png","noclamp nocull")


hook.Add("PostDrawTranslucentRenderables","asd",function()
    for k,v in pairs(ents.GetAll()) do 
        if v:GetClass()=="bleeps" then 
            v:Draw()
        end
    end
    
end)
print("ITS NOT A COOKIE")

function ENT:Initialize()
    if SERVER then 
        local mesh_size = ((self.d2-self.d1) / 2)

        self:SetModel("models/props_junk/PopCan01a.mdl")
        self:PhysicsInitBox( -mesh_size , mesh_size )
        	self:SetRenderMode(RENDERMODE_TRANSALPHA)
        	self:SetSolid(SOLID_BBOX) 
        //	self:SetHitboxSet(2) // This is a heavily undocumented function. I do however have a basic understanding of how it works.
        	self:SetTrigger(true)
        	//self:GetPhysicsObject():EnableMotion( false )  Map triggers don't have valid physics objects :x
            //self:PhysWake( )
        	self:SetNotSolid(true)

        
    else 
    
    end
    
end

function ENT:StartTouch(E)
    print(E)

end
if CLIENT then 
    local Luat = Material("data/lt.png","noclamp nocull")
    function ENT:Draw()
        local d1 = self.d1 + Vector(0,0,1)
        local d2 =  self.d2 + Vector(0,0,1)
        local szos =  self.szos + Vector(0,0,1)

       Render.DrawTexturedVectorBox( d1   , (d1) + (szos*2)   ,Luat)
    end
end

scripted_ents.Register(ENT,"bleeps",true)

	if SERVER then 
    print("ASDASD")
    BDL = ents.Create("bleeps")
    print(BDL)
    BDL:SetPos(ENT.szos + ENT.d1 )
    BDL:Spawn()
    BDL:Activate()
 end
