-- Base Entity
--

local Modern = require 'vendor.modern'
local Entity = Modern:extend()

function Entity:new(data)
	--
	-- properties
	self.id   = Util:uuid()
	self.name = data.name or 'Entity'
end

-- Teardown
--
function Entity:destroy()
	self.world:remove(self)
end

-- Update
--
function Entity:update(dt)
	--
end

-- Draw
--
function Entity:draw()
	--
end

return Entity