-- Game World
--

local Modern = require 'vendor.modern'
local World  = Modern:extend()

-- New
--
function World:new(game)
	self.game   = game
	self.map    = sti('res/maps/test.lua')
	self.width  = self.map.width  * self.map.tilewidth  * Config.world.scale
	self.height = self.map.height * self.map.tileheight * Config.world.scale
	self.grid   = Grid(self, self.map.tilewidth)
	self.items  = {}
	self.debug  = false
end

-- Add entities to world
--
function World:add(...)
	for __, item in pairs({...}) do
		--
		-- register in world
		self.items[item.id] = item

		-- register in world
		self.grid:add(item)
	end
end

 -- Remove entities from world
function World:remove(item)
	--
	-- unregister from world
	self.items[item.id] = nil

	self.grid:remove(item)
end

-- Tear down
--
function World:destroy()
    for i = #self.items, 1, -1 do
        table.remove(self.items, i)
    end
end

-- Game tick
--
function World:tick()
	for __, item in pairs(self.items) do
		item:tick()
	end
end

-- Update
--
function World:update(dt)
    for __, item in pairs(self.items) do
		item:update(dt)
	end
end

-- Query items in cell
--
function World:queryCell(row, col)
	local cell = self.grid:queryCell(row, col)
	
	if cell then
		return cell.items
	end

	return {}
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
	--
	-- Draw the map
	love.graphics.setColor(Config.color.white)
	self.map:draw(0, 0, Config.world.scale, Config.world.scale)

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