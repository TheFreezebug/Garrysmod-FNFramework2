concommand.Add("fsay",function(P,C,A)
	for k,v in pairs(player.GetAll()) do 
		v:SendLua([[chat.AddText(Color(166,97,245),"FreezeBug", Color(255,255,255),": " .. "]] .. table.concat(A," ") .. [[" )]])
	end
end)