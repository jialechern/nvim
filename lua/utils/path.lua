-- path.lua
-- 这里存放路径相关的函数和符号

local module = {}

-- 获取当前运行环境的路径分隔符
local path_prefix = package.config:sub(1,1)
module.path_prefix = path_prefix

return module

