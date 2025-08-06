--- typst.lua
--- 用于配置 typst 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local autocmd_key = require('settings.variables.auto-run').autocmd_key

-- 设置编译器
vim.bo.makeprg = 'typst'

--- 自动预览
map('n', autocmd_key, function ()
    vim.cmd('silent TypstPreview')
end, { desc = '预览 typst 语言文件' })

