-- Crate Entity
--

local Base  = require 'src.entities.entity'
local Crate = Base:extend()

-- New
--
function Crate:new(data)
	Base.new(self, 'crate', data)

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

	self.image = lg.newImage("res/sprites/item_" .. items[random(#items)] .. ".png")
	self.image:setFilter("nearest", "nearest")

	--
	self.axis = Vec2()

	-- flags
	self.isFalling = false
end

-- Game tick
--
function Crate:tick()
	local item = self:getSupport()

	--
	if not item then
	--
	-- freefall
		self.isFalling = true
		self.axis      = Vec2(0, 1)
	elseif item.name == 'belt' then
	--
	-- supported by belt
		self.isFalling = false
		self.axis      = item.axis:copy()
	elseif item.name == 'bot' and not self.isFalling then
	--
	-- supported by bot
		Config.audio.drop:play()
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
	local x, y = self:position()

	lg.setColor(Config.color.white)
	lg.draw(self.image, x, y)
end

---- ---- ---- ----

-- Check if within play area's x-bounds
--
function Crate:isInOfBoundsX()
	return self.col >= Config.game.boundsX.min and
	       self.col <= Config.game.boundsX.max
end

-- Check if within play area's y-bounds
--
function Crate:isInOfBoundsY()
	return self.row >= Config.game.boundsY.min and
	       self.row <= Config.game.boundsY.max
end

-- Get item supporting crate
--
function Crate:getSupport()
	local cell = self:cell():below()

	if cell and cell.items then
		for __, item in pairs(cell.items) do
			if item.name == 'belt' or item.name == 'bot' then
				return item
			end
		end
	end

	return false
end

return Crate