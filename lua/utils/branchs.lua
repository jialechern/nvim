-- branchs.lua
-- 这是一个生成并返回配置好的分支型代码片段的函数

local module = {}

local function GetBrach(type)
    local filetype = vim.bo.filetype
    local branchs = require('settings.branchs').branchs[filetype]

    if not branchs then
        return nil
    end

    return branchs[type]
end

module.GetBrach = GetBrach

return module

