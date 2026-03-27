--- tex.lua
--- 用于配置 tex 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local run_key = require('settings.variables.run').run_key

-- 设置编译器
vim.bo.makeprg = 'latexmk'

-- 设置格式化工具
vim.bo.formatprg = 'latexindent -m -st'

--- 自动编译
map('n', run_key, function ()
    vim.cmd('silent write')
    vim.cmd('make')
end, { desc = '编译 tex 语言文件' })

