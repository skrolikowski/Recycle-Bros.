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
-- Common Colors
--
Config.color = {
	none    = { 1, 1, 1, 0 },
	debug   = { _:color('red-800') },
	red     = { _:color('red-500') },
	blue    = { _:color('blue-500') },
	white   = { _:color('white') },
	black   = { _:color('black') },
	overlay = { 0, 0, 0, 0.75 },
}

--------------------
-- UI Configurations
--
Config.ui = {
	font = {
		xs = lg.newFont('res/ui/Pocket.ttf', 12),
		sm = lg.newFont('res/ui/Pocket.ttf', 18),
		md = lg.newFont('res/ui/Pocket.ttf', 24),
		lg = lg.newFont('res/ui/Pocket.ttf', 32),
		xl = lg.newFont('res/ui/Pocket.ttf', 64)
	}
}

--------------------
-- Audio Configurations
--
Config.audio = {

}

--------------------
-- Image Configurations
--
Config.sheet = Spritesheet('res/tilesets/tileset.json')

--
Formula = {
	tick = function(x) return 0.85 ^ x / x + 0.5 end
}