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
		tileSize = 16,
	},

	--------------------
	-- Common Colors
	--
	color = {
	    none    = { 1, 1, 1, 0 },
	    debug   = { _:color('red-500') },
		white   = { _:color('white') },
		black   = { _:color('black') },
	    overlay = { 0, 0, 0, 0.75 },
	},

	--------------------
	-- UI Configurations
	--
	ui = {
		font = {
			xs = lg.newFont('res/ui/fonts/Marksman.ttf', 12),
			sm = lg.newFont('res/ui/fonts/Marksman.ttf', 18),
			md = lg.newFont('res/ui/fonts/Marksman.ttf', 24),
			lg = lg.newFont('res/ui/fonts/Marksman.ttf', 32),
			xl = lg.newFont('res/ui/fonts/Marksman.ttf', 64)
		}
	},

	--------------------
	-- Audio Configurations
	--
	audio = {

	},


}