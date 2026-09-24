--- haskell.lua

local map = require('utils.map').map
local keys = require('keys.run')

-- haskell 惯例: 2 空格缩进
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true

-- 设置解释器
vim.bo.makeprg = 'ghc'

-- 设置格式化工具
vim.bo.formatprg = 'ormolu --stdin-input-source %'

--- 自动运行
map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { buffer = 0 })
