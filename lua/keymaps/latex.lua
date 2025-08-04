-- latex.lua

--- 自动编译

require('settings.autocmd-by-filetype').cmds['tex'] = function ()
    vim.bo.makeprg = 'latexmk'
    vim.cmd('silent write')
    vim.cmd('make')
end

