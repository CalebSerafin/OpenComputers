----------------------Config----------------------
local addr=nil	--Allow only specific address
local port=nil	--Allow only specific port
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
local addrX,portX,distX,cmdX,passX
while true do
	--{"modem_message",our addr,...,data[Table]}
	_,_,addrX,portX,distX,cmdX,passX=event.pull(math.huge, "modem_message")
	if(addr and addrX==addr)and(port and portX==port)and(dist and distX<=dist)and(passX==pass)then
		local func, feedback = load(cmdX) --feed=error
		if func then _,feedback=pcall(func) end
		modem.send(addrX, port, feedback, pass)
	end
end