-- settings.lua

-- 基础配置
require('settings.base')

-- 设置根据文件扩展名配置文件类型
require('settings.autofiletype-by-fileext')

-- 加载 lsp server 管理器配置
require('settings.mason')

-- 启用 neovim 原生 lsp
require('settings.lsp')

