-- - init.lua

-- begin 指定插件位置，不存在则clone到本地
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- end 指定插件位置，不存在则clone到本地

-- 引入自定义配置工具集
-- local map_by_modes = require('utils.map').map_by_modes
local map_by_modes = require('utils.map').map_by_modes
local loadcfg = require('utils.loadcfg').loadcfg

-- 一个简单的与先前 LoadNvimConfigFile 函数的兼容措施, 不久后将会被移除
_G.LoadNvimConfigFile = loadcfg

-- 自动编译运行
loadcfg("/init/auto-cmd-by-file-type.lua")

-- 需要在加载插件之前引入 leader 键
vim.g.mapleader = ">"
-- 副转译字符
_G.CoLeader = "`"
-- 快速移动所跨越的行数
_G.FastMoveLines = 5

-- 设置进入一般模式的快捷键
map_by_modes({ 'i', 'v', 'x' }, '<C-_>', function ()
    vim.cmd('stopinsert')
end, { desc = "一个更加常用的进入 normal 模式的快捷键" })

-- 设置跳转锚点的符号
_G.NextSymbol = "<++>"
-- 跳转锚点
_G.Next = _G.NextSymbol
-- 键盘映射终止符
_G.End = " "

-- 设置插件管理器: 使用 Lazy.nvim 下载 CONFIG_ROOT/lua/plugins/ 下定义的插件
require("lazy").setup('plugins')

-- 一般设置
require('settings')

-- 键盘映射
require('keymaps')

