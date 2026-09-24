--- lua.lua
--- 用于配置 lua 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local keys = require('keys.run')

-- 启用 lsp 服务
require('utils.lsp_enable').enable('lua_ls')

-- 设置缩进
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true

-- 设置解释器
vim.bo.makeprg = 'lua'

-- 自动解释运行
map(keys.run_file, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { buffer = 0 })

