--
--
Util = {}

-- quick lua implementation of "random" UUID
-- https://gist.github.com/jrus/3197011
--
function Util:uuid()
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return gsub(template, '[xy]', function (c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return format('%x', v)
    end)
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

--
function Util:HSL(h, s, l, a)
    if s<=0 then return l,l,l,a end

    h, s, l = h/256*6, s/255, l/255

	local c = (1-math.abs(2*l-1))*s
	local x = (1-math.abs(h%2-1))*c
    local m,r,g,b = (l-.5*c), 0,0,0

	if h < 1     then r,g,b = c,x,0
    elseif h < 2 then r,g,b = x,c,0
    elseif h < 3 then r,g,b = 0,c,x
    elseif h < 4 then r,g,b = 0,x,c
    elseif h < 5 then r,g,b = x,0,c
    else              r,g,b = c,0,x
    end

    return (r+m)*255,(g+m)*255,(b+m)*255,a
end

function Util:RGBA (r, g, b, a)
    r = r or 255
    g = g or 255
    b = b or 255
    a = a or 1

    return {r/255, g/255, b/255, a}
end