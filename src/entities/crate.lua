-- Crate Entity
--

local Base  = require 'src.entities.entity'
local Crate = Base:extend()

-- New
--
function Crate:new(data)
	Base.new(self, _:merge({
		name   = 'crate',
		width  = Config.world.tileSize * 2,
		height = Config.world.tileSize,
	}, data))
end

-- Update
--
function Crate:update(dt)

end

return Crate