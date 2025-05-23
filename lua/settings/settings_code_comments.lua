-- - settings_code_comments.lua

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
        filetype == 'toml'
        then
            comment_prefix = '# '
    elseif filetype == 'c' or 
        filetype == 'cpp' or
        filetype == 'rust' or
        filetype == 'javascript' or
        filetype == 'typescript'
        then
            comment_prefix = '// '
    elseif filetype == 'lua' or
        filetype == 'haskell' 
        then
            comment_prefix = '-- '
    elseif filetype == 'tex' 
        then
            comment_prefix = '% '
    else
            comment_prefix = nil
  end
    return comment_prefix
end

-- 注册为全局函数
_G.GetComment = GetComment

