-- split.lua
-- 控制分屏

-- 导入自定义工具函数与需要的符号
local map = require('utils.map').map
local get_key = require('settings.variables.windows.split').get_key

map('n', get_key('up'), function ()
    vim.cmd('set nosplitbelow')
    vim.cmd('split')
end, { desc = "向上分屏" })

map('n', get_key('down'), function ()
    vim.cmd('set splitbelow')
    vim.cmd('split')
end, { desc = "向下分屏" })

map('n', get_key('left'), function ()
    vim.cmd('set nosplitright')
    vim.cmd('vsplit')
end, { desc = "向左分屏" })

map('n', get_key('right'), function ()
    vim.cmd('set splitright')
    vim.cmd('vsplit')
end, { desc = "向右分屏" })

