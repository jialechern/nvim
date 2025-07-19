-- functions.lua
-- 这是一个根据不同的程序类型生成对应的函数片段的方法

local module = {}

local function GetFunction()
    local filetype = vim.bo.filetype
    local func = require('settings.functions').functions[filetype]
    return func
end

module.GetFunction = GetFunction

return module

