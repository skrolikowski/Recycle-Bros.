-- Grid Cell
--

local Modern = require 'vendor.modern'
local Cell   = Modern:extend()

-- New Cell
--
function Cell:new(grid, row, col)
	self.grid  = grid
	self.row   = row
	self.col   = col
	self.items = {}
end

-- Remove item
--
function Cell:add(item)
	self.items[item.id] = item
end

-- Add item
--
function Cell:remove(item)
	self.items[item.id] = nil
end

function Cell:unpack()
	return self.row, self.col
end

-- Center position
--
function Cell:center()
	local x, y = self:position()
	local w, h = self:dimensions()

	return x + w/2, y + h/2
end

-- Top left corner position
--
function Cell:position()
	return (self.col - 1) * self.grid.cellSize,
	       (self.row - 1) * self.grid.cellSize
end

-- cell dimensions
--
function Cell:dimensions()
	return self.grid.cellSize,
	       self.grid.cellSize
end

-- cell bounding box
--
function Cell:aabb()
	if not self._aabb then
		local x, y = self:position()
		local w, h = self:dimensions()

		self._aabb = AABB(x, y, x+w, y+h)
	end

	return self._aabb
end

-- Cell dimensions
--
function Cell:container()
	return self:aabb():container()
end

---- ---- ---- ----

-- Query - get neighboring cells
--
function Cell:queryNeighbors()
	return {
        top    = self:above(),
		left   = self:left(),
		right  = self:right(),
		bottom = self:below(),
    }
end

-- Get neighbor below
--
function Cell:below()
	return self.grid:queryCell(self.row + 1, self.col + 0)
end

-- Get neighbor above
--
function Cell:above()
	return self.grid:queryCell(self.row - 1, self.col + 0)
end

-- Get neighbor to the left
--
function Cell:left()
	return self.grid:queryCell(self.row + 0, self.col - 1)
end

-- Get neighbor to the right
--
function Cell:right()
	return self.grid:queryCell(self.row + 0, self.col + 1)
end

---- ---- ---- ----

-- Draw
--
function Cell:draw()
    lg.setColor(0, 0, 0, 0.15)
    lg.rectangle('line', self:container())
end

---- ---- ---- ----

-- __tostring operator
--
function Cell:__tostring()
    return 'Cell(' .. self.row .. ', ' .. self.col .. ')'
end

return Cell