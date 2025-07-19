-- - settings-documentation-comments-for-code.lua

local module = {}

-- 设置一个函数根据当前文件名获取文档注释符号
function GetDocumentationComment()
    local filetype = vim.bo.filetype
    local comment_prefix = require('settings.settings-documentation-comments').documentation_comments[filetype]
    return comment_prefix
end

-- 注册函数
module.GetDocumentationComment = GetDocumentationComment

return module

