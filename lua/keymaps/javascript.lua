-- javascript.lua

--- 自动运行

require('settings.autocmd-by-filetype').cmds['javascript'] = function ()
    vim.bo.makeprg = 'node %:p'
    vim.cmd('silent write')
    vim.cmd('make')
end

