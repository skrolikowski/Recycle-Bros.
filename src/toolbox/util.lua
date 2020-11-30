--
--
Util = {}

-- quick lua implementation of "random" UUID
-- https://gist.github.com/jrus/3197011
--
function Util:uuid()
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return _.__gsub(template, '[xy]', function (c)
        local v = (c == 'x') and _.__random(0, 0xf) or _.__random(8, 0xb)
        return _.__format('%x', v)
    end)
end

function Util:sign(value)
    if     value > 0 then return  1
    elseif value < 0 then return -1
    end

    return 0
end

-- Create boolean hash table for convenience
--
function Util:toBoolean(value)
	local t = {}

	for __, v in pairs(value) do
		t[v] = true
	end

	return t
end

--
--
function Util:buildDir(path, tbl)
    local files = lf.getDirectoryItems(path)
    local info, name

    tbl = tbl or {}

    for __, file in pairs(files) do
        if not _:startsWith(file, '[.]') then
            info = lf.getInfo(path .. '/' .. file)
            name = string.match(file, "([%a|%-_|%d]+)")

            if info.type == 'directory' then
                tbl = Util:buildDir(path .. '/' .. file, tbl)
            else
                tbl[name] = require(path .. '/' .. name)
            end
        end
    end

    return tbl
end

--
--
function Util:basename(source)
    return string.match(source, "([%a|%-_|%d]+)")
end

--
--
function Util:filenameSplit(source)
    return string.match(source, "(.+%/)([%a|%-_|%d]+)%.(%a+)")
end

--
--
function Util:eightdir(x, y)
    assert(x ~= nil, 'x parameter required')
    assert(y ~= nil, 'y parameter required')
    --
    if not __angles then
        __angles = {
            ['0,0']   = 0,           -- neutral
            ['1,0']   = 0,           -- e
            ['1,1']   = 1*_.__pi/4,  -- n/e
            ['0,1']   = 1*_.__pi/2,  -- n
            ['-1,1']  = 3*_.__pi/4,  -- n/w
            ['-1,0']  =   _.__pi,    -- w
            ['-1,-1'] = 5*_.__pi/4,  -- s/w
            ['0,-1']  = 3*_.__pi/2,  -- s
            ['1,-1']  = 7*_.__pi/4,  -- s/e
        }
    end

    return __angles[x..','..y]
end

--
--
function Util:newAnimation(image, width, height, duration)
    local animation = {}

    animation.spriteSheet = image
    animation.quads = {}

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, lg.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    animation.duration = duration or 1
    animation.currentTime = 0

    return animation
end