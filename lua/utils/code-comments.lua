-- code-comments.lua
-- 根据文件类型获取注释前缀

local module = {}

function GetComment()
    local filetype = vim.bo.filetype
    local comment_prefix = require('settings.code-comments').comment_prefixs[filetype]
    return comment_prefix
end

-- 注册函数
module.GetComment = GetComment

return module

