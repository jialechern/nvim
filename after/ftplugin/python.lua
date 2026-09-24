--- python.lua
--- 用于配置 python 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local keys = require('keys.run')

-- 启用 lsp 服务
require('utils.lsp_enable').enable({ 'ruff','basedpyright' })

-- python 的本地缩进风格
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true

-- 设置解释器
vim.bo.makeprg = 'python3'

-- 设置格式化工具
vim.bo.formatprg = 'black -q -'

--- 自动解释运行
map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { buffer = 0 })

