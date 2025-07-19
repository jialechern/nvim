-- - settings-code-comments.lua

local module = {}

-- 设置一个函数根据当前文件名获取注释符号
function GetComment()
    local filetype = vim.bo.filetype
    local comment_prefix
    if filetype == 'python' or
        filetype == 'make' or
        filetype == 'bash' or
        filetype == 'zsh' or
        filetype == 'sh' or
        filetype == 'sshconfig' or
        filetype == 'fish' or
        filetype == 'toml' or
        filetype == 'conf'
        then
            comment_prefix = function ()
                return '# '
            end
    elseif filetype == 'c' or
        filetype == 'cpp' or
        filetype == 'rust' or
        filetype == 'javascript' or
        filetype == 'typescript' or
        filetype == 'typst'
        then
            comment_prefix = function ()
                return '// '
            end
    elseif filetype == 'lua' or
        filetype == 'haskell'
        then
            comment_prefix = function ()
                return '-- '
            end
    elseif filetype == 'tex'
        then
            comment_prefix =function ()
                return '% '
            end
    else
            comment_prefix = nil
  end
    return comment_prefix
end

-- 注册函数
module.GetComment = GetComment

return module

