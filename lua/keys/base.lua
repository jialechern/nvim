--- base.lua
--- 基础按键: 领头键转译 / 行内移动 / 缩进 / 撤销断点 / 回到普通模式

local consts = require('settings.consts')

---@class Keys.Base
---@field switch_to_local_leader KeySpec  -- 插入副领头键
---@field switch_to_leader KeySpec        -- 插入领头键
---@field goto_normal KeySpec             -- 回到普通模式
---@field screen_down KeySpec             -- 按屏幕行下移
---@field screen_up KeySpec               -- 按屏幕行上移
---@field line_down KeySpec               -- 按实际行下移
---@field line_up KeySpec                 -- 按实际行上移
---@field first_non_blank KeySpec         -- 行首第一个有效字符
---@field screen_top KeySpec              -- 屏幕首行
---@field line_end KeySpec                -- 行尾
---@field screen_bottom KeySpec           -- 屏幕末行
---@field fast_down KeySpec               -- 快速下移
---@field fast_up KeySpec                 -- 快速上移
---@field escape KeySpec                  -- 退出并取消搜索高亮
---@field undo_break_comma KeySpec        -- 逗号后打断撤销块
---@field undo_break_dot KeySpec          -- 句点后打断撤销块
---@field undo_break_semicolon KeySpec    -- 分号后打断撤销块
---@field indent_left KeySpec             -- 左缩进并保持选中
---@field indent_right KeySpec            -- 右缩进并保持选中
---@field undotree KeySpec                -- 打开撤销树

---@type Keys.Base
local module = {
    -- 领头键转译: 在插入/命令行模式下输入对侧的领头键
    switch_to_local_leader = { lhs = '<leader><localleader>', desc = '插入副领头键 <LocalLeader>', modes = { 'i', 'c' } },
    switch_to_leader = { lhs = '<localleader><leader>', desc = '插入领头键 <Leader>', modes = { 'i', 'c' } },

    goto_normal = {
        lhs = '<C-q>',
        desc = '回到普通模式(比 <Esc> 更通用)',
        modes = { 'c', 'i', 'v', 'x', 's', 'o', 't' },
    },

    -- 实际行与屏幕行跳转对调: j/k 按屏幕行, gj/gk 按实际行
    screen_down = { lhs = 'j', desc = '向下移动(屏幕行, 与 gj 互换)' },
    screen_up = { lhs = 'k', desc = '向上移动(屏幕行, 与 gk 互换)' },
    line_down = { lhs = 'gj', desc = '向下移动(实际行, 与 j 互换)' },
    line_up = { lhs = 'gk', desc = '向上移动(实际行, 与 k 互换)' },

    -- H/L 与 ^/$ 对调: H/L 走行首行尾, ^/$ 走屏幕首末行
    first_non_blank = { lhs = 'H', desc = '跳转到行首第一个有效字符(与 ^ 互换)', modes = { 'n', 'x' } },
    screen_top = { lhs = '^', desc = '跳转到屏幕首行(与 H 互换)' },
    line_end = { lhs = 'L', desc = '跳转到行尾(与 $ 互换)', modes = { 'n', 'x' } },
    screen_bottom = { lhs = '$', desc = '跳转到屏幕末行(与 L 互换)' },

    fast_down = {
        lhs = 'J',
        desc = string.format('向下快速移动 %d 行', consts.fast_move_by_lines),
        modes = { 'n', 'x' },
    },
    fast_up = {
        lhs = 'K',
        desc = string.format('向上快速移动 %d 行', consts.fast_move_by_lines),
        modes = { 'n', 'x' },
    },

    escape = { lhs = '<esc>', desc = '退出当前模式并取消搜索高亮', modes = { 'i', 'n', 's' } },

    -- 插入模式下在标点后打断撤销块
    undo_break_comma = { lhs = ',', desc = '插入逗号并打断撤销块', modes = 'i' },
    undo_break_dot = { lhs = '.', desc = '插入句点并打断撤销块', modes = 'i' },
    undo_break_semicolon = { lhs = ';', desc = '插入分号并打断撤销块', modes = 'i' },

    indent_left = { lhs = '<', desc = '左缩进并保持选中', modes = { 'v', 'x' } },
    indent_right = { lhs = '>', desc = '右缩进并保持选中', modes = { 'v', 'x' } },

    undotree = { lhs = '<C-u>', desc = '打开撤销树' },
}

return module
