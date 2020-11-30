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

-- load
--
function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Gamestates['game'])
end

-- Update
--
function love.update(dt)
    Timer.update(dt)
end