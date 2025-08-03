--- c.lua
--- 用于配置 C 语言的快捷键映射

--- 自动编译
require('settings.autocmd-by-filetype').cmds['c'] = function ()
    vim.bo.makeprg = 'gcc %:p:r.c -o %:p:r && %:p:r'
    vim.cmd('silent write')
    vim.cmd('make')
end

