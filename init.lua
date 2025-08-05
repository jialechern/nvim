-- init.lua

-- 导入是否加载插件的配置
-- 如果没有加载插件的配置，则默认加载插件
local LoadPlugins
local ok, m = pcall(require, 'settings.load_plugins')
if ok then
    LoadPlugins = m.LoadPlugins
else
    LoadPlugins = true
end

-- 指定插件位置，不存在则clone到本地
local sep = require('utils.path').path_prefix
local lazypath = vim.fn.stdpath('data') .. sep .. 'lazy' .. sep .. 'lazy.nvim'
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

-- 加载配置初始化时必要的符号
require('settings.init-symbols')

-- 设置插件管理器: 使用 Lazy.nvim 下载 CONFIG_ROOT/lua/plugins/ 下定义的插件
if LoadPlugins then
    require('lazy').setup({
            spec = {
                -- 插件目录
                { import = 'plugins' },
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

    -- 加载 lsp server 管理器配置
    require('settings.mason')
end

-- 一般设置
require('settings')

-- 键盘映射
require('keymaps')

