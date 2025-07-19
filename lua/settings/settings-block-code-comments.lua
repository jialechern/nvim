-- - settings-block-code-comments.lua

local module = {}

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
            comment_prefix = function ()
                return '/*' .. '  ' .. '*/' .. '<Esc>F*hi'
            end
    elseif filetype == 'python'
        then
            comment_prefix = function ()
            return '"""' .. ' ' .. _G.CoLeader .. ' ' .. '"""' .. '<Esc>F'.. _G.CoLeader .. 's'
            end
    else
        comment_prefix = nil
  end
    return comment_prefix
  end

-- 注册为函数
module.GetBlockComment = GetBlockComment

return module

