-- - code-comments.lua

local module = {}

-- 设置一个函数根据当前文件名获取注释符号
function GetComment()
    local filetype = vim.bo.filetype
    local comment_prefix = require('settings.settings-code-comments').comment_prefixs[filetype]
    return comment_prefix
end

-- 注册函数
module.GetComment = GetComment

return module

