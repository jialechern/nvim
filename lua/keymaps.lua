-- keymaps.lua
-- 导入自定义的工具模块
local loadcfg = require('utils.loadcfg').loadcfg

-- 导入基本快捷键设置
loadcfg("/lua/keymaps/keymaps-base.lua")

-- 设置代码块
loadcfg("/lua/keymaps/keymaps-for-code-block.lua")

-- 设置注释
loadcfg("/lua/keymaps/keymaps-for-code-comment.lua")

-- 设置成对符号的自动配对
loadcfg("/lua/keymaps/keymaps-symbols.lua")

-- 设置代码折叠快捷键
loadcfg("/lua/keymaps/keymaps-for-code-fold.lua")

-- 设置自动根据文件名导入对应的键盘映射
loadcfg("/lua/keymaps/keymaps-auto-load-by-filetype.lua")

