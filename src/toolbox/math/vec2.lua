local Modern = require 'vendor.modern'
local Vec2   = Modern:extend()

-- Create new Vector 2D
--
function Vec2:new(x, y)
    self.x = x
    self.y = y
end

-- Unpack
--
function Vec2:unpack()
    return self.x, self.y
end

-- Copy
--
function Vec2:copy()
    return Vec2(self.x, self.y)
end

-- Distance to another Vec2
--
function Vec2:distance(other)
    return sqrt((self.x - other.x) ^ 2 + (self.y - other.y) ^ 2)
end

-- Scale by factor
--
function Vec2:scale(factor)
    self.x = self.x * factor
    self.y = self.y * factor

    return self
end

-- Length of vector
--
function Vec2:magnitude()
    return sqrt(self.x ^ 2 + self.y ^ 2)
end

-- Normalize
--
function Vec2:normalize()
    local mag = self:magnitude()

    if mag > 0 then
        return self:scale(1 / mag)
    end

    return self
end

-- Addition operator
--
function Vec2:__add(other)
    if type(other) == 'number' then
        return Vec2(
            self.x + other,
            self.y + other
        )
    end

    return Vec2(
        self.x + other.x,
        self.y + other.y
    )
end

-- Subtraction operator
--
function Vec2:__sub(other)
    if type(other) == 'number' then
        return Vec2(
            self.x - other,
            self.y - other
        )
    end

    return Vec2(
        self.x - other.x,
        self.y - other.y
    )
end

-- Multiplication operator
--
function Vec2:__mul(other)
    if type(other) == 'number' then
        return self:copy():scale(other)
    end

    return Vec2(
        self.x * other.x,
        self.y * other.y
    )
end

-- Division operator
--
function Vec2:__div(other)
    if type(other) == 'number' then
        return Vec2(
            self.x / other,
            self.y / other
        )
    end

    return Vec2(
        self.x / other.x,
        self.y / other.y
    )
end

-- Equals operator
--
function Vec2:__eq(other)
    return self.x == other.x and self.y == other.y
end

-- Unary minus operator
--
function Vec2:__unm()
    return self:copy():scale(-1)
end

-- __tostring operator
--
function Vec2:__tostring()
    return 'Vec2(' .. self.x .. ', ' .. self.y .. ')'
end

return Vec2