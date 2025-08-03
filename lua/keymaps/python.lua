--- python.lua

--- 自动解释运行
require('settings.autocmd-by-filetype').cmds['python'] = function ()
    vim.cmd('set makeprg=python3\\ %')
    vim.cmd('silent write')
    vim.cmd('make')
end

