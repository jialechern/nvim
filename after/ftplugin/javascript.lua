--- javascript.lua

local map = require('utils.map').map
local keys = require('keys.run')

vim.bo.makeprg = 'node'
vim.bo.formatprg = 'prettierd %'

map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { buffer = 0 })
