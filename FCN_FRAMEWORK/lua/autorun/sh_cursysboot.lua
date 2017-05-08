
CurSys = {}
local CurrencyTypes = {}

function CurSys.AddCurrenyType(type_e)
    assert(type(type_e)=="string","argument #1 to AddCurrencyType (string expected, got " ..type(type_e))
    type_e = string.lower(type_e)
    assert(CurrencyTypes[type_e]==nil,"This type already exists.")
    CurrencyTypes[type_e] = true
end

function CurSys.CurrencyTypeExists(type)
    return not (!CurrencyTypes[type]) // hax
end

function CurSys.GetTypesTable()
    return table.Copy(CurSys)
end

if SERVER then 
	   include("cursys/sv_plr.lua")
end