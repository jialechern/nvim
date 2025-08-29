-- help.lua
-- 存放分屏帮助按键

local module = {}
local split_leader = require('settings.variables.windows.split').split_leader

local function get_key(v)
    return split_leader .. '?'
end

module.get_key = get_key

return module

