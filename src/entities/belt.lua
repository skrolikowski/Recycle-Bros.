-- Belt Entity
--

local Base = require 'src.entities.entity'
local Belt = Base:extend()

-- New
--
function Belt:new(data)
	Base.new(self, 'belt', data)
end

return Belt