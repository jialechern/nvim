--- run.lua
--- 编译/运行当前文件的按键 (各语言 after/ftplugin 共用)

local run_key = '<C-e>'

---@class Keys.Run
---@field run_key string   -- 键位
---@field run_file KeySpec -- 编译/运行

---@type Keys.Run
local module = {
    run_key = run_key,
    run_file = { lhs = run_key, desc = '编译/运行当前文件' },
}

return module