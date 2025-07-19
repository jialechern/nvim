-- documentation-comments-for-code.lua
-- 根据文件类型获取文档注释前缀

local module = {}

function GetDocumentationComment()
    local filetype = vim.bo.filetype
    local comment_prefix = require('settings.documentation-comments').documentation_comments[filetype]
    return comment_prefix
end

-- 注册函数
module.GetDocumentationComment = GetDocumentationComment

return module

