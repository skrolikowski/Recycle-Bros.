-- Gameplay Screen
--
local Base = require 'src.gamestates.gamestate'
local Game = Base:extend()

-- Event: onLoad
--
function Game:init(data)
	Base.init(self, { name = 'game' })

	--
	-- flags
	self.isPaused = false
end

-- Update
--
function Game:update(dt)
	if not self.isPaused then
		self.map:update(dt)
		self.world:update(dt)
	end
end

-- Draw
--
function Game:draw()
	lg.setBackgroundColor(Util:RGBA(3, 14, 38, 255))

	lg.push()
		lg.scale(Config.world.scale, Config.world.scale)
		lg.setColor(Config.color.white)

		-- draw map
		self.map:drawTileLayer('Background')
		self.map:drawTileLayer('Border')
		self.map:drawTileLayer('Entities')

		-- draw entities
		self.world:draw()
	lg.pop()

	-- ui
	lg.setFont(Config.ui.font.md)

	lg.print("Wave: " .. self.wave, 10, 405)
	lg.print("Points: " .. self.points, 10, 435)
	lg.print("Miss: " .. self.misses, 390, 435)
end

-- Enter scene
--
function Game:enter(from, ...)
	Base.enter(self, from, ...)
	--

	-- map
	self.map    = sti('res/maps/test.lua')
	self.width  = self.map.width  * self.map.tilewidth
	self.height = self.map.height * self.map.tileheight

	-- world properties
	self.world  = World(self)
	self.wave   = self.settings.wave or 1
	self.points = 0
	self.misses = 0

	--
	-- bots, controlled by player
	self.b1 = Entities['bot']()({ game = self, row = 5, col = 4, color="yellow" })
	self.b2 = Entities['bot']()({ game = self, row = 5, col = 9, color="red" })

	-- music
	Config.bgm.game:play()

	-- spawn entities
	Spawner(self, self.map.layers):load('Belt','Spawn')

	-- tick - based on wave
	Timer.every(Formula.tick(self.wave), function()
		self.world:tick()
		Config.audio.tick:play()
	end)
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
	elseif key == 'g'      then self.world.debug = not self.world.debug
	elseif key == 'escape' then love.event.quit()
	end
end

return Game