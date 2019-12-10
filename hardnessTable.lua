--Version: 2.1
local hardnessTable = {}

--Arranged from greatest hardness to least hardness.
hardnessTable.table = {
	['flowinglava'] = 100,
	['lava'] = 100,
	['flowingwater'] = 100,
	['water'] = 100,
	
	['obsidian'] = 50,
	
	['enderchest'] = 22.5,
	['hardenedglass'] = 10,
	['hardenedglasspane'] = 10,
	['anvil'] = 5,
	['bell'] = 5,
	['coalblock'] = 5,
	['blockofcoal'] = 5,
	['diamondblock'] = 5,
	['blockofdiamond'] = 5,
	['emeraldblock'] = 5,
	['blockofemerald'] = 5,
	['enchantingtable'] = 5,
	['enchantmenttable'] = 5,
	['ironblock'] = 5,
	['blockofiron'] = 5,
	['ironbars'] = 5,
	['irondoor'] = 5,
    ['spawner'] = 5,
	['mobspawner'] = 5,
	['monsterspawner'] = 5,
	['redstoneblock'] = 5,
	['blockofredstone'] = 5,
	['irontrapdoor'] = 5,
	
	['web'] = 4,
	['cobweb'] = 4,
	
	['blastfurnace'] = 3.5,
	['dispenser'] = 3.5,
	['dropper'] = 3.5,
	['furnace'] = 3.5,
	['lantern'] = 3.5,
	['observer'] = 3.5,
	['smoker'] = 3.5,
	['stonecutter'] = 3.5,
	
	['beacon'] = 3,
	['coalore'] = 3,
	['diamondore'] = 3,
	['dragonegg'] = 3,
	['emeraldore'] = 3,
	['endstone'] = 3,
	['gold'] = 3,
	['blockofgold'] = 3,
	['goldore'] = 3,
	['hopper'] = 3,
	['ironore'] = 3,
	['lapis'] = 3,
	['lapislazuliblock'] = 3,
	['lapisore'] = 3,
	['lapislazuliore'] = 3,
	['quartzore'] = 3,
	['netherquartzore'] = 3,
	['redstoneore'] = 3,
	['trapdoor'] = 3,
	['woodtrapdoor'] = 3,
	['wooddoor'] = 3,
	['conduit'] = 3,
	
	['blueice'] = 2.8,
	
	['barrel'] = 2.5,
	['cartographytable'] = 2.5,
	['chest'] = 2.5,
	['compoundcreator'] = 2.5,
	['craftingtable'] = 2.5,
	['elementconstructor'] = 2.5,
	['fletchingtable'] = 2.5,
	['heatblock'] = 2.5,
	['labtable'] = 2.5,
	['lectern'] = 2.5,
	['loom'] = 2.5,
	['materialreducer'] = 2.5,
	['smithingtable'] = 2.5,
	['trappedchest'] = 2.5,
	
	['brick'] = 2,
	['brickstairs'] = 2,
	['campfire'] = 2,
	['cauldron'] = 2,
	['cobblestone'] = 2,
	['grindstone'] = 2,
	['stonestairs'] = 2,
	['cobblestonestairs'] = 2,
	['cobblestonewall'] = 2,
	['doubleslab'] = 2,
	['wooddoubleslab'] = 2,
	['stonedoubleslab'] = 2,
	['fence'] = 2,
	['woodfence'] = 2,
	['fencegate'] = 2,
	['jukebox'] = 2,
	['mossstone'] = 2,
	['mosscobblestone'] = 2,
	['netherbrick'] = 2,
	['rednetherbrick'] = 2,
	['netherbrickfence'] = 2,
	['netherbrickstairs'] = 2,
	['slab'] = 2,
	['woodslab'] = 2,
	['petrifiedoakslab'] = 2,
	['stoneslab'] = 2,
	['bark'] = 2,
	['log'] = 2,
	['wood'] = 2,
	['planks'] = 2,
	['woodplanks'] = 2,
	['woodstairs'] = 2,
	['purpurstairs'] = 2,
	['purpurslab'] = 2,
	['purpurdoubleslab'] = 2,
	['boneblock'] = 2,
	['shulkerbox'] = 2,
	
	['concrete'] = 1.8,
	
	['bookshelf'] = 1.5,
	['prismarine'] = 1.5,
	['darkprismarine'] = 1.5,
	['prismarinebrick'] = 1.5,
	['smoothstone'] = 1.5,
	['stone'] = 1.5,
	['andesite'] = 1.5,
	['diorite'] = 1.5,
	['granite'] = 1.5,
	['polishedandesite'] = 1.5,
	['polisheddiorite'] = 1.5,
	['polishedgranite'] = 1.5,
	['stonebrick'] = 1.5,
	['stonebrickstairs'] = 1.5,
	['purpurblock'] = 1.5,
	['purpurpillar'] = 1.5,
  ['coralblock'] = 1.5,
	
	['glazedterracotta'] = 1.4,

	['terracotta'] = 1.25,
	['stainedterracotta'] = 1.25,
	['coloredterracotta'] = 1.25,
	['hardenedclay'] = 1.25,
	['stainedclay'] = 1.25,
	
	['melon'] = 1,
	['melonblock'] = 1,
	['pumpkin'] = 1,
	['jackolantern'] = 1,
	['sign'] = 1,
	['banner'] = 1,
	['skull'] = 1,
	['mobhead'] = 1,
	['netherwartblock'] = 1,

	['noteblock'] = 0.8,
	['quartzblock'] = 0.8,
	['blockofquartz'] = 0.8,
	['quartzstairs'] = 0.8,
	['sandstone'] = 0.8,
	['sandstonestairs'] = 0.8,
	['redsandstone'] = 0.8,
	['redsandstonestairs'] = 0.8,
	['wool'] = 0.8,
	['endstonebrick'] = 0.8,
	
	['monsteregg'] = 0.75,
	['infestedblock'] = 0.75,
	['block97'] = 0.75,
	
	['rail'] = 0.7,
	['detectorrail'] = 0.7,
	['poweredrail'] = 0.7,
	['activatorrail'] = 0.7,

	['grasspath'] = 0.6,

	['beehive'] = 0.6,
	['clay'] = 0.6,	
	['clayblock'] = 0.6,
	['composter'] = 0.6,
	['farmland'] = 0.6,
	['grassblock'] = 0.6,
	['gravel'] = 0.6,
	['mycelium'] = 0.6,
	['sponge'] = 0.6,
	['wetsponge'] = 0.6,
	['beehive'] = 0.6,
	['honeycombblock'] = 0.6,
	
	['button'] = 0.5, 
	['stonebutton'] = 0.5,
	['woodbutton'] = 0.5,
	['brewingstand'] = 0.5,
	['cake'] = 0.5,
	['dirt'] = 0.5,
	['podzol'] = 0.5,
	['coarsedirt'] = 0.5,
	['haybale'] = 0.5,
	['hay'] = 0.5,
	['ice'] = 0.5,
	['frostedice'] = 0.5,
	['packedice'] = 0.5,
	['lever'] = 0.5,
	['piston'] = 0.5,
	['stickypiston'] = 0.5,
	['pistonextension'] = 0.5,
	['pistonhead'] = 0.5,
	['block34'] = 0.5,
	['pressureplate'] = 0.5,
	['stonepressureplate'] = 0.5,
	['woodpressureplate'] = 0.5,
	['weightedpressureplate'] = 0.5,
	['heavyweightedpressureplate'] = 0.5,
	['lightweightedpressureplate'] = 0.5,
	['sand'] = 0.5,
	['redsand'] = 0.5,
	['soulsand'] = 0.5,
	['magmablock'] = 0.5,
	['concretepowder'] = 0.5,
  ['driedkelpblock'] = 0.5,
	
	['cactus'] = 0.4,
	['ladder'] = 0.4,
	['netherrack'] = 0.4,
	['chorusplant'] = 0.4,
	['chorusflower'] = 0.4,
	
	['beenest'] = 0.3,
	['glass'] = 0.3,
	['glasspane'] = 0.3,
	['glowstone'] = 0.3,
	['sealantern'] = 0.3,
	['redstonelamp'] = 0.3,
	['stainedglass'] = 0.3,
	['stainedglasspane'] = 0.3,
	--Break Copy Limit Here

	['bed'] = 0.2,
	['cocoa'] = 0.2,
	['cocoaplant'] = 0.2,
	['daylightsensor'] = 0.2,
	['daylightdetector'] = 0.2,
	['hugemushroom'] = 0.2,
	['hugebrownmushroom'] = 0.2,
	['hugeredmushroom'] = 0.2,
	['mushroomblock'] = 0.2,
	['leaves'] = 0.2,
	['vine'] = 0.2,
	['snowblock'] = 0.2,
	
	['carpet'] = 0.1,
	['snow'] = 0.1,
	['snowcover'] = 0.1,
	['snowlayer'] = 0.1,
	
	['air'] = 0,
	['carrot'] = 0,
	['comparator'] = 0,
	['redstonecomparator'] = 0,
	['deadbush'] = 0,
	['flower'] = 0,
	['flowerpot'] = 0,
	['fire'] = 0,
	['grass'] = 0,
	['tallgrass'] = 0,
	['lilypad'] = 0,
	['lockedchest'] = 0,
	['mushroom'] = 0,
	['brownmushroom'] = 0,
	['redmushroom'] = 0,
	['melonstem'] = 0,
	['melonseed'] = 0,
	['pumpkinstem'] = 0,
	['pumpkinseed'] = 0,
	['netherwart'] = 0,
	['potato'] = 0,
	['potatoes'] = 0,
	['redstone'] = 0,
	['redstonedust'] = 0,
	['redstonewire'] = 0,
	['repeater'] = 0,
	['redstonerepeater'] = 0,
	['redstonetorch'] = 0,
	['sapling'] = 0,
	['sugarcane'] = 0,
	['torch'] = 0,
	['tripwire'] = 0,
	['tripwirehook'] = 0,
	['string'] = 0,
	['tnt'] = 0,
	['wheat'] = 0,
	['crop'] = 0,
	['seed'] = 0,
	['slimeblock'] = 0,
	['air'] = 0,
	['beetrootseed'] = 0,
	['endrod'] = 0,
	['structurevoid'] = 0,
  ['coral'] = 0,
  ['coralfan'] = 0,
  ['honeyblock'] = 0,
	-- BLOCKS BELOW THIS LINE ARE UNBREAKABLE
	['barrier'] = -1,
	['bedrock'] = -1,
	['invisiblebedrock'] = -1,
	['commandblock'] = -1,
	['endgateway'] = -1,
	['endgatewayblock'] = -1,
	['endportal'] = -1,
	['endportalframe'] = -1,
	['endportalblock'] = -1,
	['netherportal'] = -1,
	['portal'] = -1,
	['pistonextension'] = -1,
	['block36'] = -1,
	['jigsawblock'] = -1,
	['structureblock'] = -1,
	['structureblockexport'] = -1
}

--Use this to find possible blocks by the known hardness level.
function hardnessTable.getBlocks(hardness)
	hardness = math.floor(hardness*10 + 0.5)/10	--Due to rounding it is comomon for the supplied hardness to have an error.
	local matchingBlocks = {}
	for k,v in pairs(hardnessTable.table) do
		if (v == hardness) then
			table.insert(matchingBlocks, k)
		end
	end
	return matchingBlocks
end

return hardnessTable