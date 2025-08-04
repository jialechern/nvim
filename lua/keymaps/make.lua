--- makefile.lua
--- 用于配置 make 的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local autocmd_key = require('settings.variables.auto-run').autocmd_key

--- 自动运行
map('n', autocmd_key, function ()
    vim.bo.makeprg = 'make -f %:p'
    vim.cmd('silent write')
    vim.cmd('make')
end, { desc = '运行 lua 语言文件' })

