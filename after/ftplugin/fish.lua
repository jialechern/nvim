--- fish.lua
--- 用于配置 fish 的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local keys = require('keys.run')

-- 设置解释器
vim.bo.makeprg = 'fish'

--- 自动运行
map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { buffer = 0 })

