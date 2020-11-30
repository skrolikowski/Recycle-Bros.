-- Base Screen
--

local Modern    = require 'vendor.modern'
local Gamestate = Modern:extend()

function Gamestate:init(data)
	self.id   = data.id   or Util:uuid()
	self.name = data.name or 'scene'
end

-- Update
--
function Gamestate:update(dt)
	--
end

---- ---- ---- ----

-- Event: onEnter
--
function Gamestate:enter(from, ...)
	self.from     = from -- previous screen
	self.settings = ...
end

-- Event: onResume
--
function Gamestate:resume()
	--
end

-- Event: onLeave
--
function Gamestate:leave()
	--
end

---- ---- ---- ----

-- Event: onPressed
--
function Gamestate:onPressed(...)
	--
end

-- Event: onReleased
--
function Gamestate:onReleased(...)
	--
end

return Gamestate