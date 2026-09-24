--- cpp.lua
--- 用于配置 C++ 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local keys = require('keys.run')

-- c++ 文件启用 clangd
require('utils.lsp_enable').enable('clangd')

-- 设置编译器
vim.bo.makeprg = 'g++'

-- 代码格式化工具
vim.bo.formatprg = 'clang-format -style=file'

--- 自动编译
map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p -o %:p:r && %:p:r')
end, { buffer = 0 })

