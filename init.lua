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
-- begin    配置自动运行或是编译文件
function Run()
    local extension = vim.fn.expand('%:e')
    if extension == 'py' then
        vim.cmd('!python3 %')
    elseif extension == 'md' then
        vim.cmd('MarkdownPreview')
    else
        print('No command for this file type.')
    end
end

vim.api.nvim_set_keymap('n', '<A-r>', ':lua Run()<CR>', { noremap = true, silent = true })
-- end      配置自动运行或是编译文件

-- 照例require一下，如果同时使用vim-plug插件，记得把这个放在vim-plug后面
vim.g.mapleader = ">"   -- 需要在加载插件之前引入 leader 键
require("lazy").setup('plugins')


-- vim.cmd('source $NVIMCONFIGP/init.vim')			-- 使用传统 vim 配置文件
-- require('plugins')		-- 插件配置
require('settings')		-- 一般设置
require('keymaps')		-- 键盘映射


