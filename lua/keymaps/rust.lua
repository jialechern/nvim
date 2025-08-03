--- rust.lua

--- 自动编译运行

require('settings.autocmd-by-filetype').cmds['rust'] = function ()
    vim.bo.makeprg = 'cargo run'
    vim.cmd('silent write')
    vim.cmd('make')
end


