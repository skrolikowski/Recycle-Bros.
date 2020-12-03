-- Game Saver
--

local Saver = {}

-- Write to save file
--
function Saver:save(name, ...)
    lf.write(name .. '.txt', Binser.serialize(...))

    return ...
end

-- Load save file
--
function Saver:load(name)
    if self:exists(name) then
        local data, size = lf.read(name .. '.txt')

        return Binser.deserialize(data)[1]
    end

    return false
end

-- File exists?
--
function Saver:exists(name)
    return self:getInfo(name) ~= nil
end

-- Get file info
--
function Saver:getInfo(name)
    return lf.getInfo(name .. '.txt', 'file')
end

return Saver