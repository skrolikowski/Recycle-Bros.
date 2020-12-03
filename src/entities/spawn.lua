-- Spawn Entity
--

local Base  = require 'src.entities.entity'
local Spawn = Base:extend()

-- New
--
function Spawn:new(data)
	Base.new(self, 'spawn', data)
end

-- Spawn item
--
function Spawn:spawn()
	Entities['crate']()({
		game = self.game,
		row  = self.row,
		col  = self.col,
	})
end

return Spawn