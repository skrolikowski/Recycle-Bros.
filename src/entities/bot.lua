-- Bot Entity
--

local Base = require 'src.entities.entity'
local Bot  = Base:extend()

-- New
--
function Bot:new(data)
	Base.new(self, _:merge({ name = 'bot' }, data))
	--

end

function Bot:move(dx, dy)
	Base.move(self, dx, dy)
	--

	-- check for crate
	local crate = self:isBelowCrate()

	-- expedite
	if crate and not crate.isDamaged then
		crate:move(crate.axis)
	end
end

-- Is bot below crate?
--
function Bot:isBelowCrate()
	local cell  = self:cell():above()
	local items = cell.items or {}

	for __, item in pairs(items) do
		if item == 'crate' then
			return item
		end
	end

	return false
end

return Bot