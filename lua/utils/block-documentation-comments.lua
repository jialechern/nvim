-- - block-documentation-comments-for-code.lua

local module = {}

-- 设置一个函数根据当前文件名获取块文档注释符号
function GetBlockDocumentationComment()
    local filetype = vim.bo.filetype
    local comment_prefix = require('settings.settings-block-documentation-comments').block_documentation_comments[filetype]
    return comment_prefix
  end

-- 注册函数
module.GetBlockDocumentationComment = GetBlockDocumentationComment

return module

