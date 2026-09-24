--- haskell.lua

local map = require('utils.map').map
local keys = require('keys.run')

-- haskell 惯例: 2 空格缩进
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true

vim.bo.makeprg = 'ghc'
vim.bo.formatprg = 'ormolu --stdin-input-file %'

map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { buffer = 0 })
