-- block-code-comments.lua
-- 这是一个用于返回代码块注释的工具函数

local module = {}

-- 设置一个函数根据当前文件名获取块注释符号
function GetBlockComment()
    local filetype = vim.bo.filetype
    local comment_prefix = require('settings.block-code-comments').block_comments[filetype]
    return comment_prefix
  end

-- 注册为函数
module.GetBlockComment = GetBlockComment

return module

