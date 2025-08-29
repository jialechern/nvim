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

map('n', get_key('prev-quickfix-list'), function()
    vim.cmd('colder')
end, { desc = "回溯到上一个 quickfix" })

map('n', get_key('prev-quickfix-list-by-index'), function()
    local num = vim.fn.input("请输入回溯次数: ")
    vim.cmd(num .. 'colder')
end, { desc = "回溯到前 n 个 quickfix" })

map('n', get_key('next-quickfix-list'), function()
    vim.cmd('cnewer')
end, { desc = "跳转到下一个 quickfix" })

map('n', get_key('next-quickfix-list-by-index'), function()
    local num = vim.fn.input("请输入跳转次数: ")
    vim.cmd(num .. 'cnewer')
end, { desc = "跳转到第 n 个 quickfix" })

map('n', get_key('help'), function()
    local help_text = [[
quickfix 快捷键帮助手册:
    %s : 打开 quickfix 窗口
    %s : 关闭 quickfix 窗口
    %s : 跳转到第 n 项
    %s : 跳转到下一项
    %s : 跳转到上一项
    %s : 跳转到首项
    %s : 跳转到末项
    %s : 跳转到下一个文件中的第一项
    %s : 跳转到上一个文件中的最后一项
    %s : 跳转到下一个 quickfix 列表
    %s : 跳转到第 n 个 quickfix 列表
    %s : 回溯到上一个 quickfix 列表
    %s : 回溯到前 n 个 quickfix 列表
    ]]
    vim.notify(help_text:format(
        get_key('open-fixwindow'),
        get_key('close-fixwindow'),
        get_key('goto'),
        get_key('next'),
        get_key('previous'),
        get_key('first'),
        get_key('last'),
        get_key('next-file'),
        get_key('prev-file'),
        get_key('next-quickfix-list'),
        get_key('next-quickfix-list-by-index'),
        get_key('prev-quickfix-list'),
        get_key('prev-quickfix-list-by-index')
    ), vim.log.levels.INFO, { title = "Quickfix 帮助手册" })
end, { desc = "显示 quickfix 帮助手册" })

return module

