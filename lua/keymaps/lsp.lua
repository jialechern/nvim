-- lsp.lua
-- 防止 neovim 原生 lsp 的按键映射

-- 导入自定义工具函数
local map = require('utils.map').map

map('n', 'gd', vim.lsp.buf.definition,    { desc = "跳转到定义", })
map('n', 'gD', vim.lsp.buf.declaration,   { desc = "跳转到声明", })
map('n', 'gr', vim.lsp.buf.references,    { desc = "查找引用", })
map('n', 'gi', vim.lsp.buf.implementation,{ desc = "跳转到实现", })
map('n', '<LEADER>?',  vim.lsp.buf.hover,         { desc = "悬停文档", })
map('n', '<LEADER>rn', vim.lsp.buf.rename,       { desc = "重命名符号", })
map('n', '<LEADER>ca', vim.lsp.buf.code_action,  { desc = "代码操作", })
map('n', '[d', vim.diagnostic.goto_prev,         { desc = "上一个诊断", })
map('n', ']d', vim.diagnostic.goto_next,         { desc = "下一个诊断", })
map('n', '<LEADER>q', vim.diagnostic.setloclist, { desc = "推送诊断到列表", })

