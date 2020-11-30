-- Grid
--

local Modern = require 'vendor.modern'
local Grid   = Modern:extend()

-- New Grid
--
function Grid:new(world, cellSize)
	self.world    = world
	self.cellSize = cellSize or 16
	self.rows     = _.__floor(world.height / self.cellSize)
	self.cols     = _.__floor(world.width  / self.cellSize)
	self.cells    = {}

	--
	-- create cells
	for r = 1, self.rows do
		for c = 1, self.cols do
			table.insert(self.cells, Cell(self, r, c))
		end
	end
end

-- Reset
--
function Grid:reset()
	for __, cell in pairs(self.cells) do
		cell.items = {}
	end
end

-- Tear down
--
function Grid:destroy()
	--
end

---- ---- ---- ----

--
--
function Grid:dimensions()
	return self.world.width, self.world.height
end

--
--
function Grid:aabb()
	if not self._aabb then
		self._aabb = AABB:fromContainer(0, 0, self:dimensions())
	end

	return self._aabb
end

---- ---- ---- ----

function Grid:add(item, cell)
	cell:add(item)
end

function Grid:remove(item, cell)
	cell:remove(item)
end

-- Query - get cell index at row/col-coords
--
function Grid:queryIndex(row, col)
	return ((col-1) + (row-1) * self.cols) + 1
end

-- Query - get cell at row/col-coords
--
function Grid:queryCell(row, col)
	if self:isValid(row, col) then
		return self.cells[self:queryIndex(row, col)]
	end
end

---- ---- ---- ----

-- Is valid coordinates?
--
function Grid:isValid(row, col)
	return row > 0 and
	       row <= self.rows and
	       col > 0 and
	       col <= self.cols
end

-- Is valid index?
--
function Grid:isValidIndex(index)
	return index > 0 and index <= #self.cells
end

---- ---- ---- ----

-- Draw
--
function Grid:draw()
	for __, cell in pairs(self.cells) do
		cell:draw()
	end
end

return Grid