--- consts.lua
--- 静态常量: 主题调色板 / 按键行为参数 / snippet 触发词
--- 内容继续增长时, 拆分为 settings/consts/<主题>.lua

--- 主题调色板: Catppuccin Mocha 标准色
--- 供 highlight 与插件主题引用, 不要在别处硬编码色值
---@class Consts.Colors
---@field bg0 string         -- 主编辑器背景 (base)
---@field bg1 string         -- 次要背景(状态栏、浮动窗口、行高亮) (surface0)
---@field bg2 string         -- 选中区域背景 (surface1)
---@field bg3 string         -- 边框、注释文字 (surface2)
---@field frost1 string      -- 浅青蓝 (teal)
---@field frost2 string      -- 浅蓝色 (sky)
---@field frost3 string      -- 中蓝色 (sapphire)
---@field frost4 string      -- 深蓝色 (blue)
---@field red string         -- 红色
---@field orange string      -- 橙色 (peach)
---@field yellow string      -- 黄色
---@field green string       -- 绿色
---@field purple string      -- 紫色 (mauve)
---@field fg3 string         -- 次要文字 (subtext0)
---@field fg2 string         -- 普通正文文字 (subtext1)
---@field fg1 string         -- 高亮文字 (text)
---@field black string       -- 兼容别名: 状态栏背景
---@field grey string        -- 兼容别名: 次要文字
---@field white string       -- 兼容别名: 高亮文字
---@field light_green string -- 兼容别名: 浅青蓝

---@class Consts
---@field colors Consts.Colors
---@field fast_move_by_lines integer   -- J/K 一次跨越的行数
---@field window_resize_step integer   -- 分屏尺寸调整步长
---@field entry_point string           -- 程序入口 snippet 的触发词
---@field test_key string              -- 测试 snippet 的触发词

---@type Consts
local module = {
    colors = {
        -- Base: 背景深色系
        bg0 = '#1E1E2E',
        bg1 = '#313244',
        bg2 = '#45475A',
        bg3 = '#585B70',

        -- 冷调青色/蓝色系
        frost1 = '#94E2D5',
        frost2 = '#89DCEB',
        frost3 = '#74C7EC',
        frost4 = '#89B4FA',

        -- 强调色系
        red = '#F38BA8',
        orange = '#FAB387',
        yellow = '#F9E2AF',
        green = '#A6E3A1',
        purple = '#CBA6F7',

        -- 文字浅色系
        fg3 = '#A6ADC8',
        fg2 = '#BAC2DE',
        fg1 = '#CDD6F4',

        -- 兼容旧配置的别名: 直接替换原来的变量名, 无需修改插件配置的调用逻辑
        black = '#313244',
        grey = '#A6ADC8',
        white = '#CDD6F4',
        light_green = '#94E2D5',
    },

    fast_move_by_lines = 5,
    window_resize_step = 5,
    entry_point = 'init',
    test_key = 'test',
}

return module