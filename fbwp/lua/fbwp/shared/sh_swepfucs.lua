

local swc_context = {}

function FBWP.IMPORT_BASE(TABLE,BASE) // Shortcut for weapons get due to stupid garry bug with swep's and merging tables.
	local wbs = weapons.Get(BASE) // hax because swep base is swep base is swep base is swep base is MERGE TABLE.
	for k,v in pairs(wbs) do
		TABLE[k] = v 
	end
	return TABLE
end 


