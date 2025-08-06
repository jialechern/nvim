--- c.lua
--- 用于配置 C 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local autocmd_key = require('settings.variables.auto-run').autocmd_key

-- 设置编译器
vim.bo.makeprg = 'gcc %:p:r.c -o %:p:r && %:p:r'

--- 自动编译
map('n', autocmd_key, function ()
    vim.cmd('silent write')
    vim.cmd('make')
end, { desc = '编译并运行 C 语言文件' })

