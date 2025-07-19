-- - settings-block-documentation-comments-for-code.lua

local module = {}

local block_documentation_comments = {}

for _, key in ipairs({
    'c',
    'cpp',
    'rust',
    'javascript',
    'typescript',
}) do
    block_documentation_comments[key] = function ()
        return '/**' .. '<CR>' .. '*/' .. '<Esc>O'
    end
end

block_documentation_comments['python'] = function ()
    return '"""' .. '<CR>' .. '"""' .. '<Esc>O'
end

module.block_documentation_comments = block_documentation_comments

return module

