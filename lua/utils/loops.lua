-- loops.lua
-- 这是一个生成并返回配置好的循环型代码片段的函数

local module = {}

local function GetLoop(type)
    local filetype = vim.bo.filetype
    local loops = require('settings.loops').loops[filetype]

    if not loops then
        return nil
    end

    return loops[type]
end

module.GetLoop = GetLoop

return module

