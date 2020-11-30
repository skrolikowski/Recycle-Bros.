-- Game World
--

local Modern = require 'vendor.modern'
local World  = Modern:extend()

-- New
--
function World:new(game)
	self.game   = game
	self.width  = game.map.width  * game.map.tilewidth
	self.height = game.map.height * game.map.tileheight
	self.grid   = Grid(self, game.map.tilewidth)
	self.items  = {}
end

-- teardown
--
function World:destroy()
	--
end

-- world dimensions
--
function World:dimension()
	return self.width, self.height
end

-- world bounding box
--
function World:aabb()
	if not self.aabb then
		self.aabb = AABB(0, 0, self:dimension())
	end

	return self.aabb
end


function World:spawn(name, row, col)
	local item = Entities[name](
		_.__floor(row / Config.world.tileSize),
		_.__floor(col / Config.world.tileSize)
	)

	-- register
	self.items[item.id] = item

	return item
end

-- query - get items within bounding box
--
function World:queryBounds(bounds, cb)
	local cells   = self.grid:queryCellsInBounds(bounds)
	local visited = {}
	local items   = {}

	for __, cell in pairs(cells) do
		for __, item in pairs(cell.items) do
			if not visited[item.id] then
				if bounds:contains(item:aabb()) then
					table.insert(items, item)
					--
					if cb then
						cb(item)
					end
				end
				--
				visited[item.id] = true
			end
		end
	end

	return items
end

-- query - get items within view
--
function World:queryScreen(cb)
	local cx, cy = self.game.camera.x, self.game.camera.y
	local left   = cx - Config.width / 2
	local top    = cy - Config.height / 2
	local right  = cx + Config.width / 2
	local bottom = cy + Config.height / 2
	local bounds = AABB(left, top, right, bottom)

    return self:queryBounds(bounds, cb)
end

-- query - get all items in World
--
function World:queryWorld(cb)
	local bounds = AABB:fromContainer(0, 0, self.width, self.height)
    return self:queryBounds(bounds, cb)
end

return World