-- Pause Screen
--

local Base  = require 'src.gamestates.gamestate'
local Pause = Base:extend()

-- Init
--
function Pause:init()
	Base.init(self, { name = 'pause' })
end

-- Draw
--
function Pause:draw()
	self.from:draw()
	--

	local w, h = Config.world.width, Config.world.height

	lg.setColor(Config.color.overlay)
	lg.rectangle('fill', 0, 0, w, h)

	-- text
	lg.setColor(Config.color.white)
	lg.setFont(Config.ui.font.lg)
	lg.printf('Pause', 0, h*0.4, w, 'center')
end

-- Controls
--
function Pause:keypressed(key)
	if     key == 'p'      then Gamestate:pop()
	elseif key == 'escape' then love.event.quit()
	end
end

return Pause