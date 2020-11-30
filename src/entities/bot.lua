-- Bot - Player
--

local Base = require 'src.entities.entity'
local Bot  = Base:extend()

-- New
--
function Bot:new(data)
	Base.new(self, _:merge(data, { name = 'bot' }))
	--

	
end

return Bot 