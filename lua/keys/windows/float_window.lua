--- float_window.lua
--- 浮动窗口(消息历史/通知)相关按键 (float_window_leader 命名空间)

local float_window_leader = '<C-`>'

---@class Keys.Windows.FloatWindow
---@field float_window_leader string  -- 命名空间前缀
---@field last_message KeySpec        -- 最后一条消息
---@field history KeySpec             -- 消息历史
---@field dismiss KeySpec             -- 关闭所有通知

---@type Keys.Windows.FloatWindow
local module = {
    float_window_leader = float_window_leader,

    last_message = { lhs = float_window_leader .. 'l', desc = '浮动窗口: 显示最后一条消息' },
    history = { lhs = float_window_leader .. 'h', desc = '浮动窗口: 显示消息历史' },
    dismiss = { lhs = float_window_leader .. 'd', desc = '浮动窗口: 关闭所有通知' },
}

return module