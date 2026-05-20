-- lua/colors.lua
-- 统一颜色管理: 基于 Catppuccin Mocha 标准调色板
local colors = {
    -- ------------------------------
    -- Base: 背景深色系
    -- ------------------------------
    bg0         = "#1E1E2E", -- 主编辑器背景 (Catppuccin base)
    bg1         = "#313244", -- 次要背景(状态栏、浮动窗口、行高亮) (Catppuccin surface0)
    bg2         = "#45475A", -- 选中区域背景 (Catppuccin surface1)
    bg3         = "#585B70", -- 边框、注释文字 (Catppuccin surface2)

    -- ------------------------------
    -- 冷调青色/蓝色系
    -- ------------------------------
    frost1      = "#94E2D5", -- 浅青蓝 (Catppuccin teal)
    frost2      = "#89DCEB", -- 浅蓝色 (Catppuccin sky)
    frost3      = "#74C7EC", -- 中蓝色 (Catppuccin sapphire)
    frost4      = "#89B4FA", -- 深蓝色 (Catppuccin blue)

    -- ------------------------------
    -- 强调色系
    -- ------------------------------
    red         = "#F38BA8", -- 红色 (Catppuccin red)
    orange      = "#FAB387", -- 橙色 (Catppuccin peach)
    yellow      = "#F9E2AF", -- 黄色 (Catppuccin yellow)
    green       = "#A6E3A1", -- 绿色 (Catppuccin green)
    purple      = "#CBA6F7", -- 紫色 (Catppuccin mauve)

    -- ------------------------------
    -- 文字浅色系
    -- ------------------------------
    fg3         = "#A6ADC8", -- 次要文字 (Catppuccin subtext0)
    fg2         = "#BAC2DE", -- 普通正文文字 (Catppuccin subtext1)
    fg1         = "#CDD6F4", -- 高亮文字 (Catppuccin text)

    -- ------------------------------
    -- 兼容旧配置的别名
    -- 可以直接替换原来的变量名, 无需修改插件配置的调用逻辑
    -- ------------------------------
    black       = "#313244", -- 原 black 变量, 对应状态栏背景 bg1
    grey        = "#A6ADC8", -- 原 grey 变量, 对应次要文字 fg3
    white       = "#CDD6F4", -- 原 white 变量, 对应高亮文字 fg1
    light_green = "#94E2D5", -- 原 light_green 变量, 对应 frost1
}

return colors
