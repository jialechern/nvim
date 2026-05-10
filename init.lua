-- init.lua

-- 加载配置初始化时必要的符号
-- 领头键
_G.Leader = '/'
vim.g.mapleader = _G.Leader
-- 副领头键
_G.LocalLeader = '\\'
vim.g.maplocalleader = _G.LocalLeader

-- 一般设置
require('settings')

-- 引入插件
if vim.o.loadplugins then
    require('plugins').setup()
end

-- 键盘映射
require('keymaps')

