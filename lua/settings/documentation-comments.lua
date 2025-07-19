-- - settings-documentation-comments-for-code.lua

local module = {}

local documentation_comments = {}

for _, key in ipairs({
    'c',
    'cpp',
    'rust',
}) do
    documentation_comments[key] = function ()
        return '/// '
    end
end

module.documentation_comments = documentation_comments

return module

