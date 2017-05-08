local RenderBender = {}

if CLIENT then 
    RenderBender.Players = {}
    local bentply = RenderBender.Players 
    
    function RenderBender.Bend(ply,enabled)
        bentply[ply] = enabled
        local cnt = RenderBender.Update()
        if enabled==false then 
            LocalPlayer():ChatPrint("RenderBent " .. ply:Nick() .. " and resumed drawing " .. cnt .." entities")
            else 
            LocalPlayer():ChatPrint("RenderBent " .. ply:Nick() .. " and stopped drawing " .. cnt .." entities")
        end
        
    end
    
    function RenderBender.Update()
        local PO = NADMOD.PropOwners
        local total = 0
        for k,v in pairs(ents.GetAll()) do
          
            local own = v:GetNWEntity("Owner2")
            if IsValid(v) and IsValid(own) then 
              
                if bentply[own]==true and not v["_renderbent"] then 
                    v:SetNoDraw(true)
                    v._renderbent = true 
                    total = total + 1
                elseif v["_renderbent"]==true then 
                    if not bentply[own] then 
                        v:SetNoDraw(false)
                        v["_renderbent"] = false
                    end
                end
            elseif  v["_renderbent"] then 
                if not IsValid(own) then 
                    v:SetNoDraw(false)
                    v["_renderbent"] = false
                end
            end
        end
        return total
    end
    timer.Create("Renderbender_Update",15,0,RenderBender.Update)
    
    
    function RenderBender.Menu()
        local baseframe = vgui.Create("DFrame")
        baseframe:SetSize(200,600)
        baseframe:Center()
        baseframe:SetTitle("RenderBender 1.3.3")
        local ScrollPanel = vgui.Create( "DScrollPanel", baseframe )
        ScrollPanel:Dock(FILL)
        
    function ScrollPanel:Paint( w, h )
        draw.RoundedBox( 8, 0, 0, w, h, Color( 255, 243 , 153 ) )
    end
    
    local function OnChangedCheckbox(self,value)
        RenderBender.Bend(self.ply,value)
    end
    
    for k,v in pairs(player.GetAll()) do 
        local abc = vgui.Create("DCheckBox",ScrollPanel)
        abc.ply = v 
        abc:SetPos(10,k*40)
        if bentply[v] then 
            abc:SetValue(bentply[v])
        end
        abc.OnChange = OnChangedCheckbox
        local def = vgui.Create("DLabel",ScrollPanel)
        def:SetText(v:Nick())
        def:SetPos(50,k*40)
        def:SizeToContents()
        def:SetColor(Color(1,1,1,255))
        
        
    
    end
        
        baseframe:MakePopup()
    
    end
    
concommand.Add("renderbender",function()
       RenderBender.Menu()
        surface.PlaySound("gsgtrainsounds/other/joke/lionel_traintown/traintown_collision.wav")
end)
 
end



if SERVER then 
    timer.Create("RenderBender.Owners",10,0,function()
        for k,v in pairs(ents.GetAll()) do 
            if v:GetNWEntity("Owner2") and v.CPPIGetOwner then 
                v:SetNWEntity("Owner2",v:CPPIGetOwner())
            end
        end
    end)

end
