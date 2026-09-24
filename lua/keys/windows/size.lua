--- size.lua
--- 窗口尺寸调整按键 (步长见 settings/consts.lua 的 window_resize_step)

---@class Keys.Windows.Size
---@field left KeySpec   -- 分界线左移
---@field right KeySpec  -- 分界线右移
---@field up KeySpec     -- 分界线上移
---@field down KeySpec   -- 分界线下移

---@type Keys.Windows.Size
local module = {
    left = { lhs = '<C-Left>', desc = '纵向分屏分界线左移' },
    right = { lhs = '<C-Right>', desc = '纵向分屏分界线右移' },
    up = { lhs = '<C-Up>', desc = '横向分屏分界线上移' },
    down = { lhs = '<C-Down>', desc = '横向分屏分界线下移' },
}

return module
