-- - settings.lua
-- 导入自定义的工具模块
local loadcfg = require('utils.loadcfg').loadcfg

-- 基础配置
loadcfg("/lua/settings/settings-base.lua")

-- 设置根据文件扩展名配置文件类型
loadcfg("/lua/settings/settings-auto-filetype-by-fileext.lua")

