--- tabs.lua
--- 标签页相关映射 (键位与描述见 lua/keys/tabs.lua)

local map = require('utils.map').map
local keys = require('keys.tabs')

map(keys.edit, function()
    ---@type string
    local file = vim.fn.input('请输入文件名: ', '', 'file')
    vim.cmd('tabedit ' .. vim.fn.fnameescape(file))
end)

map(keys.list, function()
    vim.cmd('tabs')
end)

map(keys.new, function()
    vim.cmd('tabnew')
end)

map(keys.close, function()
    vim.cmd('tabclose')
end)

map(keys.only, function()
    vim.cmd('tabonly')
end)

map(keys.window_to_tab, function()
    vim.cmd('wincmd T')
end)

map(keys.next, function()
    vim.cmd('tabnext')
end)

map(keys.previous, function()
    vim.cmd('tabprevious')
end)

map(keys.goto_tab, function()
    ---@type string
    local num = vim.fn.input('请输入标签页编号: ')
    vim.cmd('tabnext ' .. num)
end)

map(keys.move, function()
    ---@type string
    local num = vim.fn.input('请输入标签页编号: ')
    vim.cmd('tabmove ' .. num)
end)

map(keys.first, function()
    vim.cmd('tabfirst')
end)

map(keys.last, function()
    vim.cmd('tablast')
end)
