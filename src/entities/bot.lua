-- Bot Entity
--

local Base = require 'src.entities.entity'
local Bot  = Base:extend()

-- New
--
function Bot:new(data)
	Base.new(self, _:merge({
		name = 'bot'
	}, data))

	self.image = lg.newImage("res/sprites/bot_" .. self.color .. ".png")
	self.image:setFilter("nearest", "nearest")

	self.animation = Util:newAnimation(self.image, 8, 8)
end

-- Update
--
function Bot:update(dt)
	self.animation.currentTime = self.animation.currentTime + dt

	if self.animation.currentTime >= self.animation.duration then
		self.animation.currentTime = self.animation.currentTime - self.animation.duration
	end
end

function Bot:move(dx, dy)
	futureY = self.row + dy

	if futureY >= 3 and futureY <= 9 then
		Base.move(self, dx, dy)
	end
end

-- Update
--
function Bot:update(dt)
	-- TODO: optimize
	local crate = self:getCrate()

	-- expedite
	if crate and not crate.isDamaged then
		crate:move(crate.axis:unpack())
	end
end

-- Draw
--
function Bot:draw()
	Base.draw(self)
	--
	local spriteNum = math.floor(self.animation.currentTime / self.animation.duration * #self.animation.quads) + 1
	local x, y      = self:position()

	lg.setColor(Config.color.white)
	lg.draw(self.animation.spriteSheet, self.animation.quads[spriteNum], x, y)
end

-- Is bot below crate?
--
function Bot:getCrate()
	local cell  = self:cell():above()
	local items = cell.items or {}

	for __, item in pairs(items) do
		if item.name == 'crate' then
			return item
		end
	end

	return false
end

return Bot