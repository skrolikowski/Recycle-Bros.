-- Game World
--

local Modern = require 'vendor.modern'
local World  = Modern:extend()

-- New
--
function World:new(game)
	self.game  = game
	-- self.width  = game.map.width  * game.map.tilewidth
	-- self.height = game.map.height * game.map.tileheight
	-- self.grid   = Grid(self, game.map.tilewidth)
	self.width  = Config.width
	self.height = Config.height
	self.grid   = Grid(self, Config.world.tileSize)
	self.items  = {}
	self.debug  = false
end

function World:spawn(name, data)
	local item = Entities[name](data)

	table.insert(self.items, item)

	return item
end

-- Tear down
--
function World:destroy()
    for i = #self.items, 1, -1 do
        table.remove(self.items, i)
    end
end

-- Update
--
function World:update(dt)
    for i = #self.items, 1, -1 do
        if self.items[i].remove then
        	table.remove(self.items, i)
        else
        	self.items[i]:update(dt)
        end
    end
end

-- Keypressed
--
function World:keypressed(key)
	if key == 'g' then
		self.debug = not self.debug
	end
end

-- Draw
--
function World:draw()
	-- Draw all items
	for __, item in pairs(self.items) do
		item:draw()
	end

	-- Draw the grid
	if self.debug then
		self.grid:draw()
	end
end

return World