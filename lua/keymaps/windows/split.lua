--- split.lua
--- 分屏操作映射 (键位与描述见 lua/keys/windows/split.lua)

local map = require('utils.map').map
local keys = require('keys.windows.split')

map(keys.up, function()
    vim.cmd('set nosplitbelow')
    vim.cmd('split')
end)

map(keys.down, function()
    vim.cmd('set splitbelow')
    vim.cmd('split')
end)

map(keys.left, function()
    vim.cmd('set nosplitright')
    vim.cmd('vsplit')
end)

map(keys.right, function()
    vim.cmd('set splitright')
    vim.cmd('vsplit')
end)
