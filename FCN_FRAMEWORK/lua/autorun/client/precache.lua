local show = false
local disp = false
timer.Create("CacheBlink",0.2,0,function()
    show = not show
end)
local pcc_c = 0 

hook.Add("HUDPaint","ModelCache",function()
    if disp then 
        surface.SetDrawColor(Color(255,0,0))
        surface.SetFont("ChatFont")
        surface.DrawRect(0,ScrH() - 40,250,40)
        surface.SetTextColor(Color(255,255,255))
        if show then 
            surface.SetTextPos(0,ScrH() - 35)
            surface.DrawText("MODEL CACHE FULL ("  .. pcc_c .. ")")
            surface.SetTextPos(0,ScrH() - 20)
            surface.DrawText("PREPARE FOR A CRASH SOON")
        end
    end
end)


net.Receive("PreCache",function()
    local c = net.ReadFloat(12)
    pcc_c = c
    local max = net.ReadFloat(12)
    if c > max * 0.98 then 
        disp = true
    end

end)
