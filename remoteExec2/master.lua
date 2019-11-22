----------------------Config----------------------
local addr=nil	--Direct reciever card
local port=2852	--Port used
local dist=400	--Maxium, inclusive
local pass="P0r2DruPG7xokYqh"	--2nd Packet
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
		print(select(6, event.pull(5, "modem_message")))
	end
end
term.clear()
print('╔════════════════════════════════════════════════╗')
print('║            remoteExec master closed.           ║')
print('╚════════════════════════════════════════════════╝')