--- vim-easy-align.lua

local M = {}
M[1] = {} -- 插件主配置

local ea = M[1]

-- 1. 插件源设置
ea[1] = 'junegunn/vim-easy-align'

-- 2. 加载时机: 当进入 Visual 模式或按下对齐快捷键时懒加载
ea.keys = {
    { 'ga', mode = { 'n', 'x' }, desc = 'EasyAlign' },
}

-- 3. 配置函数
ea.config = function()
    local fn = vim.fn
    local api = vim.api
    -- 假设你的工具类位置一致，如果不一致请修改此处
    local map = require('utils.map').map
    -- 引入 align-leader
    local align_leader = require('settings.variables.align').align_leader

    -- ========= 核心快捷键设置 =========

    -- 在 Visual 模式下 (选中文本后), 按下对齐的 leader 键位直接进入对齐交互模式
    -- 这是 EasyAlign 的灵魂操作: 选中 -> align-leader -> 输入对齐字符（如 =）
    map('x', align_leader, '<Plug>(EasyAlign)', { desc = 'EasyAlign (Visual)' })

    -- 在 Normal 模式下，可以使用 <align-leader> + n + 动作 (motion)
    -- 例如：<align-leader>nip=  (对齐当前段落 Inner Paragraph 内的所有等号)
    map('n', align_leader .. 'n', '<Plug>(EasyAlign)', { desc = 'EasyAlign (Normal/Motion)' })


    -- ========= 高级自定义对齐规则 (可选) =========
    -- 如果有特殊的对齐需求，可以在这里自定义规则
    -- 比如针对 Markdown 表格或者特定的注释符号
    -- vim.g.easy_align_delimiters = {
    --     ['>'] = { pattern = '>>', left_margin = 1, right_margin = 0 },
    --     ['/'] = { pattern = '//', delimiter_align = 'l', ignore_groups = { 'String' } },
    -- }
end

return M

