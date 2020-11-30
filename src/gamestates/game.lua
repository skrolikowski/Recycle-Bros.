-- Gameplay Screen
--
local Base = require 'src.gamestates.gamestate'
local Game = Base:extend()

-- Event: onLoad
--
function Game:init(data)
	Base.init(self, { name = 'game' })
	--

end

-- Event: onEnter
--
function Game:enter(from, ...)
	Base.enter(self, from, ...)
	--
	self.world = World()

	--
	-- Bots, controlled by player
	-- self.b1 = self.world:spawn('bot', 1, 1)
	-- self.b2 = self.world:spawn('bot', 1, 1)


end

-- Draw
--
function Game:draw()
	--
end

return Game