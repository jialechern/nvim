-- - code-block.lua

local module = {}

-- 设置一个函数根据当前文件名获取块文档注释符号
function GetCodeBlock()
    local filetype = vim.bo.filetype
    local code_block = require('settings.settings-code-blocks').code_blocks[filetype]
    return code_block
end

-- 注册函数
module.GetCodeBlock = GetCodeBlock

return module

