--- scheme.lua
--- 用于配置 scheme 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local keys = require('keys.run')

-- Scheme 常见缩进设置 (Lisp 系惯例: 2 空格)
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true

-- Lisp 风格缩进 (依赖括号而非缩进推断层级)
vim.bo.lisp = true

-- 代码格式化工具 (guile 自带 --format, 需 guile 3.0+)
vim.bo.formatprg = 'guile --format'

-- 设置运行方式: 直接用 guile 解释当前文件
vim.bo.makeprg = 'guile %'

--- 自动保存并运行当前 scheme 文件
map(keys.run_file, function()
    vim.cmd('silent write')
    vim.cmd('make')
end, { buffer = 0 })
