----------------------Config----------------------
local addr=nil	--Direct recipient address
local port=2852	--Send and listen on this port
local dist=nil	--Modem strength, almost==distance
local pass="P0r2DruPG7xokYqh"	--2nd data packet
-------------------Declarations-------------------
local component = require("component")
local event = require("event")
local term = require('term')
local modem = component.modem
local arg = ... or " "
---------------------Arguments--------------------
addr=arg:match("-addr=(%w*)") or addr
port=tonumber(arg:match("-port=(%d*)")) or port
dist=tonumber(arg:match("-dist=(%d*)")) or dist
pass=arg:match("-pass=(%w*)") or pass
--------------------Modem Setup-------------------
modem.open(port)
dist = dist or modem.getStrength()
modem.setStrength(dist)
-----------------------Meat-----------------------
term.clear()
print('╔════════════════════════════════════════════════╗')
print('║    Execute code on remoteExec slaves nearby.   ║')
print('║                Enter :q to quit.               ║')
print('╚════════════════════════════════════════════════╝')
while true do
	local cmd=io.read()
	if cmd==":q" then break end	--Exit Code
	if cmd then									--If not nil
		if addr then modem.send(addr, port, cmd, pass)
		else modem.broadcast(port, cmd, pass)	end
		--{event,addr,addrX,portX,distX,data[Table]}
		local _,_,addrX,_,_,feedback,passX=event.pull(1, "modem_message")
		if passX==pass then io.write(addrX.."> ") print(feedback) end
	end
end
term.clear()
print('╔════════════════════════════════════════════════╗')
print('║            remoteExec master closed.           ║')
print('╚════════════════════════════════════════════════╝')