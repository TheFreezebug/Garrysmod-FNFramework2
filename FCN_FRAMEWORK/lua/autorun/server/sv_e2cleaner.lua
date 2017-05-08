local BAD_CRC = {
    {id = "2050655823",time =  0,reason = "Bad E2 %id (Dead E2)"},
    {id = "928273247" ,time =  0,reason = "Bad E2 %id (Dead E2)"}
 
}



local BAD_STRINGS = {
    {string = "CryNet Bot",name = "Crynet bot"},
    {string = "Posistions[SpawnInd",name = "Dupe Stealing E2",action = function(self,ply,crc)
        for k,v in pairs(player.GetAll()) do
            for I=1,5 do 
                 Mercury.Util.SendMessage(v,{Color(255,0,0),"News flash!  " , ply , " Tried to dupe steal. They got banned, the end."} )
            end 
            v:EmitSound("gotchya.mp3")
        end
        timer.Simple(2,function()
            RunConsoleCommand("hg","ban",ply:SteamID(),0,"Intent to dupe steal. CRC " .. crc)
        end)
    end}
}

local function format_id(str,tab)

    return string.Replace(str,"%id",tab.id)

end


local function get_admins()
    local alladmins = {}
                for d,i in pairs(player.GetAll()) do 
                    if i:IsAdmin() then 
                        alladmins[#alladmins + 1] = i
                    end
                end
                return alladmins
end

function crypt(str,key)
    local str = util.Compress(str)
    local kp = 1
    local strn = ""
    for I=1,#str do 
        kp = kp + 1
        if kp > #key then 
            kp = 1
        end
        strn = strn .. string.char(bit.bxor(string.byte(str[I]),string.byte(key[kp])))
    end
    return strn 
end 



function uncrypt(str,key)

    local kp = 1
    local strn = ""
    for I=1,#str do 
        kp = kp + 1
        if kp > #key then 
            kp = 1
        end
        strn = strn .. string.char(bit.bxor(string.byte(str[I]),string.byte(key[kp]))) 
    end
    return strn
end



hook.Add("PlayerE2Upload","Block bad e2",function(ply,ent,numpackets,buffer)
    if buffer then 
        local buffcrc_int = util.CRC(buffer)
        local buff_crc = tostring(buffcrc_int)
        print(tostring(ply) .. "'s e2 verified " .. string.format("%X",buffcrc_int))

        local sid =  ply:SteamID()

        if not file.Exists("e2watch/" .. string.format("%X",buffcrc_int) .. ".txt","DATA") then 
            print("Saved new e2 to watchlist")
            file.Write("e2watch/" .. string.format("%X",buffcrc_int) .. ".txt",crypt(buffer,sid))
        end 


        for k,v in pairs(BAD_CRC) do
            if v.id==buff_crc then 
                    local alladmins = get_admins()
                Mercury.Util.SendMessage(alladmins,{Color(255,0,0)," BAN:  " , ply , " attempt to upload banned e2 (".. v.id.. ")"} )
                local plyid = ply:SteamID()
                
                if v.time!=-1 then 
                
                    RunConsoleCommand("hg","ban",plyid,v.time,format_id(v.reason,v) .. " CRC " .. buffcrc_int)
                end
            
                return false,"ATTEMPT TO UPLOAD BAD E2"
            end        
        end
        
        for k,v in pairs(BAD_STRINGS) do 
            //print(buffer)
            if string.find(buffer,v.string,1,true) then 
                print("ya")
                local alladmins = get_admins()
              
                  // ambient/energy/powerdown2.wav
                Mercury.Util.SendMessage(alladmins,{Color(255,0,0)," !-!-WARNING-!-! " , ply , " is uploading a suspicious e2! (".. v.name.. ")"} )
                if not v.action then 
                    Mercury.Util.SendMessage(ply,{Color(255,255,0)," Sorry :( " , ply, ", we can't let you upload that e2 " } )
                else 
                    v:action(ply,buffcrc_int)
                end
                  
                    timer.Simple(5,function()
                        if  IsValid(ent) then 
                            local asd = sound.Play("ambient/machines/squeak_" .. math.random(1,8 ) .. ".wav",ent:GetPos())
                            SafeRemoveEntityDelayed(ent,0.5)
                        end
                    end)
                ent:EmitSound("ambient/energy/powerdown2.wav")
                return false,"Bad strings found in e2"
            end            
        end        
    end
end)
 

timer.Create("CheckBadE2's",5,0,function()
    for k,v in pairs(ents.GetAll()) do 
        if v:GetClass()=="gmod_wire_expression2" then 
            
                if v.buffer then 
                local buffer = v.buffer 
                    local buff_crc = tostring(util.CRC(buffer))
                    local bad = false
                    local ninfo = "NO INFORMATION"
                    for k,v in pairs(BAD_CRC) do 
                         if v.id==buff_crc then 
                            bad = true 
                            ninfo = format_id(v.reason,v) 
                            break
                         end
                    end
                    local bade2_func
                    if not bad then 
                        for k,v in pairs(BAD_STRINGS) do 
                          if string.find(buffer,v.string,1,true) then 
                            bad = true      
                            ninfo = v.name
                            bade2_func = v 
                            break
                          end
                        end
                    end
                    
                    if bad then 
                        local ply = v:CPPIGetOwner() or "NIL"
                        local alladmins = get_admins()
                        Mercury.Util.SendMessage(alladmins,{Color(255,0,0)," !-! Removed banned e2 off of " , ply , "'s dupe (".. ninfo.. ")"} )  
                        if IsValid(v:CPPIGetOwner()) then 
                            Mercury.Util.SendMessage(v:CPPIGetOwner(),{Color(255,255,0)," !-! Removed banned e2 off of your dupe (".. ninfo.. ")"} )             
                            v:Remove()
                        end
                 
                        if bade2_func then 
                            if bade2_func.action then 
                               
                                bade2_func:action(ply,buff_crc)
                            end
                        end 
                    end
                end
        end
        if v:GetClass()=="gmod_thruster" then 
            if v:GetModel()=="models/sligwolf/unique_props/placeholder001.mdl" then 
                        local ply = v:CPPIGetOwner() or "NIL"
                        local alladmins = get_admins()
                        Mercury.Util.SendMessage(alladmins,{Color(255,0,0)," !-! Removed banned thruster model spawned by " , ply , ""} )  
                        if IsValid(v:CPPIGetOwner()) then 
                            Mercury.Util.SendMessage(v:CPPIGetOwner(),{Color(255,255,0)," !-! Removed thruster model from  (".. "models/sligwolf/unique_props/placeholder001.mdl" .. ")"} )             
                         
                        end
                           v:Remove()
            end 

        end 
    end
end)
