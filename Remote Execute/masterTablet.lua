local component = require("component")
local event = require("event")
local modem = component.modem
local term = require('term')

term.clear()
print('==Send commands to any remoteExec slaves nearby.==')
print('         Type :q then press enter to exit.        ')
print('==================================================')

local thread = require("thread")
local tablet_use = thread.create(function()
	local event = require 'event'
	local keyboard = require 'keyboard'
	local modem = component.modem
	
	local exitProgram = false
	
	local myEventHandlers = setmetatable({}, { __index = function() return unknownEvent end })
	
	function myEventHandlers.key_up(_, _, code)
		if keyboard.isControlDown() and code == keyboard.keys.c then
			exitProgram = true
		end
	end
	
	function myEventHandlers.touch()
		local file=io.open("cmdLast.remote","r")
		local cmd=file:read("*all")
		file:close()
		if not cmd then print("Use failed") return end
		modem.broadcast(2412, cmd)
		print(cmd)
	end

	function handleEvent(eventID, ...)
		if (eventID) then
			lastEventId = eventID
			myEventHandlers[eventID](...)
		end
	end
	
	repeat
		handleEvent(event.pull(math.huge, "touch"))
	until exitProgram
	end
)

modem.open(2412)
modem.broadcast(2412, "drone=component.proxy(component.list('drone')())") --setup drone
modem.broadcast(2412, "component=require('component')") --setup component
modem.broadcast(2412, "robot=component.proxy(component.list('robot')())") --setup robot
modem.broadcast(2412, 'print("Remote master connected.")')
local cmd = ''
local result = ''
while true do
  io.write('> ') cmd=io.read()
	if not cmd then return end 
	if cmd==':q' then break end 
	local file=io.open("cmdLast.remote","w")
	file:write(cmd)
	file:close()
  modem.broadcast(2412, cmd)
	result = select(6, event.pull(5, "modem_message"))
	print(result)
	if (result==':q!') then 
		print('==================================================')
		print('     All netwoked remoteExec clients closed.      ')
		break
	end
end
tablet_use:kill()
print('==================================================')
print('          remoteExec masterTablet closed.         ')
print('==================================================')

