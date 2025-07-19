-- entry-point.lua
-- 这是一个用于生成程序入口函数的工具函数

local module = {}

local function GetEntryPoint()
    local filetype = vim.bo.filetype
    local entry_point = require('settings.entry-points').entry_points[filetype]
    return entry_point
end

module.GetEntryPoint = GetEntryPoint

return module

