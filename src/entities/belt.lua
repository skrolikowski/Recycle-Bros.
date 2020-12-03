-- Belt Entity
--

local Base = require 'src.entities.entity'
local Belt = Base:extend()

-- New
--
function Belt:new(data)
	Base.new(self, 'belt', data)

	--
	-- properties
	self.axis = Vec2(self.props.dx or 0, self.props.dy or 0)
end

return Belt