-- cursor.lua
-- 存放分屏时控制光标位置的按键

local module = {}

local cursor_leader = 'C-'

module.cursor_leader = cursor_leader

local function get_key(v)
    if v == 'left' then
        return '<' .. cursor_leader .. 'h>'
    elseif v == 'right' then
        return '<' .. cursor_leader .. 'l>'
    elseif v == 'down' then
        return '<' .. cursor_leader .. 'j>'
    elseif v == 'up' then
        return '<' .. cursor_leader .. 'k>'
    else
        return nil
    end
end

module.get_key = get_key

return module

