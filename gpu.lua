local function onComponentAvailable(_, componentType)
  local component = require("component")
  local tty = require("tty")
	local gpu, screen = component.gpu, component.screen
	local screen_address = screen.address
	if gpu.getScreen() ~= screen_address then
		gpu.bind(screen_address)
	end
	local depth = math.floor(2^(gpu.getDepth()))
	os.setenv("TERM", "term-"..depth.."color")
	if tty.gpu() ~= gpu then
		tty.bind(gpu)
		event.push("term_available")
  end
end

onComponentAvailable()
