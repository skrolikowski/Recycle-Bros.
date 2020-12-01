-- Crate Entity
--

local Base  = require 'src.entities.entity'
local Crate = Base:extend()

-- New
--
function Crate:new(data)
	Base.new(self, _:merge({ name = 'crate' }, data))
	
	--
	-- properties
	self.axis = data.axis or Vec2()

	-- flags
	self.isDamaged = false
end

-- Update
--
function Crate:tick()
	--
	-- damaged goods check
	if not self:isSupported() then
		self.isDamaged = true
		self.axis      = Vec2(0, 1)
	end

	-- move
	self:move(self.axis:unpack())

	-- off screen check
	-- TODO: below = miss
	-- TODO: right/left = points
end

function Crate:draw()
	lg.setColor(Config.color.white)
	Config.sheet:draw('crate1', self:position())
end

-- Is supported from below?
--
function Crate:isSupported()
	local cell  = self:cell():below()
	local items = cell.items

	for __, item in pairs(items) do
		if item.name == 'belt' or item.name == 'bot' then
			return true
		end
	end

	return false
end

return Crate