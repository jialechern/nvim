-- - settings_block_documentation_comments_for_code.lua

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
            comment_prefix = '/**' .. '<CR>' .. '*/' .. '<Esc>O'
    elseif filetype == 'python' 
        then
            comment_prefix = '"""' .. '<CR>' .. '"""' .. '<Esc>O'
    else
        comment_prefix = nil
  end
    return comment_prefix
  end

-- 注册为全局函数
_G.GetBlockDocumentationComment = GetBlockDocumentationComment

