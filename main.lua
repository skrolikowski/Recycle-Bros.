-- Major Jam 3: Retro
-- https://github.com/skrolikowski/major-jam-3
--
-- vendor packages
pprint    = require 'vendor.pprint.pprint'
Gamestate = require 'vendor.hump.gamestate'
Timer     = require 'vendor.hump.timer'
sti       = require 'vendor.sti.sti'

-- local packages
require 'src.toolbox'
require 'src.config'
require 'src.world'
require 'src.entities'
require 'src.gamestates'

-- settings
lw.setMode( Config.world.width, Config.world.height)

-- load
--
function love.load()
	loadGame()
	--
    Gamestate.registerEvents()
    Gamestate.switch(Gamestates['game'])
end

---- ---- ---- ----

-- New Game
--
function newGame()
	SAVE = Saver:save('recycle-bros', {
		hiScore = 0
	})
end

-- Load Game
--
function loadGame()
	if Saver:exists('recycle-bros') then
		SAVE = Saver:load('recycle-bros')
	else
		newGame()
	end
end

-- Save Game
--
function saveGame(data)
	SAVE = Saver:save('recycle-bros', Util:merge(SAVE, data))
end