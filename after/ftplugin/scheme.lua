--- scheme.lua
--- 用于配置 scheme 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local run_key = require('settings.variables.run').run_key

-- 让 scheme 文件启用
require('utils.lsp_enable').enable('guile_lsp_server')

-- Scheme 常见缩进设置 (Lisp 系惯例: 2 空格)
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- Lisp 风格缩进 (依赖括号而非缩进推断层级)
vim.opt_local.lisp = true

-- 代码格式化工具 (guile 自带 --format, 需 guile 3.0+)
vim.bo.formatprg = 'guile --format'

-- 设置运行方式: 直接用 guile 解释当前文件
vim.bo.makeprg = 'guile %'

--- 自动保存并运行当前 scheme 文件
map('n', run_key, function()
    vim.cmd('silent write')
    vim.cmd('make')
end, { desc = '运行当前 scheme 文件 (guile)' })
