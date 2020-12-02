-- Configurations
--
la = love.audio
lf = love.filesystem
lg = love.graphics
li = love.image
lj = love.joystick
lm = love.mouse
ls = love.sound
lt = love.timer
lx = love.math
lw = love.window
--
Config = {}
Config.debug = false

--------------------
-- World Constants
--
Config.world = {}
Config.world.scale    = 5
Config.world.tileSize = 8
Config.world.width    = 96 * Config.world.scale
Config.world.height   = 96 * Config.world.scale

--------------------
-- Game Configurations
--
Config.game = {
	botBounds = { min = 3, max = 9  },
	boundsX   = { min = 1, max = 12 },
	boundsY   = { min = 1, max = 10 },
	maxMisses = 3,
}

--------------------
-- Common Colors
--
Config.color = {
	none    = { 1, 1, 1, 0 },
	debug   = { _:color('red-800') },
	red     = { _:color('red-500') },
	blue    = { _:color('blue-500') },
	white   = { _:color('white') },
	black   = { _:color('black') },
	overlay = { 0, 0, 0, 0.65 },
}

--------------------
-- UI Configurations
--
Config.ui = {
	font = {
		xs = lg.newFont('res/ui/Kenney Mini.ttf', 12),
		sm = lg.newFont('res/ui/Kenney Mini.ttf', 18),
		md = lg.newFont('res/ui/Kenney Mini.ttf', 24),
		lg = lg.newFont('res/ui/Kenney Mini.ttf', 32),
		xl = lg.newFont('res/ui/Kenney Mini.ttf', 64)
	}
}

--------------------
-- Audio Configurations
--
Config.audio = {
	drop = la.newSource('res/sounds/drop.ogg', 'static'),
	pickup = la.newSource('res/sounds/pickup.ogg', 'static'),
	point = la.newSource('res/sounds/point.ogg', 'static'),
	tick = la.newSource('res/sounds/tick.ogg', 'static')
}

for name, source in pairs(Config.audio) do
	if name == 'tick' then
		source:setVolume(0.2)
	else
		source:setVolume(0.5)
	end
end

Config.bgm = {
	game = la.newSource('res/music/bip-bop.ogg', 'stream')
}

for name, source in pairs(Config.bgm) do
	source:setVolume(0.4)
	source:setLooping(true)
end

--
Formula = {
	tick   = function(x) return 0.85 ^ x / x + 0.5 end,
	points = function(x) return _.__floor(10 * (x ^ 1.15)) end,
}