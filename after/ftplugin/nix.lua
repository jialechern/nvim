--- nix.lua

local map = require('utils.map').map
local keys = require('keys.run')

-- nixpkgs 惯例: 2 空格缩进
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true

-- makeprg 只负责 invoke; 构建目标(flake 属性)由回调传入
vim.bo.makeprg = 'nix build'

vim.bo.formatprg = 'nixfmt -'

map(keys.run_file, function()
    vim.cmd('silent write')
    ---@type string
    local username = vim.fn.input('设定 username 为: ', '')
    if username == '' then
        return
    end
    -- '#' 会被 Ex 展开成 alternate file, 必须转义
    vim.cmd('make .\\#' .. username)
end, { buffer = 0 })
