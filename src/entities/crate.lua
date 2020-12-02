-- Crate Entity
--

local Base  = require 'src.entities.entity'
local Crate = Base:extend()

-- New
--
function Crate:new(data)
	Base.new(self, _:merge({ name = 'crate' }, data))

	--
	-- sprite
	items = {
		'crate',
		'dead_bot',
		'full_battery',
		'gold',
		'iron',
		'sapling',
		'used_battery',
		'water'
	}

	self.image = lg.newImage("res/sprites/item_" .. items[math.random(#items)] .. ".png")
	self.image:setFilter("nearest", "nearest")

	--
	-- properties
	self.axis = data.axis or Vec2()

	-- flags
	self.isDamaged = false
end

-- Game tick
--
function Crate:tick()
	--
	-- damaged goods check
	if not self:isSupported() then
		if self.isDamaged == false then
			Config.audio.drop:play()
		end

		self.isDamaged = true
		self.axis      = Vec2(0, 1)
	end

	--
	-- move
	self:move(self.axis:unpack())

	--
	-- point check
	if not self:isInOfBoundsX() then
		self.game:addPoint()
		self:destroy()
	--
	-- miss check
	elseif not self:isInOfBoundsY() then
		self.game:addMiss()
		self:destroy()
	end
end

-- Draw
--
function Crate:draw()
	-- local cx, cy = self:cell():center()
	local x, y = self:position()

	lg.setColor(Config.color.white)
	lg.draw(self.image, x, y)
end

---- ---- ---- ----

--
function Crate:isInOfBoundsX()
	return self.col >= Config.game.boundsX.min and
	       self.col <= Config.game.boundsX.max
end

--
function Crate:isInOfBoundsY()
	return self.row >= Config.game.boundsY.min and
	       self.row <= Config.game.boundsY.max
end

-- Is supported from below?
--
function Crate:isSupported()
	local cell  = self:cell():below()
	local items = cell.items

	for __, item in pairs(items) do
		if item.name == 'belt' or item.name == 'bot' then
			if item.name == 'bot' and not self.isDamaged then
				Config.audio.pickup:play()
			end

			return true
		end
	end

	return false
end

return Crate