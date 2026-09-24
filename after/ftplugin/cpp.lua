--- cpp.lua

local map = require('utils.map').map
local keys = require('keys.run')

vim.bo.makeprg = 'g++'
vim.bo.formatprg = 'clang-format -style=file'

-- <C-e>: 先编译(makeprg 只负责编译, 报错进 quickfix), 无错误再运行产物
map(keys.run_file, function()
    vim.cmd('silent write')
    vim.cmd('make %:p -o %:p:r')
    if #vim.fn.getqflist() == 0 then
        vim.cmd('!' .. vim.fn.shellescape(vim.fn.expand('%:p:r')))
    end
end, { buffer = 0 })
