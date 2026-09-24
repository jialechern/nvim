--- tex.lua
--- 用于配置 tex 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local keys = require('keys.run')

-- LaTeX 常见本地设置
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
