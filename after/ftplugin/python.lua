--- python.lua

local map = require('utils.map').map
local keys = require('keys.run')

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true

vim.bo.makeprg = 'python3'
vim.bo.formatprg = 'black -q -'

map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { buffer = 0 })
