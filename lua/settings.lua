-- - settings.lua
-- 基础配置
_G.LoadNvimConfigFile("/lua/settings/settings-base.lua")

-- 设置不同类型的代码的注释
-- 一般注释
_G.LoadNvimConfigFile("/lua/settings/settings_code_comments.lua")
-- 一般块注释
_G.LoadNvimConfigFile("/lua/settings/settings_block_code_comments.lua")
-- 文档注释
_G.LoadNvimConfigFile("/lua/settings/settings_documentation_comments_for_code.lua")
-- 块文档注释
_G.LoadNvimConfigFile("/lua/settings/settings_block_documentation_comments_for_code.lua")

-- 设置根据文件扩展名配置文件类型
_G.LoadNvimConfigFile("/lua/settings/settings-auto-filetype-by-fileext.lua")

