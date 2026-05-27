-- javascript.lua
--- 用于配置 javascript 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local run_key = require('settings.variables.run').run_key

-- 设置解释器
vim.bo.makeprg = 'node'

-- 设置格式化工具
vim.bo.formatprg = 'prettierd %'

-- 启用 TypeScript/JavaScript LSP
require('utils.lsp_enable').enable('ts_ls')

--- 自动运行
map('n', run_key, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { desc = '运行 javascript 语言文件' })

