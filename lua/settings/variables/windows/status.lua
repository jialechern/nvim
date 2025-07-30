-- status.lua
-- 存放分屏时控制分屏状态的按键

local module = {}

local status_leader = 'C-A-'

module.status_leader = status_leader
local split_leader = require('settings.variables.windows.split').split_leader

local function get_key(v)
    if v == 'up' then
        return '<' .. status_leader .. 'Up>'
    elseif v == 'down' then
        return '<' .. status_leader .. 'Down>'
    elseif v == 'left' then
        return '<' .. status_leader .. 'Left>'
    elseif v == 'right' then
        return '<' .. status_leader .. 'Right>'
    elseif v == 'H' then
        return split_leader .. 'h'
    elseif v == 'V' then
        return split_leader .. 'v'
    else
        return nil
    end
end

module.get_key = get_key


return module

