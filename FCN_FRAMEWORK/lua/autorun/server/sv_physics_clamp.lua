------------------------
	-- Might be useful
	------------------------
	local inf,ninf,ind = 1/0,-1/0,(1/0)/(1/0)
	--(ind==ind) == false :(. This should do though. >= and <= because you never know :3
	function math.BadNumber(v) 
		return not v or v==inf or v==ninf or not (v>=0 or v<=0)
	end

hook.Add("EngineSpew","crazy_physics",function(a,msg,c,d, r,g,b)
	if a~=0 or d~=0 or msg:sub(1,8) ~= "Crazy ph" then return end

	--hook.Remove("EngineSpew",1)
	--print(msg)
	local eid,class,p,yaw,r,x,y,z =
		msg:match '^Crazy physics on %[(%d+)%]%[([^%]]+)%] %[Ang:([^,]+),([^,]+),([^,]+)%] %[Pos:([^,]+),([^,]+),([^,]+)%]'
	if not eid then return end
	
	p=tonumber(p) or 0
	yaw=tonumber(yaw) or 0
	r=tonumber(r) or 0
	x=tonumber(x) or 0
	y=tonumber(y) or 0
	z=tonumber(z) or 0
	
	local badang = math.BadNumber(p) or p==0
				or math.BadNumber(yaw) or yaw==0
				or math.BadNumber(r) or r==0
		
	local badpos = math.BadNumber(x) or x==0
				or math.BadNumber(y) or y==0
				or math.BadNumber(z) or z==0
		
	local ent = Entity(eid)
	if not ent or not ent:IsValid() then 
		MsgN("FAIL: ",msg)
		return
	end
	
	local t = constraint.GetAllConstrainedEntities(ent)
	for k,v in next,t or {} do
		if v:IsValid() and not v.__removed__ then
			v.__removed__ = true
			MsgN("Const> ",v,v:GetPos(),v:GetAngles())
			v:Remove()
			local c = v:GetPhysicsObjectCount()
			if c >0 and v.Physics then
				
				for k,v in v:Physics() do
					v:SetVelocity(vector_origin)
					v:EnableMotion(false)
					v:Sleep()
				end
				
			end
		end
	end
	
	
	Msg("[Phys] Removing ",ent,' ')
		print(ent:CPPIGetOwner() or "OWNERLESS",badang and "ANGLE FAIL" or "",badpos and "POSITION FAIL" or "")
	
	local pl = IsValid(ent:CPPIGetOwner()) and ent:CPPIGetOwner() or IsValid(ent:GetOwner()) and ent:GetOwner() or IsValid(ent.Owner) and ent.Owner
	if pl and pl:IsValid() and pl:IsPlayer() and (not pl.extbadremovetime or pl.extbadremovetime<SysTime()) then
		pl.extbadremovetime=SysTime()+0.1
		pl:ChatPrint"[WARNING] Your prop was removed due to crazy physics!"
		pl:EmitSound("ambient/machines/zap1.wav")
	end
end)

