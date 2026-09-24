--- c.lua

local map = require('utils.map').map
local keys = require('keys.run')

-- 设置编译器
vim.bo.makeprg = 'gcc'

-- 代码格式化工具
vim.bo.formatprg = 'clang-format -style=file'

--- 自动编译
map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p -o %:p:r && %:p:r')
end, { buffer = 0 })
