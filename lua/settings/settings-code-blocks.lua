-- - settings-code-block.lua

local module = {}

local code_blocks = {}

for _, key in ipairs({
    'c',
    'cpp',
    'rust',
    'javascript',
    'typescript',
}) do
    code_blocks[key] = function ()
        return '{<CR>}' .. '<Esc>O'
    end
end

for _, key in ipairs({
    'zsh',
    'bash',
}) do
    code_blocks[key] = function ()
        return 'do<CR>done' .. '<Esc>O'
    end
end

code_blocks['fish'] = function ()
    return 'begin<CR>end' .. '<Esc>O'
end

code_blocks['tex'] = function ()
    return '\\begin{}<CR>\\end{' .. _G.Next .. '}' .. '<Esc>k$i'
end

module.code_blocks = code_blocks

return module

