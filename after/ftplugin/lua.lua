--- lua.lua
--- 用于配置 lua 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local run_key = require('settings.variables.run').run_key

-- 启用 lsp 服务
require('utils.lsp_enable').enable('lua_ls')

-- 设置缩进
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- 设置解释器
vim.bo.makeprg = 'lua'

-- 自动解释运行
map('n', run_key, function ()
    vim.cmd('silent write')
    vim.cmd('make %:p')
end, { desc = '运行 lua 语言文件' })

