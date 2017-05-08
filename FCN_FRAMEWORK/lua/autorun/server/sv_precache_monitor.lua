require("stringtable")

local MCACHE = {}
local novas = 0
local players = {}
PRECACHE = {}
MODELCACHE = stringtable.Get(2) // modelcache
util.AddNetworkString("PreCache")
local function CheckModel(ply,mod)
    if not MCACHE[mod] then // going to do the assume and say always valid. 
        MCACHE[mod] = true
        if !players[ply:SteamID()] then 
            players[ply:SteamID()] = {nam = ply:Name(), cnt = 0}
        end
        players[ply:SteamID()]["cnt"] = players[ply:SteamID()]['cnt'] + 1
    end
end

hook.Add( "PlayerSpawnProp", "PrecacheCrashDetect", CheckModel )


function PRECACHE.STATS()
    for k,v in pairs(player.GetAll()) do 
            v:ChatPrint("Precache statistics: " .. MODELCACHE:Count() .. "/" .. MODELCACHE:Size() .. " unique models ")
    end
end

function PRECACHE.BLAME()
    print("Players who have eaten all of the cache.")
    for k,v in pairs(players) do 
        print(v.nam .. " - " .. v.cnt .. " indicies.")    
    end
     for i,ply in pairs(player.GetAll()) do 
        ply:ChatPrint("Players who have used cache")
        for k,v in pairs(players) do  
            ply:ChatPrint(v.nam .. " - " .. v.cnt .. " indicies.")    
        end
    end
 
end
        
timer.Create("WarnOverflowingPrecache",2,0,function()
    net.Start("PreCache")
        net.WriteFloat(MODELCACHE:Count())
        net.WriteFloat(MODELCACHE:Size())
    net.Broadcast()
end) 
