-- help.lua
-- 显示分屏相关的快捷键文档

-- 导入自定义工具函数与需要的符号
local map = require('utils.map').map
local get_key = require('settings.variables.windows.help').get_key
local get_split_key = require('settings.variables.windows.split').get_key
local get_size_key = require('settings.variables.windows.size').get_key
local get_cursor_key = require('settings.variables.windows.cursor').get_key
local get_status_key = require('settings.variables.windows.status').get_key

map('n', get_key(), function ()
    local help_text = [[
分屏快捷键文档:
分屏操作:
    %s: 向上分屏
    %s: 向下分屏
    %s: 向左分屏
    %s: 向右分屏
窗口大小调整:
    %s: 纵向分屏分界线左移
    %s: 纵向分屏分界线右移
    %s: 横向分屏分界线上移
    %s: 横向分屏分界线下移
光标移动:
    %s: 分屏时光标左移
    %s: 分屏时光标右移
    %s: 分屏时光标上移
    %s: 分屏时光标下移
窗口状态调整:
    %s: 更改横向分屏为纵向
    %s: 更改纵向分屏为横向
    %s: 将当前分屏移至最上
    %s: 将当前分屏移至最下
    %s: 将当前分屏移至最左
    %s: 将当前分屏移至最右
    ]]
    vim.notify(help_text:format(
        get_split_key('up'), get_split_key('down'), get_split_key('left'), get_split_key('right'),
        get_size_key('left'), get_size_key('right'), get_size_key('up'), get_size_key('down'),
        get_cursor_key('left'), get_cursor_key('right'), get_cursor_key('up'), get_cursor_key('down'),
        get_status_key('V'), get_status_key('H'), get_status_key('up'), get_status_key('down'), get_status_key('left'), get_status_key('right')
    ), vim.log.levels.INFO, { title = "分屏快捷键文档" })
end, { desc = "显示分屏相关的快捷键文档" })

