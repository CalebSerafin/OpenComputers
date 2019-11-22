----------------------Config----------------------
local addr=nil	--Direct sender card
local port=2852	--Port used
local dist=400	--Maxium, inclusive
local pass="P0r2DruPG7xokYqh"	--2nd Packet
-------------------Declarations-------------------
--Compensate for microcontrolers on same net.
_G.component = require("component")
_G.computer = require("computer")
_G.process = require("process")
_G.unicode = require("unicode")
local event = require("event")
local modem = component.modem
-----------------------Meat-----------------------
modem.open(port)
local function listen()
	--{"modem_message",local addr,foreign addr,port,distance,packet1[,.*packet8]}
	local _,_,addrX,portX,distanceX,cmdX,passX=event.pull(math.huge, "modem_message")
	if (addr and addrX~=addr) or portX~=port or distanceX>dist or (pass and passX~=pass) then return end
	return cmdX
end
while true do
	local func, errors = load(listen())
	if func then
		local _, feedback=pcall(func)
		modem.broadcast(port, feedback)
	else
		modem.broadcast(port, errors)
	end
end