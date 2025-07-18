-- - settings.lua
-- 导入自定义的工具模块
local loadcfg = require('utils.loadcfg').loadcfg

-- 基础配置
loadcfg("/lua/settings/settings-base.lua")

-- 设置不同语言的代码块
loadcfg("/lua/settings/settings-code-blocks.lua")

-- 设置不同类型的代码的注释
-- 一般注释
loadcfg("/lua/settings/settings-code-comments.lua")
-- 一般块注释
loadcfg("/lua/settings/settings-block-code-comments.lua")
-- 文档注释
loadcfg("/lua/settings/settings-documentation-comments-for-code.lua")
-- 块文档注释
loadcfg("/lua/settings/settings-block-documentation-comments-for-code.lua")

-- 设置根据文件扩展名配置文件类型
loadcfg("/lua/settings/settings-auto-filetype-by-fileext.lua")

