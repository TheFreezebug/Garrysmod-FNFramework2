FBWP = {}

local function boot_path(pth,b)

	for k,v in pairs(file.Find(pth .. "*.lua","LUA")) do 
		include(pth .. v)
		if b and SERVER then 
			AddCSLuaFile(pth .. v)
		end 
	end 

end


if SERVER then 
	boot_path("fbwp/server/")

end 



if CLIENT then 
	boot_path("fbwp/client/")
end 



boot_path("fbwp/shared/",true)


print("init")



local swc_context = {}

function FBWP.IMPORT_BASE(TABLE,BASE) // Shortcut for weapons get due to stupid garry bug with swep's and merging tables.
	local wbs = weapons.Get(BASE) // hax because swep base is swep base is swep base is swep base is MERGE TABLE.
	for k,v in pairs(wbs) do
		TABLE[k] = v 
	end
	return TABLE
end 


