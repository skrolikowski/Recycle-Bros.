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
love.window.setMode( Config.world.width, Config.world.height)

-- load
--
function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Gamestates['game'], { level = 1 })
end