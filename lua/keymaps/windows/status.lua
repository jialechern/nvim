--- status.lua
--- 分屏布局调整映射 (键位与描述见 lua/keys/windows/status.lua)

local map = require('utils.map').map
local keys = require('keys.windows.status')

map(keys.to_vertical, function()
    vim.cmd('wincmd t')
    vim.cmd('wincmd H')
end)

map(keys.to_horizontal, function()
    vim.cmd('wincmd t')
    vim.cmd('wincmd K')
end)

map(keys.up, function()
    vim.cmd('wincmd K')
end)

map(keys.down, function()
    vim.cmd('wincmd J')
end)

map(keys.left, function()
    vim.cmd('wincmd H')
end)

map(keys.right, function()
    vim.cmd('wincmd L')
end)
