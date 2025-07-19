-- - settings-code-block.lua

local module = {}

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
            code_block = function ()
                return '{<CR>}' .. '<Esc>O'
            end
    elseif filetype == 'bash' or
            filetype == 'zsh'
        then
            code_block = function ()
                return 'do<CR>done' .. '<Esc>O'
            end
    elseif filetype == 'fish'
        then
            code_block = function ()
                return 'begin<CR>end' .. '<Esc>O'
            end
    elseif filetype == 'tex'
        then
            code_block = function ()
                return '\\begin{}<CR>\\end{' .. _G.Next .. '}' .. '<Esc>k$i'
            end
    else
        code_block = nil
    end

    return code_block
end

-- 注册函数
module.GetCodeBlock = GetCodeBlock

return module

