-- settings.lua

-- 启用 neovim 原生 lsp (要最先加载, 否则会错过 LspAttach 事件)
require('settings.lsp')

-- 基础配置
require('settings.base')

-- 基本的自动命令
require('settings.autocmds')

-- 设置根据文件扩展名配置文件类型
require('settings.filetype')

-- -- 开启 undotree
-- require('settings.undotree')
