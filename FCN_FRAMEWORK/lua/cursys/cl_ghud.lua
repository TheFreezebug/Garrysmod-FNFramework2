hook.Add("HUDPaint","DrawCurrencyHudMoney",function()
    surface.SetFont("ChatFont")
    local w,h = surface.GetTextSize("$0aaaaaaaaaaa")
    
    surface.SetDrawColor(Color(102,96,255,40))
    surface.DrawRect(( ScrW() -50) - w * 1.3, 0 ,ScrH() + w +50,h*2)
    surface.SetDrawColor(Color(1,1,1,255))
     surface.DrawOutlinedRect((( ScrW() -50) - w * 1.3) - 1, 0 ,ScrH() + w +50,h*2)
    draw.SimpleText( "$0aaaaaaaaaaa", "ChatFont" , ScrW() - 50,  (h * 1.5), Color(255,255,255) , TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP ) 

end)
