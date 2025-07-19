-- auto-cmd-by-filetype.lua
-- 用于存放工具函数, 它能够根据文件类型自动加载该文件的默认行为

local module = {}

-- 定义根据文件类型自动 编译/运行/预览... 的 Run 函数
function Run()
    local filetype = vim.bo.filetype
    local cmd = require('settings.auto-cmd-by-filetype').cmds[filetype]
    cmd()
end

module.Run = Run

return module

