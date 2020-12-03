-- Entity Spawner
--
local Modern  = require 'vendor.modern'
local Spawner = Modern:extend()

-- New
--
function Spawner:new(game, layers)
	self.game   = game
	self.layers = layers
end

-- Teardown
--
function Spawner:destroy()
	--
end

-- Load entities
--
function Spawner:load(...)
	for __, name in pairs({...}) do
		for __, object in pairs(self.layers[name].objects) do
			name = lower(object.name ~= '' and object.name or name)

			Entities[name]()({
				game   = self.game,
				col    = floor(object.x / Config.world.tileSize) + 1,
				row    = floor(object.y / Config.world.tileSize) + 1,
				width  = object.width,
				height = object.height,
				props  = object.properties,
			})
		end
	end
end

return Spawner