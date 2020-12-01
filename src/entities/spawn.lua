-- Spawn Entity
--

local Base  = require 'src.entities.entity'
local Spawn = Base:extend()

-- New
--
function Spawn:new(data)
	Base.new(self, _:merge({ name = 'spawn' }, data))
	--
	
	Entities['crate']()({
		game = self.game,
		row  = self.row,
		col  = self.col,
		axis = Vec2(self.props.dx or 0, self.props.dy or 0),
	})
end

-- Game tick
--
function Spawn:tick()
	
end

return Spawn