-- - settings-documentation-comments-for-code.lua

local module = {}

-- 设置一个函数根据当前文件名获取文档注释符号
function GetDocumentationComment()
    local filetype = vim.bo.filetype
    local comment_prefix
    if filetype == 'rust' or
        filetype == 'c' or
        filetype == 'cpp'
        then
            comment_prefix = function ()
                return '/// '
            end
    else
            comment_prefix = nil
    end
        return comment_prefix
end

-- 注册函数
module.GetDocumentationComment = GetDocumentationComment

return module

