-- Gameplay Screen
--
local Base = require 'src.gamestates.gamestate'
local Game = Base:extend()

-- Event: onLoad
--
function Game:init(data)
	Base.init(self, { name = 'game' })
	--

	--
	self.isPaused = false
end

-- Update
--
function Game:update(dt)
	if not self.isPaused then
		self.world:update(dt)
	end
end

-- Draw
--
function Game:draw()
	lg.setBackgroundColor(Config.color.black)

	self.world:draw()
end

-- Enter scene
--
function Game:enter(from, ...)
	Base.enter(self, from, ...)
	--
	-- local STI = require 'vendor.sti.sti'

	-- self.map    = STI('')
	-- self.width  = self.map.width  * self.map.tilewidth
	-- self.height = self.map.height * self.map.tileheight

	--
	self.world = World(self)

	--
	-- Bots, controlled by player
	self.b1 = self.world:spawn('bot', { row = 3, col = 2,  color = Config.color.red })
	self.b2 = self.world:spawn('bot', { row = 3, col = 9, color = Config.color.blue })


end

-- Pause game
--
function Game:pause()
	self.isPaused = true
	--
	Gamestate.push(Gamestates['pause'])
end

-- Resume scene (pop)
--
function Game:resume()
	self.isPaused = false
end

-- Leave scene
--
function Game:leave()
	self.world:destroy()
end

---- ---- ---- ----

--
--
function Game:keypressed(key)
	if     key == 'up'     then self.b2:move(0, -1)
	elseif key == 'down'   then self.b2:move(0,  1)
	elseif key == 'w'      then self.b1:move(0, -1)
	elseif key == 's'      then self.b1:move(0,  1)
	elseif key == 'escape' then love.event.quit()
	end
end

return Game