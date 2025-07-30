-- status.lua
-- 控制分屏窗口状态

-- 导入自定义工具函数与需要的符号
local map = require('utils.map').map
local get_key = require('settings.variables.windows.status').get_key

map('n', get_key('V'), function ()
    vim.cmd('wincmd t')
    vim.cmd('wincmd H')
end, { desc = "更改横向分屏为纵向" })

map('n', get_key('H'), function ()
    vim.cmd('wincmd t')
    vim.cmd('wincmd K')
end, { desc = "更改纵向分屏为横向" })

map('n', get_key('up'), function ()
    vim.cmd('wincmd K')
end, { desc = "将当前分屏移至最上" })

map('n', get_key('down'), function ()
    vim.cmd('wincmd J')
end, { desc = "将当前分屏移至最下" })

map('n', get_key('left'), function ()
    vim.cmd('wincmd H')
end, { desc = "将当前分屏移至最左" })

map('n', get_key('right'), function ()
    vim.cmd('wincmd L')
end, { desc = "将当前分屏移至最右" })


