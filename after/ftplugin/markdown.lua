-- markdown.lua
-- 用于配置 markdown 的快捷键映射

-- -- 导入自定义的工具函数以及需要的符号
-- local map = require('utils.map').map
-- local run_key = require('settings.variables.run').run_key

-- 让 markdown 文件启用 marksman
require('utils.lsp_enable').enable('marksman')

-- markdown 编辑习惯
vim.bo.textwidth = 80
vim.wo.spell = true
vim.wo.wrap = true

