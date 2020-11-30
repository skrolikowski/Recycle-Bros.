-- Base Entity
--

local Base   = require 'vendor.modern'
local Entity = Base:extend()

-- New
--
function Entity:new(data)
	self.name  = data.name  or 'entity'
	self.row   = data.row   or 0
	self.col   = data.col   or 0
	self.color = data.color or Config.color.black
end

--
--
function Entity:move(dc, dr)
	self.row = self.row + dr
	self.col = self.col + dc
end

-- Tear down
--
function Entity:destroy(other)
    self.remove = true
end

-- Update
--
function Entity:update(dt)
	--
end

-- Draw
--
function Entity:draw()
	lg.setColor(self.color)
	lg.rectangle('fill', self:aabb():container())
end

---- ---- ---- ----

-- Get dimensions
--
function Entity:dimensions()
	return Config.world.tileSize, Config.world.tileSize
end

-- Axis-aligned bounding box
--
function Entity:aabb()
	if not self._aabb then
		local x    = self.col * Config.world.tileSize
		local y    = self.row * Config.world.tileSize
		local w, h = self:dimensions()

		return AABB(x, y, x+w, y+h)
	end

	return self._aabb
end

return Entity