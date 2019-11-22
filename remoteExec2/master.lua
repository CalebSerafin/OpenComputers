----------------------Config----------------------
local addr=nil	--Direct reciever card
local port=2412	--Port used
local dist=400	--Maxium, inclusive
local auth=nil	--2nd Packet
--------------------End Config--------------------
local component = require("component")
local event = require("event")
local modem = component.modem
modem.open(port)
modem.setStrength(dist)
while true do
  local cmd=io.read()
	if cmd then
		if addr then modem.send(addr, port, cmd, auth)
		else modem.broadcast(port, cmd, auth)	end
		print(select(6, event.pull(5, "modem_message")))
	end
end