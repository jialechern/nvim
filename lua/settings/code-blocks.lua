-- settings-code-block.lua

local module = {}

local code_blocks = {}

for _, key in ipairs({
    'c',
    'cpp',
    'rust',
    'javascript',
    'typescript',
}) do
    code_blocks[key] = function () return
        '{' .. _G.CoLeader .. '}'                               .. '<Esc>F' .. _G.CoLeader .. 's'
    end
end

for _, key in ipairs({
    'zsh',
    'bash',
}) do
    code_blocks[key] = function () return
        'do<CR>done' .. '<Esc>O'
    end
end

code_blocks['fish'] = function () return
    'begin<CR>end' .. '<Esc>O'
end

code_blocks['tex'] = function () return
'\\begin{' .. _G.CoLeader .. '}<CR>\\end{' .. _G.Next .. '}'.. '<Esc>k0f' .. _G.CoLeader .. 's'
end

code_blocks['typst'] = function () return
    '#{' .. _G.CoLeader .. '}'                                  .. '<Esc>F' .. _G.CoLeader .. 's'
end

code_blocks['lua'] = function () return
    'do<CR>end' .. '<Esc>O'
end

module.code_blocks = code_blocks

return module

