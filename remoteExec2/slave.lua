----------------------Config----------------------
local addr=nil	--Direct sender card
local port=2412	--Port used
local dist=400	--Maxium, inclusive
local auth=nil	--2nd Packet
--------------------End Config--------------------
local component = require("component")
local event = require("event")
local modem=component.proxy(component.list("modem")())

modem.open(port)
local function respond(...)
  local args=table.pack(...)
  pcall(function() modem.broadcast(port, table.unpack(args)) end)
end
local function receive()
	while true do
		--"modem_message",local addr,foreign addr,port,distance,packet1[,.*packet8]
    local _,_,addrX,portX,distanceX,cmdX,authX=event.pull(math.huge, "modem_message")
		auth = auth or authX
		if (addr and addrX~=addr) or portX~=port or distanceX>dist or (auth and authX~=auth) then return end
		print(addrX.."> "..cmdX)
		return cmdX
  end
end
while true do
	local cmd = receive()
	if cmd then
		local result,feedback=pcall(function()
			return load(cmd)()
		end)
		respond(feedback)
	end
end
