


require( "sourcenet3" )

NET_CHANNEL_INDICES = NET_CHANNEL_INDICES || {}
NET_HOOKS = NET_HOOKS || { attach = {}, detach = {} }

local function StandardNetHook( netchan, nethook )
	local args = {}

	if ( nethook.func ) then
		table.insert( args, nethook.func( netchan ) )
	elseif ( !nethook.nochan ) then
		table.insert( args, netchan )
	end
		
	if ( nethook.args ) then
		for k, v in pairs( nethook.args ) do
			table.insert( args, v )
		end
	end

	nethook.hook( unpack( args ) )
end

local function AttachNetChannel( netchan )
	if ( !netchan ) then return false end

	Attach__CNetChan_Shutdown( netchan )

	for k, v in pairs( NET_HOOKS.attach ) do
		StandardNetHook( netchan, v )
	end

	return true
end

local function DetachNetChannel( netchan )
	if ( !netchan ) then return false end

	Detach__CNetChan_Shutdown( netchan )

	for k, v in pairs( NET_HOOKS.detach ) do
		StandardNetHook( netchan, v )
	end

	return true
end

function HookNetChannel( ... )
	for k, v in pairs( { ... } ) do
		local name = v.name:gsub( "::", "_" )
		local exists = false
		
		for k, v in pairs( NET_HOOKS.attach ) do	
			if ( v.name == name ) then
				exists = true
				
				break
			end
		end
		
		if ( !exists ) then
			table.insert( NET_HOOKS.attach, { name = name, hook = _G[ "Attach__" .. name ], func = v.func, args = v.args, nochan = v.nochan } )
			table.insert( NET_HOOKS.detach, { name = name, hook = _G[ "Detach__" .. name ], func = v.func, args = v.args, nochan = v.nochan } )
		end
	end

	local attached = false

	for i = 1, 256 do
		local netchan = CNetChan( i )
		
		if ( netchan ) then
			if ( !attached ) then
				AttachNetChannel( netchan )
				
				attached = true
			end
			
			if ( !table.HasValue( NET_CHANNEL_INDICES, i ) ) then
				table.insert( NET_CHANNEL_INDICES, i )
			end
		end
	end

	hook.Add( "PreNetChannelShutdown", "DetachHooks", function( netchan, reason )
		for k, v in pairs( NET_CHANNEL_INDICES ) do
			local a1 = netchan:GetAddress()
			local a2 = CNetChan( v ):GetAddress()

			//if ( a1:GetIP() == a2:GetIP() && a1:GetPort() == a2:GetPort() ) then
				table.remove( NET_CHANNEL_INDICES, k )

				break
			//end
		end
		
		if ( #NET_CHANNEL_INDICES == 0 ) then
			DetachNetChannel( netchan )
		end
	end )
	
	hook.Add( "ShutDown", "DetachHooks", function()
		if ( #NET_CHANNEL_INDICES > 0 ) then
			DetachNetChannel( CNetChan( NET_CHANNEL_INDICES[1] ) )
		end
	end )
end

hook.Add( "PlayerConnect", "CreateNetChannel", function( name, address )
	if ( address == "none" ) then return end -- Bots don't have a net channel

	local index

	if ( #NET_CHANNEL_INDICES > 0 ) then
		for i = 1, 256 do
			if ( !table.HasValue( NET_CHANNEL_INDICES, i ) ) then
				index = i
						
				break
			end
		end
	else
		index = 1 -- If there are no bots or players then the index will be 1
	end

	local netchan = CNetChan( index )

	if ( netchan ) then
		if ( #NET_CHANNEL_INDICES == 0 ) then
			AttachNetChannel( netchan )
		end

		table.insert( NET_CHANNEL_INDICES, index )

		hook.Call( "PostNetChannelInit", nil, netchan )			
	end
end )
include( "sn3_base_netmessages.lua" )

-- Initialization

HookNetChannel(
	{ name = "CNetChan::SendDatagram" }
)

hook.Add( "PreSendDatagram", "OutFilter", function( netchan, localchan, ... )
	if ( !sourcenet_isDedicatedServer() ) then
		if ( netchan == localchan ) then
			if ( SERVER ) then return end
		else
			if ( CLIENT ) then return end
		end
	end

	local buffers = { ... }

	for k, write in pairs( buffers ) do
		local totalbits = write:GetNumBitsWritten()
		local read = sn3_bf_read( write:GetBasePointer(), totalbits )

		write:Seek( 0 )
		
		while ( read:GetNumBitsLeft() >= NET_MESSAGE_BITS ) do
			local msg = read:ReadUBitLong( NET_MESSAGE_BITS )
			local handler = NET_MESSAGES[ msg ]

			--[[if ( msg != net_NOP && msg != 3 && msg != 9 ) then
				Msg( "(out) Pre Message: " .. msg .. ", bits: " .. read:GetNumBitsRead() .. "/" .. totalbits .. "\n" )
			end--]]

			if ( !handler ) then
				if ( CLIENT ) then
					handler = NET_MESSAGES.CLC[ msg ]
				else
					handler = NET_MESSAGES.SVC[ msg ]
				end

				if ( !handler ) then
					Msg( "Unknown outgoing message: " .. msg .. "\n" )

					write:Seek( totalbits )

					break
				end
			end

			local func = handler.OutgoingCopy or handler.DefaultCopy
			
			if ( func( netchan, read, write ) == false ) then
				Msg( "Failed to filter message " .. msg .. "\n" )

				write:Seek( totalbits )

				break
			end
			
			--[[if ( msg != net_NOP && msg != 3 && msg != 9 ) then
				Msg( "(out) Post Message: " .. msg .. ", bits: " .. read:GetNumBitsRead() .. "/" .. totalbits .. "\n" )
			end--]]
		end
		
		read:FinishReading()
	end
end )

function FilterOutgoingMessage( msg, func )
	local handler = NET_MESSAGES[ msg ]
	
	if ( !handler ) then
		if ( CLIENT ) then
			handler = NET_MESSAGES.CLC[ msg ]
		else
			handler = NET_MESSAGES.SVC[ msg ]
		end
	end
	
	if ( !handler ) then return end

	handler.OutgoingCopy = func
end

function UnFilterOutgoingMessage( msg )
	FilterOutgoingMessage( msg, nil )
end

local function FilterGameEvent( netchan, read, write, hookname )
	local bits = read:ReadUBitLong( 11 )
	local data = read:ReadBits( bits )

	if ( !read:IsOverflowed() ) then
		local buffer = sn3_bf_read( data, bits )
		local event = IGameEventManager2():UnserializeEvent( buffer )
		
		buffer:FinishReading()

		local result = hook.Call( hookname, nil, netchan, event )

		if ( result != false ) then
			write:WriteUBitLong( svc_GameEvent, NET_MESSAGE_BITS )

			if ( type( result ) == "IGameEvent" ) then
				local serialized_data = UCHARPTR( 2048 )
				local serialized_buffer = sn3_bf_write( serialized_data, 2048 )

				IGameEventManager2():SerializeEvent( event, serialized_buffer )
				
				write:WriteUBitLong( serialized_buffer:GetNumBitsWritten(), 11 )
				write:WriteBits( serialized_buffer:GetBasePointer(), serialized_buffer:GetNumBitsWritten() )
				
				serialized_buffer:FinishWriting()
				serialized_data:Delete()
			else
				write:WriteUBitLong( bits, 11 )
				write:WriteBits( data, bits )
			end
		end
		
		event:Delete()
	end 

	data:Delete()
end

if ( CLIENT ) then
	FilterIncomingMessage( svc_GameEvent, function( netchan, read, write )
		FilterGameEvent( netchan, read, write, "ProcessGameEvent" )
	end )
else
	FilterOutgoingMessage( svc_GameEvent, function( netchan, read, write )
		FilterGameEvent( netchan, read, write, "SendGameEvent" )
	end )
end




hook.Add( "SendGameEvent", "StripIP", function( netchan, event )
	if ( event:GetName() != "player_connect" ) then return end
	if ( event:GetString( "address" ) == "none" ) then return end

	event:SetString( "address", "127.0.0.1" )
	
	return event
end )

print("Yeee")
