--- base.lua
--- 基础按键映射 (键位与描述见 lua/keys/base.lua)

local map = require('utils.map').map
local keys = require('keys.base')
local consts = require('settings.consts')

-- 领头键转译: 插入/命令行模式下输入对侧的领头键
map(keys.switch_to_local_leader, '<localleader>')
map(keys.switch_to_leader, '<leader>')

-- 回到普通模式: 终端模式要先退出终端作业
map(keys.goto_normal, function()
    local mode = vim.fn.mode()
    local key = (mode == 't') and '<C-\\><C-n>' or '<Esc>'
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, false, true), 'n', false)
end)

-- 实际行与屏幕行跳转对调
map(keys.screen_down, 'gj')
map(keys.screen_up, 'gk')
map(keys.line_down, 'j')
map(keys.line_up, 'k')

-- 行首行尾与屏幕首末行对调
map(keys.first_non_blank, '^')
map(keys.screen_top, 'H')
map(keys.line_end, '$')
map(keys.screen_bottom, 'L')

-- 快速上下移动, 行数取自 settings/consts.lua
map(keys.fast_down, function()
    return consts.fast_move_by_lines .. 'j'
end, { expr = true })
map(keys.fast_up, function()
    return consts.fast_move_by_lines .. 'k'
end, { expr = true })

-- <Esc> 退出时顺带取消搜索高亮
map(keys.escape, function()
    vim.cmd('noh')
    return '<esc>'
end, { expr = true })

-- 插入模式下在标点后打断撤销块
map(keys.undo_break_comma, ',<c-g>u')
map(keys.undo_break_dot, '.<c-g>u')
map(keys.undo_break_semicolon, ';<c-g>u')

-- 缩进后保持选中
map(keys.indent_left, '<gv')
map(keys.indent_right, '>gv')

-- 打开撤销树
map(keys.undotree, function()
    vim.cmd('packadd nvim.undotree')

    require('undotree').open({
        bufnr   = nil,           -- 绘制到指定 buffer(默认创建新 buffer)
        winid   = nil,           -- 绘制到指定 window(默认创建新窗口)
        command = '30vnew',      -- 创建窗口用的 Vim 命令(默认左侧 30 列垂直分割)
        title   = 'Undo Tree',   -- 窗口标题; 也可以是函数 fun(bufnr): string
    })
end)