-- markdown.lua
-- 用于配置 markdown 的快捷键映射

-- 让 markdown 文件启用 marksman
require('utils.lsp_enable').enable('marksman')

-- markdown 编辑习惯
vim.bo.textwidth = 80
vim.wo.spell = true
vim.wo.wrap = true

