-- size.lua
-- 存放分屏时屏幕尺寸的按键

local module = {}

-- 移动尺寸
module.size = 5

local size_leader = 'C-'

module.size_leader = size_leader

local function get_key(v)
    if v == 'left' then
        return '<' .. size_leader .. 'Left>'
    elseif v == 'right' then
        return '<' .. size_leader .. 'Right>'
    elseif v == 'up' then
        return '<' .. size_leader .. 'Up>'
    elseif v == 'down' then
        return '<' .. size_leader .. 'Down>'
    else
        return nil
    end
end

module.get_key = get_key

return module

