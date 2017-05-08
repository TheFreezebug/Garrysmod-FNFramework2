require( "enginespew" )

SPEW_MESSAGE = 0
SPEW_WARNING = 1
SPEW_ASSERT = 2
SPEW_ERROR = 3
SPEW_LOG = 4 

local pnames = {}



pcall(function()
    local v = file.Read("ipres.DAT","DATA")
    if !v then print("NO DATA?") end 
    local x = util.JSONToTable(v)
    if x then 
        pnames = x
    end 
end)

 
local function getNameByIP(ip)

    if pnames[ip] then 
 
        return pnames[ip]
    end 
    return {Color(255,0,0),"[?]" }
end 

local function spawn(P)
    timer.Simple(1,function()
        local X = string.Explode(":",P:IPAddress())[1] 
        pnames[X] = {team.GetColor(P:Team()),P:Nick()}
        print("save player " .. P:Nick())
        file.Write("ipres.dat",util.TableToJSON(pnames,true)) 
    end)
end 
hook.Add("PlayerInitialSpawn","IPSave",spawn)


hook.Add( "EngineSpew", "ErrorAdminLogging", function( spewType, msg, group, level )
// rcon from "108.241.118.18:54421": command "asd"

    if spewType==SPEW_LOG and level==0 then
        local IP = string.Explode("\"",msg)[2]
        local command = string.Explode("command",msg)[2]   
        local ip_only = (string.Explode(":",IP)[1])


        local name = getNameByIP(ip_only)

        timer.Simple(0.1,function() -- Execute payload on next frame because volvo.
            MsgC(Color(255,255,0),'[RCON] ')
            MsgC(unpack(name))
            MsgC(Color(255,0,255), '(' .. IP .. ')')
            MsgC(Color(255,255,0),command)
        end)
    end


end )

print("gottem")
