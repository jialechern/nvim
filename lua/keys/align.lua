--- align.lua
--- 文本对齐(vim-easy-align)相关按键 (align_leader 命名空间)

local align_leader = 'ga'

---@class Keys.Align
---@field align_leader string  -- 命名空间前缀
---@field visual KeySpec        -- 对齐选中文本
---@field motion KeySpec        -- 配合 motion 对齐

---@type Keys.Align
local module = {
    align_leader = align_leader,

    visual = { lhs = align_leader, desc = 'EasyAlign: 对齐选中的文本', modes = 'x' },
    motion = { lhs = align_leader .. 'n', desc = 'EasyAlign: 配合 motion 对齐', modes = 'n' },
}

return module