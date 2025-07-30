-- cursor.lua
-- 控制光标在不同窗口间的移动

-- 导入自定义工具函数与需要的符号
local map = require('utils.map').map
local get_key = require('settings.variables.windows.cursor').get_key

map('n', get_key('left'), function ()
    vim.cmd('wincmd h')
end, { desc = "分屏时光标左移" })

map('n', get_key('right'), function ()
    vim.cmd('wincmd l')
end, { desc = "分屏时光标右移" })

map('n', get_key('up'), function ()
    vim.cmd('wincmd k')
end, { desc = "分屏时光标上移" })

map('n', get_key('down'), function ()
    vim.cmd('wincmd j')
end, { desc = "分屏时光标下移" })

