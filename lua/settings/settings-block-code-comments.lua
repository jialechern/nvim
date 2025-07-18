-- - settings-block-code-comments.lua

-- 设置一个函数根据当前文件名获取块注释符号
function GetBlockComment()
    local filetype = vim.bo.filetype
    local comment_prefix
    if filetype == 'rust' or
        filetype == 'javascript' or
        filetype == 'typescript' or
        filetype == 'c' or
        filetype == 'cpp' or
        filetype == 'typst'
        then
            comment_prefix = '/*' .. '  ' .. '*/' .. '<Esc>F*hi'
    elseif filetype == 'python'
        then
            comment_prefix = '"""' .. ' ' .. _G.CoLeader .. ' ' .. '"""' .. '<Esc>F'.. _G.CoLeader .. 's'
    else
        comment_prefix = nil
  end
    return comment_prefix
  end

-- 注册为全局函数
_G.GetBlockComment = GetBlockComment


