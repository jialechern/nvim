--- scheme.lua

local map = require('utils.map').map
local keys = require('keys.run')

-- Scheme/Lisp 惯例: 2 空格缩进
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true

-- Lisp 系按括号决定缩进层级, 不依赖内容缩进
vim.bo.lisp = true

-- 当前无可用 scheme 格式化器(guile 没有 --format), 故不设 formatprg: gq 走内置排版
vim.bo.makeprg = 'guile %'

map(keys.run_file, function()
    vim.cmd('silent write')
    vim.cmd('make')
end, { buffer = 0 })
