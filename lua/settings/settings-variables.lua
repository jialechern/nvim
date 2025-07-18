-- - settings-variables.lua
-- 用于存放一些配置变量

local module = {}

-- 引入一个决定是否加载该配置文件插件的变量(默认是加载插件的)
module.LoadPlugins = true

-- 快速移动所跨越的行数
module.FastMoveLines = 5

return module

