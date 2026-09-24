--- fish.lua

local map = require('utils.map').map
local keys = require('keys.run')

vim.bo.makeprg = 'fish'

map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { buffer = 0 })

