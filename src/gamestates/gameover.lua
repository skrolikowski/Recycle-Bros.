-- GameOver Screen
--

local Base     = require 'src.gamestates.gamestate'
local GameOver = Base:extend()

-- Init
--
function GameOver:init()
	Base.init(self, { name = 'gameover' })
end

-- Draw
--
function GameOver:draw()
	self.from:draw()
	--

	local w, h = Config.world.width, Config.world.height

	lg.setColor(Config.color.overlay)
	lg.rectangle('fill', 0, 0, w, h)

	-- text
	lg.setColor(Config.color.white)
	lg.setFont(Config.ui.font.md)
	lg.printf("You've Been Recycled", 0, h*0.2, w, 'center')
	lg.printf("Points - "..self.from.points, 0, h*0.4, w, 'center')
end

-- Controls
--
function GameOver:keypressed(key)
	if key == 'r' then
		self.from:restart()
		Gamestate:pop()
	elseif key == 'escape' then
		love.event.quit()
	end
end

return GameOver