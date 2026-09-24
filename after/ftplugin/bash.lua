--- bash.lua
--- 用于配置 bash 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local keys = require('keys.run')

-- 设置编译方式
vim.bo.makeprg = 'bash'

-- 代码格式化工具
vim.bo.formatprg = ''

--- 自动编译运行
map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { buffer = 0 })

