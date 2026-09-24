--- tex.lua

local map = require('utils.map').map
local keys = require('keys.run')

vim.bo.textwidth = 80
vim.wo.wrap = false

-- 设置编译器
vim.bo.makeprg = 'latexmk'

-- 设置格式化工具
vim.bo.formatprg = 'latexindent -m -st'

--- 自动编译
map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make')
end, { buffer = 0 })
