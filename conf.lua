--

function love.conf(t)
    io.stdout:setvbuf('no')

    t.identity = 'major-jam-3'
    t.version  = '11.2'
    t.console  = false

    t.window.title      = 'Major Jam 3: Retro'
    t.window.x          = 200
    t.window.y          = 50
    t.window.width      = 96*5
    t.window.height     = 96*5
    t.window.fullscreen = false
    t.window.highdpi    = true
    t.window.vsync      = true

    t.modules.touch   = false
    t.modules.thread  = false
    t.modules.video   = false
end