-- 要使用配置, 需要实现将全局环境 NVIMCONFIGP 的值设置为 nvim/vin 配置文件的路径
-- 指定插件位置，不存在则clone到本地
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

-- 照例require一下，如果同时使用vim-plug插件，记得把这个放在vim-plug后面
require("lazy").setup('plugins')


-- vim.cmd('source $NVIMCONFIGP/init.vim')			-- 使用传统 vim 配置文件
-- require('plugins')		-- 插件配置
require('settings')		-- 一般设置
require('keymaps')		-- 键盘映射


