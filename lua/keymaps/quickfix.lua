--- quickfix.lua
--- 这里放置 quickfix 相关快捷键

local module = {}

--- 引入 map 工具函数以及快捷键
local map = require('utils.map').map
local get_key = require('settings.variables.quickfix').get_key

map('n', get_key('open-fixwindow'), function()
    vim.cmd('copen')
end, { desc = "打开 quickfix 窗口" })

map('n', get_key('close-fixwindow'), function()
    vim.cmd('cclose')
end, { desc = "关闭 quickfix 窗口" })

map('n', get_key('goto'), function()
    local num = vim.fn.input("请输入错误编号: ")
    vim.cmd('cc' .. ' ' .. num)
end, { desc = "跳转到第 n 项" })

map('n', get_key('next'), function()
    vim.cmd('cnext')
end, { desc = "跳转到下一项" })

map('n', get_key('previous'), function()
    vim.cmd('cprevious')
end, { desc = "跳转到上一项" })

map('n', get_key('first'), function()
    vim.cmd('cfirst')
end, { desc = "跳转到首项" })

map('n', get_key('last'), function()
    vim.cmd('clast')
end, { desc = "跳转到末项" })

map('n', get_key('next-file'), function()
    vim.cmd('cnfile')
end, { desc = "跳转到下一个文件中的第一项" })

map('n', get_key('prev-file'), function()
    vim.cmd('cpfile')
end, { desc = "跳转到上一个文件中的最后一项" })

return module

