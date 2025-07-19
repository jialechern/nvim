-- block-documentation-comments-for-code.lua
-- 一个返回当前文件类型的块文档注释符号的函数

local module = {}

function GetBlockDocumentationComment()
    local filetype = vim.bo.filetype
    local comment_prefix = require('settings.block-documentation-comments').block_documentation_comments[filetype]
    return comment_prefix
  end

-- 注册函数
module.GetBlockDocumentationComment = GetBlockDocumentationComment

return module

