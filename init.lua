-- 要使用配置, 需要实现将全局环境 NVIMCONFIGP 的值设置为 nvim/vin 配置文件的路径

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

-- 自动编译运行
vim.cmd('source $NVIMCONFIGP/init/auto-compile.lua')

-- 需要在加载插件之前引入 leader 键
vim.g.mapleader = ">"   
-- 副转译字符
_G.CoLeader = "`"

-- 设置进入一般模式的快捷键
vim.api.nvim_set_keymap('i', '<C-_>', '<Esc>', { noremap = true, silent = true })   
vim.api.nvim_set_keymap('x', '<C-_>', '<Esc>', { noremap = true, silent = true })   

-- 设置跳转锚点的符号
_G.NextSymbol = "<++>"
-- 跳转锚点
_G.Next = _G.NextSymbol

-- require('plugins')		-- 插件配置
-- 照例require一下，如果同时使用vim-plug插件，记得把这个放在vim-plug后面
require("lazy").setup('plugins')

-- 一般设置
require('settings')		

-- 键盘映射
require('keymaps')		


