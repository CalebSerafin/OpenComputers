--Version: 2.1
--[[
MIT License

Copyright (c) 2019 Caleb Serafin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

----------------------Config----------------------
local addr=nil	--Provide the slave's network card address
local port=2852	--Send and listen on this port
local dist=nil	--Modem strength
local pass="P0r2DruPG7xokYqh"	--Should be the 2nd data packet
-------------------Declarations-------------------
local component = require("component")
local event = require("event")
local term = require('term')
local modem = component.modem
local arg = ... or " "
---------------------Arguments--------------------
--Arguments should be provided in the format "-KEY=VALUE". Spaces are not required. Falls back to defualt values if not all args are given.
addr=arg:match("-addr=(%w*)") or addr
port=tonumber(arg:match("-port=(%d*)")) or port
dist=tonumber(arg:match("-dist=(%d*)")) or dist
pass=arg:match("-pass=(%w*)") or pass
--------------------Modem Setup-------------------
modem.open(port)
dist = dist or modem.getStrength()
modem.setStrength(dist)
-----------------------Body-----------------------
term.clear()
print('╔════════════════════════════════════════════════╗')
print('║    Execute code on remoteExec slaves nearby.   ║')
print('║                Enter :q to quit.               ║')
print('╚════════════════════════════════════════════════╝')
while true do
	local cmd=io.read()
	if cmd==":q" then break end
	if cmd then				--Avoid sending a nil packet
		if addr then modem.send(addr, port, cmd, pass)
		else modem.broadcast(port, cmd, pass)	end	--pass is still required to prevent the slave from attempting to execute arbitrary messages.
		local _,_,addrX,_,_,feedback,passX=event.pull(1, "modem_message")	--Captures the address to differentiate between multiple slaves.
		if passX==pass then io.write(addrX.."> ") print(feedback) end
	end
end
term.clear()
print('╔════════════════════════════════════════════════╗')
print('║            remoteExec master closed.           ║')
print('╚════════════════════════════════════════════════╝')