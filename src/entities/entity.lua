-- Base Entity
--

local Base   = require 'vendor.modern'
local Entity = Base:extend()

-- New
--
function Entity:new(data)
	self.game   = data.game
	self.id     = Util:uuid()
	self.name   = data.name   or 'entity'
	self.row    = data.row    or 0
	self.col    = data.col    or 0
	self.width  = data.width  or Config.world.tileSize
	self.height = data.height or Config.world.tileSize
	self.color  = data.color  or Config.color.black
	self.props  = data.props  or {}

	--
	self.game.world:add(self)
end

--
--
function Entity:move(dx, dy)
	--
	-- remove from world
	self.game.world:remove(self)

	-- update cell position
	self.col = self.col + dx
	self.row = self.row + dy

	-- reset
	self._aabb = nil

	-- add back to world
	self.game.world:add(self)
end

-- Tear down
--
function Entity:destroy()
    self.game.world:remove(self)
end

-- Get container
--
function Entity:container()
	local x, y = self:position()
	local w, h = self:dimensions()
	
	return x, y, w, h
end

-- Axis-aligned bounding box
--
function Entity:aabb()
	if not self._aabb then
		self._aabb = AABB:fromContainer(self:container())
	end

	return self._aabb
end

-- Get x, y-position
--
function Entity:position()
	return (self.col - 1) * Config.world.tileSize,
	       (self.row - 1) * Config.world.tileSize
end

-- Get entity dimensions
--
function Entity:dimensions()
	return self.width, self.height
end

-- Get current cell
--
function Entity:cell()
	return self.game.world.grid:queryCell(self.row, self.col)
end

-- Game tick
--
function Entity:tick()
	--
end

-- Update
--
function Entity:update(dt)
	--
end

-- Draw
--
function Entity:draw()
	if Config.debug then
		lg.setColor(Config.color.debug)
		lg.rectangle('line', self:container())
	end
end

return Entity