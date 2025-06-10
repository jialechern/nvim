-- - settings-code-block.lua

-- 设置一个函数根据当前文件名获取块文档注释符号
function GetCodeBlock()
    local filetype = vim.bo.filetype
    local code_block
    if filetype == 'rust' or
        filetype == 'javascript' or
        filetype == 'typescript' or
        filetype == 'c' or
        filetype == 'cpp'
        then
            code_block = '{<CR>}' .. '<Esc>O'
    elseif filetype == 'bash' or
            filetype == 'zsh'
        then
            code_block = 'do<CR>done' .. '<Esc>O'
    elseif filetype == 'fish'
        then
            code_block = 'begin<CR>end' .. '<Esc>O'
    elseif filetype == 'tex'
        then
            code_block = '\\begin{}<CR>\\end{' .. _G.Next .. '}' .. '<Esc>k$i'
    else
        code_block = nil
  end
    return code_block
  end

-- 注册为全局函数
_G.GetCodeBlock = GetCodeBlock

