--- python.lua
--- 用于配置 python 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local autocmd_key = require('settings.variables.auto-run').autocmd_key

-- 设置解释器
vim.bo.makeprg = 'python3'

-- 设置格式化工具
vim.bo.formatprg = 'black -q -'

--- 自动解释运行
map('n', autocmd_key, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { desc = '运行 python 语言文件' })

