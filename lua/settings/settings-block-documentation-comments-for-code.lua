-- - settings-block-documentation-comments-for-code.lua

local module = {}

-- 设置一个函数根据当前文件名获取块文档注释符号
function GetBlockDocumentationComment()
    local filetype = vim.bo.filetype
    local comment_prefix
    if filetype == 'rust' or
        filetype == 'javascript' or
        filetype == 'typescript' or
        filetype == 'c' or
        filetype == 'cpp'
        then
            comment_prefix = function ()
                return '/**' .. '<CR>' .. '*/' .. '<Esc>O'
            end
    elseif filetype == 'python' 
        then
            comment_prefix = function ()
                return '"""' .. '<CR>' .. '"""' .. '<Esc>O'
            end
    else
        comment_prefix = nil
  end
    return comment_prefix
  end

-- 注册函数
module.GetBlockDocumentationComment = GetBlockDocumentationComment

return module

