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

-- Enter screen
--
function Title:enter(from, ...)
	Base.enter(self, from, ...)
	--
	
end

-- Draw
--
function Title:draw()
	lg.setBackgroundColor(Config.color.black)

end

---- ---- ---- ----

function Title:quitGame(key)
	love.event.quit()
end

-- 
--
function Title:quitGame(key)
	love.event.quit()
end

-- 
--
function Title:keypressed(key)
	if     key == 'space'  then self:startGame()
	elseif key == 'escape' then self:quitGame()
	end
end

return Title