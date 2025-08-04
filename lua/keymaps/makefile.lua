-- makefile.lua

-- 引入自定义工具函数
local map = require('utils.map').map

--- 自动运行

require('settings.autocmd-by-filetype').cmds['make'] = function ()
    vim.bo.makeprg = 'make -f %:p'
    vim.cmd('silent write')
    vim.cmd('make')
end

