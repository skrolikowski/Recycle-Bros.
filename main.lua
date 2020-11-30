-- Major Jam 3: Retro
-- https://github.com/skrolikowski/major-jam-3
--
-- vendor packages
pprint    = require 'vendor.pprint.pprint'
Gamestate = require 'vendor.hump.gamestate'
Timer     = require 'vendor.hump.timer'

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
    Gamestate.switch(Gamestates['title'])
end

-- Update
--
function love.update(dt)
    Timer.update(dt)
end

---- ---- ---- ----

-- Controls:
-- Key Pressed
--
function love.keypressed(key)
    Gamestate.current():onPressed(key)
end

-- Controls:
-- Key Released
--
function love.keyreleased(key)
    Gamestate.current():onReleased(key)
end
