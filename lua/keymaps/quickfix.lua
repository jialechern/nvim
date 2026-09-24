--- quickfix.lua
--- quickfix / location list 相关映射 (键位与描述见 lua/keys/quickfix.lua)

local map = require('utils.map').map
local keys = require('keys.quickfix')

map(keys.open_fixwindow, function()
    vim.cmd('copen')
end)

map(keys.close_fixwindow, function()
    vim.cmd('cclose')
end)

map(keys.goto_item, function()
    ---@type string
    local num = vim.fn.input('请输入条目编号: ')
    vim.cmd('cc ' .. num)
end)

map(keys.next, function()
    vim.cmd('cnext')
end)

map(keys.previous, function()
    vim.cmd('cprevious')
end)

map(keys.first, function()
    vim.cmd('cfirst')
end)

map(keys.last, function()
    vim.cmd('clast')
end)

map(keys.next_file, function()
    vim.cmd('cnfile')
end)

map(keys.prev_file, function()
    vim.cmd('cpfile')
end)

map(keys.prev_list, function()
    vim.cmd('colder')
end)

map(keys.prev_list_by_index, function()
    ---@type string
    local num = vim.fn.input('请输入回溯次数: ')
    vim.cmd(num .. 'colder')
end)

map(keys.next_list, function()
    vim.cmd('cnewer')
end)

map(keys.next_list_by_index, function()
    ---@type string
    local num = vim.fn.input('请输入跳转次数: ')
    vim.cmd(num .. 'cnewer')
end)
