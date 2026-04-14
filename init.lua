-- init.lua

-- 加载配置初始化时必要的符号
-- 领头键
_G.Leader = '/'
vim.g.mapleader = _G.Leader
-- 副领头键
_G.LocalLeader = ' '
vim.g.maplocalleader = _G.LocalLeader

-- 指定插件位置, 不存在则clone到本地(版本大于 0.12 则会使用 neovim 原生的插件管理器)
if vim.fn.has('nvim-0.8') == 1 and (not vim.fn.has("nvim-0.12") == 1) then
    local sep = require('utils.path').path_prefix
    local lazypath = vim.fn.stdpath('data') .. sep .. 'lazy' .. sep .. 'lazy.nvim'
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
    	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    	local out = vim.fn.system({
    		"git",
    		"clone",
    		"--filter=blob:none",
    		"--branch=stable", -- latest stable release
    		lazyrepo,
    		lazypath,
    	})
    	if vim.v.shell_error ~= 0 then
    		vim.api.nvim_echo({
    			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
    			{ out, "WarningMsg" },
    			{ "\nPress any key to exit..." },
    		}, true, {})
    		vim.fn.getchar()
    		os.exit(1)
    	end
    end
    vim.opt.rtp:prepend(lazypath)

    -- 设置插件管理器: 使用 Lazy.nvim 下载 CONFIG_ROOT/lua/plugins/ 下定义的插件
    require('lazy').setup({
            spec = {
                -- 插件目录
                { import = 'plugins-old' },
            },
            defaults = {
                -- 默认懒加载插件, 仅在需要时加载插件
                lazy = true,
                -- 默认不锁定插件版本, 使用最新版本的插件
                version = false,
            },
            -- 默认主题
            install = { colorscheme = { 'habamax' } },
            -- 自动检查插件更新
            checker = { enabled = false },
            performance = {
                rtp = {
                    -- 禁用不必要的内置插件
                    disabled_plugins = {
                        'gzip',
                        'tarPlugin',
                        'tohtml',
                        'tutor',
                        'zipPlugin',
                    },
                },
            },
        })
end

-- 一般设置
require('settings')

-- 引入插件
if vim.o.loadplugins then
    require('plugins').setup()
end

-- 键盘映射
require('keymaps')

