-- fish.lua

--- 自动运行

require('settings.autocmd-by-filetype').cmds['fish'] = function ()
    vim.bo.makeprg = 'fish %:p'
    vim.cmd('silent write')
    vim.cmd('make')
end

