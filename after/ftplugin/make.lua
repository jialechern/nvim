--- make.lua

local map = require('utils.map').map
local keys = require('keys.run')

vim.bo.makeprg = 'make'

map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make -f %:p')
end, { buffer = 0 })

