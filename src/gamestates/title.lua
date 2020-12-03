-- Title - Menu
--
local Base  = require 'src.gamestates.gamestate'
local Title = Base:extend()

-- Event: onLoad
--
function Title:init(data)
	Base.init(self, { name = 'title' })
	--

	self.timer  = Timer.new()
	self.ticker = nil
	self.ticks  = 0
end

function Title:addPoint()
	--
end

-- Enter screen
--
function Title:enter(from, ...)
	Base.enter(self, from, ...)
	--

	-- world properties
	self.world = World(self)

	-- map
	self.map    = sti('res/maps/title.lua')
	self.width  = self.map.width  * self.map.tilewidth
	self.height = self.map.height * self.map.tileheight

	-- spawn entities
	Spawner(self, self.map.layers):load('Belt','Spawn')

	-- spawners
	self.spawns = self.world:queryByName('spawn')

	-- set ticker
	local delay = Formula.tick(100000000)

	self.ticker = self.timer:every(delay, function()
		self:tick()
	end)
end

function Title:update(dt)
	self.timer:update(dt)
	self.map:update(dt)
	self.world:update(dt)
end

-- Draw
--
function Title:draw()
	local w, h = Config.world.width, Config.world.height

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

	-- text
	lg.setColor(Config.color.white)
	lg.setFont(Config.ui.font.lg)
	lg.printf("Recycle Bros", 0, h*0.3, w, 'center')

	lg.setFont(Config.ui.font.sm)
	lg.printf("v1.186892", 0, h*0.4, w, 'center')

	lg.setFont(Config.ui.font.md)
	blinkSpeed = 0.75

	local a = math.abs(math.cos(love.timer.getTime() * blinkSpeed % 2 * math.pi))
	love.graphics.setColor(1, 1, 1, a)
	lg.printf("Press Space to Start", 0, h*0.875, w, 'center')
end

---- ---- ---- ----

function Title:startGame(key)
	Gamestate.switch(Gamestates['game'])
end

--
--
function Title:quitGame(key)
	love.event.quit()
end

--
--
function Title:tick()
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

--
--
function Title:keypressed(key)
	if     key == 'space'  then self:startGame()
	elseif key == 'escape' then self:quitGame()
	end
end

return Title