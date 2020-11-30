-- Entity Spawner
--

local Modern  = require 'vendor.modern'
local Spawner = Modern:extend()

-- New
--
function Spawner:new(game, spawns)
	self.game   = game
	self.spawns = spawns
end

-- Game tick
--
function Spawner:tick()
	--
	-- for __, spawn in pairs(self.spawns) do
	-- 	self.game.world:spawn('crate', {
	-- 		world = self.game.world,
	-- 		row   = _.__floor(spawn.x/Config.world.tileSize),
	-- 		col   = _.__floor(spawn.y/Config.world.tileSize),
	-- 		axis  = Vec2()
	-- 	})
	-- end
end

function Spawner:spawn(x, y, axis)
	self.game.world:spawn('crate', {
			world = self.game.world,
			row   = _.__floor(spawn.x/Config.world.tileSize),
			col   = _.__floor(spawn.y/Config.world.tileSize),
			axis  = axis
	})
end

return Spawner