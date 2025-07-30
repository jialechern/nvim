-- split.lua
-- 存放分屏的按键

local module = {}

local split_leader = '<C-s>'

module.split_leader = split_leader

local function get_key(v)
    if v == 'up' then
        return split_leader .. 'k'
    elseif v == 'down' then
        return split_leader .. 'j'
    elseif v == 'left' then
        return split_leader .. 'h'
    elseif v == 'right' then
        return split_leader .. 'l'
    else
        return nil
    end
end

module.get_key = get_key

return module

