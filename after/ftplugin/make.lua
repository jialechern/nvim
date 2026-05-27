--- makefile.lua
--- 用于配置 make 的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local run_key = require('settings.variables.run').run_key

-- 设置解释器
vim.bo.makeprg = 'make'

--- 自动运行
map('n', run_key, function ()
    vim.cmd('silent write')
    vim.cmd('make -f %:p')
end, { desc = '运行 Makefile' })

