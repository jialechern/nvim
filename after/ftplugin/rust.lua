--- rust.lua

local map = require('utils.map').map
local keys = require('keys.run')

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true

vim.bo.makeprg = 'cargo'
vim.bo.formatprg = 'rustfmt --emit stdout'

map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make run')
end, { buffer = 0 })
