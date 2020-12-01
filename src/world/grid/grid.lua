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

-- Query - get cell at x/y-coords
--
function Grid:queryRowColAtPoint(x, y)
	return _.__floor(y / self.cellSize) + 1,
	       _.__floor(x / self.cellSize) + 1
end

-- Query - get row/col at x/y-coords
--
function Grid:queryCellAtPoint(x, y)
	return self:queryCell(
		self:queryRowColAtPoint(x, y)
	)
end

-- Query - get cells in bounds
--
function Grid:queryCellsInBounds(aabb)
	local l, t, r, b = aabb:unpack()
	local r1, c1     = self:queryRowColAtPoint(l, t)
	local r2, c2     = self:queryRowColAtPoint(r-0.01, b-0.01)
	local cells      = {}
	local cell

	for r = r1, r2 do
		for c = c1, c2 do
			cell = self:queryCell(r, c)
			
			if cell then
				table.insert(cells, cell)
			end
		end
	end

	return cells
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