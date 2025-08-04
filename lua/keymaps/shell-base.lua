-- shell-base.lua

-- 支持的 shell 语言
local langs = {
    'sh',
    'zsh',
    'bash',
}

------------------------------------- 自动运行 ----------------------------------

for _, lang in ipairs(langs) do
    require('settings.autocmd-by-filetype').cmds[lang] = function ()
        vim.bo.makeprg = lang .. ' ' .. '%:p'
        vim.cmd('silent write')
        vim.cmd('make')
    end
end

