--- buffers.lua
--- 缓冲区相关映射 (键位与描述见 lua/keys/buffers.lua)

local map = require('utils.map').map
local keys = require('keys.buffers')

map(keys.previous, function()
    vim.cmd('bprevious')
end)

map(keys.next, function()
    vim.cmd('bnext')
end)

map(keys.first, function()
    vim.cmd('bfirst')
end)

map(keys.last, function()
    vim.cmd('blast')
end)

map(keys.list, function()
    vim.cmd('buffers')
end)

map(keys.goto_buffer, function()
    ---@type string
    local num = vim.fn.input('请输入缓冲区编号: ')
    vim.cmd('buffer ' .. num)
end)

map(keys.alternate_file, function()
    vim.cmd('e #')
end)
