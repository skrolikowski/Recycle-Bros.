-- Title - Menu
--
local Base  = require 'src.gamestates.gamestate'
local Title = Base:extend()

-- Event: onLoad
--
function Title:init(data)
	Base.init(self, { name = 'title' })
	--

end

-- Event: onEnter
--
function Title:enter(from, ...)
	Base.enter(self, from, ...)
	--
	
end

-- Draw
--
function Title:draw()
	--
end

return Title