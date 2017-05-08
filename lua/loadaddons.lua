for k,v in pairs(file.Find("addons/*.gma","GAME")) do 
	Msg("Mounting ",v, " - ")
	Msg(game.MountGMA( "addons/" .. string.sub(v,4) ))
	MsgN(".")
end 