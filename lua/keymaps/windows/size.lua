-- size.lua
-- 控制窗口大小

-- 导入自定义工具函数与需要的符号
local map = require('utils.map').map
local get_key = require('settings.variables.windows.size').get_key
local size = require('settings.variables.windows.size').size

map('n', get_key('left'), function ()
    vim.cmd('vertical resize -' .. size)
end, { desc = "纵向分屏分界线左移" })

map('n', get_key('right'), function ()
    vim.cmd('vertical resize +' .. size)
end, { desc = "纵向分屏分界线右移" })

map('n', get_key('up'), function ()
    vim.cmd('resize +' .. size)
end, { desc = "横向分屏分界线上移" })

map('n', get_key('down'), function ()
    vim.cmd('resize -' .. size)
end, { desc = "横向分屏分界线下移" })

