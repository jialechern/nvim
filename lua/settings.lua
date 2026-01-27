-- settings.lua

-- 基础配置
require('settings.base')

-- 基本的自动命令
require('settings.autocmds')

-- 设置根据文件扩展名配置文件类型
require('settings.autofiletype-by-fileext')

-- 启用 neovim 原生 lsp
require('settings.lsp')

