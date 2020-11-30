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

function Bot:move(dc, dr)
	local futureRow = self.row + dr

	print(futureRow)

	if futureRow >= 2 and futureRow <= 8 then
		print("move")
		self.row = self.row + dr
	end

	self.col = self.col + dc
end

function Bot:draw()
	local spriteNum = math.floor(self.animation.currentTime / self.animation.duration * #self.animation.quads) + 1

	local x = self.col * Config.world.tileSize
	local y = self.row * Config.world.tileSize

	lg.draw(self.animation.spriteSheet, self.animation.quads[spriteNum], x, y, 0, 3)
end

return Bot