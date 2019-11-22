----------------------Config----------------------
local addr=nil	--Allow only specific address
local port=2852	--Listen and send on this port
local dist=nil	--Restrict maximium distance
local pass="P0r2DruPG7xokYqh"	--2nd data packet
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
local addrX,distX,cmdX,passX
while true do
	--{"modem_message",ourAddr,...,data[Table]}
	_,_,addrX,_,distX,cmdX,passX=event.pull(math.huge, "modem_message")
	if not((addr and addrX~=addr)or(dist and distX>dist)or(passX~=pass))then
		local func, feedback = load(cmdX) --feed=error
		if func then _,feedback=pcall(func) end
		modem.send(addrX, port, feedback, pass)
	end
end