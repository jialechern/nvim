-- haskell.lua
--- 用于配置 haskell 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local run_key = require('settings.variables.run').run_key


-- 让 haskell 启用 lsp 服务
require('utils.lsp_enable').enable('hls')

-- haskell 编辑习惯
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true


-- 设置解释器
vim.bo.makeprg = 'ghc'

-- 设置格式化工具
vim.bo.formatprg = 'ormolu --stdin-input-source %'

--- 自动运行
map('n', run_key, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { desc = '运行 haskell 语言文件' })

