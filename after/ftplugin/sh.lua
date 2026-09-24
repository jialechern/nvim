--- sh.lua

local map = require('utils.map').map
local keys = require('keys.run')

vim.bo.makeprg = 'sh'

-- 不接外部格式化工具: gq 走内置排版
vim.bo.formatprg = ''

map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { buffer = 0 })

