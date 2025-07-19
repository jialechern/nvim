-- code-block.lua
-- 根据文件类型获取代码块注释符号

local module = {}

function GetCodeBlock()
    local filetype = vim.bo.filetype
    local code_block = require('settings.code-blocks').code_blocks[filetype]
    return code_block
end

-- 注册函数
module.GetCodeBlock = GetCodeBlock

return module

