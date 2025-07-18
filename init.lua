-- - init.lua

-- 导入是否加载插件的配置
local LoadPlugins = require('settings.settings-variables').LoadPlugins

-- begin 指定插件位置，不存在则clone到本地
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if LoadPlugins and vim.loop.fs_stat(lazypath) then
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
local loadcfg = require('utils.loadcfg').loadcfg

-- 一个简单的与先前 LoadNvimConfigFile 函数的兼容措施, 不久后将会被移除
_G.LoadNvimConfigFile = loadcfg

-- 加载配置初始化时必要的符号
loadcfg('/init/symbols.lua')

-- 设置插件管理器: 使用 Lazy.nvim 下载 CONFIG_ROOT/lua/plugins/ 下定义的插件
if LoadPlugins then
    require("lazy").setup('plugins')
end

-- 一般设置
require('settings')

-- 键盘映射
require('keymaps')

