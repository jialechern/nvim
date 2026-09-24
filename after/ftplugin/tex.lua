--- tex.lua

local map = require('utils.map').map
local keys = require('keys.run')

vim.bo.textwidth = 80
vim.wo.wrap = false

vim.bo.makeprg = 'latexmk'
vim.bo.formatprg = 'latexindent -m'

map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make')
end, { buffer = 0 })
