--- fish.lua
--- 用于配置 fish 的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local autocmd_key = require('settings.variables.auto-run').autocmd_key

-- 设置解释器
vim.bo.makeprg = 'fish %:p'

--- 自动运行
map('n', autocmd_key, function ()
    vim.cmd('silent write')
    vim.cmd('make')
end, { desc = '运行 fish 文件' })

