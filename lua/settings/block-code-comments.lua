-- - settings-block-code-comments.lua

local module = {}

local block_comments = {}

for _, key in ipairs({
    'c',
    'cpp',
    'rust',
    'typst',
    'javascript',
    'typescript',
}) do
    block_comments[key] = function ()
        return '/*' .. '  ' .. '*/' .. '<Esc>F*hi'
    end
end

block_comments['python'] = function ()
    return '"""' .. ' ' .. _G.CoLeader .. ' ' .. '"""' .. '<Esc>F'.. _G.CoLeader .. 's'
end

module.block_comments = block_comments

return module

