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

-- begin 定义一个能够自动加载 lua 配置文件的函数
function LoadNvimConfigFile(file)
    local chunk, err = loadfile(vim.fn.stdpath("config") .. file)
    if not chunk then
        error("加载失败: " .. err)
    else
        chunk()
    end
end

_G.LoadNvimConfigFile = LoadNvimConfigFile
-- end 定义一个能够自动加载 lua 配置文件的函数

-- 自动编译运行
_G.LoadNvimConfigFile("/init/auto-compile.lua")

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
-- 键盘映射终止符
_G.End = " "

-- require('plugins')		-- 插件配置
-- 照例require一下，如果同时使用vim-plug插件，记得把这个放在vim-plug后面
require("lazy").setup('plugins')

-- 一般设置
require('settings')		

-- 键盘映射
require('keymaps')		


