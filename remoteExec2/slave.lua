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
local addr=nil	--Provide the master's network card address
local port=2852	--Listen and send on this port
local dist=nil	--For restricting the maximium distance
local pass="P0r2DruPG7xokYqh"	--Should be the 2nd data packet
-------------------Declarations-------------------
--OpenOS hides these. This will allow component calls to be the same as for BIOS slaves.
_G.component = require("component")
_G.computer = require("computer")
_G.process = require("process")
_G.unicode = require("unicode")
local event = require("event")
local modem = component.modem
-----------------------Body-----------------------
modem.open(port)
--They are registered here to avoid being destroyed and created every loop.
local addrX,distX,cmdX,passX
local func, feedback
while true do
	_,_,addrX,_,distX,cmdX,passX=event.pull(math.huge, "modem_message")
	if not((addr and addrX~=addr)or(dist and distX>dist)or(passX~=pass))then
		func, feedback = load(cmdX)
		if func then --If there was a malformed func this will stop execution to avoid crashing the slave.
			_,feedback=pcall(func) 
		end
		modem.send(addrX, port, feedback, pass)	--This has to pass back to the orignal master to prevent sniffing.
	end
end