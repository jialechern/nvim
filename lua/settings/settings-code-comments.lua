-- - settings-code-comments.lua

local module = {}

local comment_prefixs = {}

for _, key in ipairs({
    'sh',
    'zsh',
    'bash',
    'make',
    'fish',
    'conf',
    'toml',
    'python',
    'sshconfig',
}) do
    comment_prefixs[key] = function ()
        return '# '
    end
end

for _, key in ipairs({
    'c',
    'cpp',
    'rust',
    'javascript',
    'typescript',
    'typst',
}) do
    comment_prefixs[key] = function ()
        return '// '
    end
end

for _, key in ipairs({
    'lua',
    'haskell',
}) do
    comment_prefixs[key] = function ()
        return '-- '
    end
end

comment_prefixs['tex'] = function ()
    return '% '
end

module.comment_prefixs = comment_prefixs

return module

