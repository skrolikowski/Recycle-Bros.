-- Gameplay Screen
--
local Base = require 'src.gamestates.gamestate'
local Game = Base:extend()

-- Event: onLoad
--
function Game:init(data)
	Base.init(self, { name = 'game' })

	--
	-- properties
	self.timer  = Timer.new()
	self.ticker = nil
	self.ticks  = 0

	-- flags
	self.isPaused = false
end

-- Update
--
function Game:update(dt)
	if not self.isPaused then
		self.timer:update(dt)
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
	self.world = World(self)

	-- spawn entities
	Spawner(self, self.map.layers):load('Belt','Spawn')

	-- spawners
	self.spawns = self.world:queryByName('spawn')

	-- spawn bots, controlled by player
	self.b1 = Entities['bot']()({ game = self, row = 5, col = 4, color = 'yellow', minRow = 5, maxRow = 9 })
	self.b2 = Entities['bot']()({ game = self, row = 5, col = 9, color = 'red', minRow = 3, maxRow = 7 })

	-- music
	Config.bgm.game:play()

	-- play!
	self:restart()
end

-- Pause game
--
function Game:pause()
	self.isPaused = true

	Config.bgm.game:pause()

	Gamestate.push(Gamestates['pause'])
end

-- Resume scene (pop)
--
function Game:resume()
	self.isPaused = false

	Config.bgm.game:play()
end

-- Leave scene
--
function Game:leave()
	self.timer:clear()
	self.world:destroy()
end

---- ---- ---- ----

-- Record Miss
--
function Game:addMiss()
	self.misses = self.misses + 1

	if self.misses >= Config.game.maxMisses then
		self:gameOver()
	end
end

-- Record Point
--
function Game:addPoint()
	self.points = self.points + 1

	if self.points >= self.maxPoints then
		self:nextWave()
	end
end

-- Next wave! - goal achieved
--
function Game:nextWave()
	self.wave      = self.wave + 1
	self.maxPoints = Formula.points(self.wave)
	self.points    = self.points or 0
	self.misses    = self.misses or 0

	--
	-- cancel prev timer (if applicable)
	if self.ticker then
		self.timer:cancel(self.ticker)
	end

	--
	-- set ticker
	local delay = Formula.tick(self.wave)

	self.ticker = self.timer:every(delay, function()
		self:tick()
	end)
end

-- Game tick
--
function Game:tick()
	Config.audio.tick:play()

	-- notify world
	self.world:tick()

	self.ticks = self.ticks + 1

	-- spawn new item
	if self.ticks % 2 == 0 then
		local pick    = random(#self.spawns)
		local spawner = self.spawns[pick]

		spawner:spawn()
	end
end

-- Restart game
--
function Game:restart()
	self.wave   = 0
	self.points = 0
	self.misses = 0
	self.ticks  = 0

	--
	self:nextWave()
end

-- Game over - too many misses
--
function Game:gameOver()
	Gamestate.push(Gamestates['gameover'])
end

-- Exit
--
function Game:exitGame()
	love.event.quit()
end

---- ---- ---- ----

-- Controls
--
function Game:keypressed(key)
	if     key == 'up'     then self.b2:move(0, -1)
	elseif key == 'down'   then self.b2:move(0,  1)
	elseif key == 'w'      then self.b1:move(0, -1)
	elseif key == 's'      then self.b1:move(0,  1)
	elseif key == 'g'      then Config.debug = not Config.debug
	elseif key == 'p'      then self:pause()
	elseif key == 'escape' then self:exitGame()
	end
end

return Game