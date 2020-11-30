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
--
Config = {

	--------------------
	-- World Constants
	--
	width  = lg.getWidth(),
	height = lg.getHeight(),
	world  = {
		scale    = 5,
		tileSize = 8*5,
	},

	--------------------
	-- Common Colors
	--
	color = {
	    none    = { 1, 1, 1, 0 },
	    red     = { _:color('red-500') },
	    blue    = { _:color('blue-500') },
		white   = { _:color('white') },
		black   = { _:color('black') },
	    overlay = { 0, 0, 0, 0.75 },
	},

	--------------------
	-- UI Configurations
	--
	ui = {
		font = {
			xs = lg.newFont('res/ui/Pocket.ttf', 12),
			sm = lg.newFont('res/ui/Pocket.ttf', 18),
			md = lg.newFont('res/ui/Pocket.ttf', 24),
			lg = lg.newFont('res/ui/Pocket.ttf', 32),
			xl = lg.newFont('res/ui/Pocket.ttf', 64)
		}
	},

	--------------------
	-- Audio Configurations
	--
	audio = {

	},

}

Formula = {
	tick = function(x) return 0.85 ^ x / x + 0.5 end
}