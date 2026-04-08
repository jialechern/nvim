--- rust.lua
--- 用于配置 rust 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local run_key = require('settings.variables.run').run_key

-- 让 rust 文件启用 rust_analyzer
require('utils.lsp_enable').enable('rust_analyzer')

-- Rust 常见缩进设置
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true

-- 设置编译方式
vim.bo.makeprg = 'cargo'

-- 代码格式化工具
vim.bo.formatprg = 'rustfmt --emit stdout'

--- 自动编译运行
map('n', run_key, function ()
    vim.cmd('silent write')
    vim.cmd('make run')
end, { desc = '编译运行 rust 项目' })

