-- nix.lua
--- 用于配置 nix 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local keys = require('keys.run')

-- 让 nix 文件启用 nixd
require('utils.lsp_enable').enable('nixd')

-- nix 编辑习惯
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true


-- 设置解释器
vim.bo.makeprg = ''

-- 设置格式化工具
vim.bo.formatprg = 'nixpkgs-fmt'

--- 自动运行
map(keys.run_file, function ()
    vim.cmd('silent write')
    local username = vim.fn.input('设定 username 为: ', '')
    vim.cmd('make .#' .. username)
end, { buffer = 0 })

