--- lua.lua

-- 自动解释运行
require('settings.autocmd-by-filetype').cmds['lua'] = function ()
    vim.cmd('set makeprg=lua\\ %')
    vim.cmd('silent write')
    vim.cmd('make')
end
