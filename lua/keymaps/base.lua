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
    ---@type string
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
---@return string
map(keys.fast_down, function()
    return consts.fast_move_by_lines .. 'j'
end, { expr = true })
---@return string
map(keys.fast_up, function()
    return consts.fast_move_by_lines .. 'k'
end, { expr = true })

-- <Esc> 退出时顺带取消搜索高亮
---@return string
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

    -- bufnr/winid 留空则由插件新建 buffer/窗口; command 是创建窗口的 Vim 命令(30vnew = 左侧 30 列),
    -- title 也可以是函数 fun(bufnr): string
    require('undotree').open({
        bufnr   = nil,
        winid   = nil,
        command = '30vnew',
        title   = 'Undo Tree',
    })
end)
