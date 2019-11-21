local event = require 'event'
local keyboard = require 'keyboard'
local term = require 'term'
local component = require("component")
local geo = component.proxy(component.geolyzer.address)
local hardnessTable = require 'hardnessTable'

local lastEventId
local exitProgram = false

local myEventHandlers = setmetatable({}, { __index = function() return unknownEvent end })

local function tablePrint(t, long, returnInstead)
	long = long or false
	returnInstead = returnInstead or false
	local list = '';

	for i,v in pairs(t) do
		v = v or ''
		local typeV = type(v)
		if (typeV == 'boolean') then
			v = v and 'true' or 'false'
			typeV = 'string'
		end
		if (typeV == 'number' or typeV == 'string') then
			if (long) then
				list = list .. i .. ':' .. v .. '    '
			else
				list = list .. i .. ': ' .. v .. '\n'
			end
		elseif (typeV == 'table') then
			tablePrint(v, long, true)
		else
			list = list .. ('unsupported format ' .. typeV .. ' at ' .. i)
		end
	end
	if (returnInstead) then
		return('{'.. list:gsub('[ \t]+%f[\r\n%z]', '') .. '}')
	else
		print('{'.. list:gsub('[ \t]+%f[\r\n%z]', '') .. '}')
	end
end

function myEventHandlers.key_up(_, _, code)
	if keyboard.isControlDown() and code == keyboard.keys.c then
		exitProgram = true
	end
end
 
function myEventHandlers.tablet_use(...)
	local useTable = {}
	useTable = ...
	print(' ')
	tablePrint(geo.analyze(3))
	print('Colour: '..useTable['color'])
	print('Hardness: '..useTable['hardness'])
	tablePrint(hardnessTable.getBlocks(useTable['hardness']), true)
end

function unknownEvent()
end

function handleEvent(eventID, ...)
	if (eventID) then
        lastEventId = eventID
    	myEventHandlers[eventID](...)
	end
end

term.clear()
print('Use on blocks to get what they could be by hardness.')
print('             Press Ctrl + C to edit.')
print('====================================================')
repeat
	handleEvent(event.pull())
until exitProgram

os.execute("edit ../autorun.lua")