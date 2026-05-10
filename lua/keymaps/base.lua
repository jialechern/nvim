--- base.lua
--- 基础按键映射

-- 引入自定义工具函数
local map = require('utils.map').map
local map_by_modes = require('utils.map').map_by_modes

------------------------------ 设置基本按键映射 ----------------------------
-- 领头键转译
map({ 'i', 'c' }, '<leader><localleader>', '<localleader>', { desc = "转译副领头键" })
map({ 'i', 'c' }, '<localleader><leader>', '<leader>', { desc = "转译领头键" })

-- 将按实际行跳转与按文本行跳转对调
map('n', 'j', 'gj', { desc = "将 j 映射为按屏幕行跳转" })
map('n', 'k', 'gk', { desc = "将 k 映射为按屏幕行跳转" })
map('n', 'gj', 'j', { desc = "将 gj 映射为按实际行跳转" })
map('n', 'gk', 'k', { desc = "将 gk 映射为按实际行跳转" })

-- 设置 noremal 模式快速跳转
map_by_modes({ 'n', 'x' }, 'H', '^', { desc = "设置 H 为跳转到当前行第一个有效字符" })
map('n', '^', 'H', { desc = "设置 ^ 为跳转至首行" })

-- 设置跳转到行尾键
map_by_modes({ 'n', 'x' }, 'L', '$', { desc = "设置 L 为跳转到当前行最后一个字符" })
map('n', '$', 'L', { desc = "设置 $ 为跳转至末行" })

--- 设置快速上下移动
-- 载入快速移动的配置
local fast_move_by_lines = require('settings.variables.fast-move').fast_move_by_lines
map_by_modes({ 'n', 'x' }, 'J', function()
    return fast_move_by_lines .. 'j'
end, { desc = "设置 J 为快速向下移动, 移动行数可在 init.lua 中设置", expr = true })

map_by_modes({ 'n', 'x' }, 'K', function()
    return fast_move_by_lines .. 'k'
end, { desc = "设置 K 为快速向上移动, 移动行数可在 init.lua 中设置", expr = true })

-- 使用 <ESC> 取消搜索高亮
map({ 'i', 'n', 's' }, '<esc>', function()
    vim.cmd('noh')
    return '<esc>'
end, { expr = true, desc = '使用 <ESC> 键来取消搜索模式的高亮' })

-- 添加撤消断点
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- 自动缩进
map({ 'v', 'x' }, '<', '<gv')
map({ 'v', 'x' }, '>', '>gv')

--- 其它映射

--- 设置一些 neovim中的元符号(Meta)

local get_key = require('settings.variables.vim-variables').get_key
local meta_leader = require('settings.variables.vim-variables').meta_leader
local buffer_leader = require('settings.variables.buffers').buffer_leader
local fold_leader = require('settings.variables.fold-codes').fold_key
local lsp_leader = require('settings.variables.lsp').lsp_leader
local tab_leader = require('settings.variables.tabs').tab_leader
local fix_leader = require('settings.variables.quickfix').fix_leader
local fuzzy_finder_leader = require('settings.variables.fuzzy-finder').fuzzy_finder_leader

local cursor_leader = require('settings.variables.windows.cursor').cursor_leader
local size_leader = require('settings.variables.windows.size').size_leader
local split_leader = require('settings.variables.windows.split').split_leader
local status_leader = require('settings.variables.windows.status').status_leader
local align_leader = require('settings.variables.align').align_leader
local float_window_leader = require('settings.variables.windows.float-window').float_window_leader

local run_key = require('settings.variables.run').run_key
local entry_point = require('settings.variables.entry-points').entry_point
local test_key = require('settings.variables.test').test_key

local undotree_key = require('settings.variables.undotree').undotree_key


-- 设置进入一般模式的快捷键
map_by_modes({ 'c', 'i', 'v', 'x', 's', 'o', 't' }, get_key('goto-normal'), function()
    local mode = vim.fn.mode()
    if mode == 't' then
        -- terminal 模式需要特殊处理
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true),
            'n', false
        )
    elseif mode == 'i' or mode == 'R' or mode == 'Rv' then
        -- insert / replace 模式
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes('<Esc>', true, false, true),
            'n', false
        )
    else
        -- visual / select / operator-pending 等模式
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes('<Esc>', true, false, true),
            'n', false
        )
    end
end, { desc = "一个更加常用的进入 normal 模式的快捷键" })

map('n', get_key('make-program'), function()
    local makeprg = vim.fn.input('设定 makeprg(make-program) 为: ', '')
    vim.bo.makeprg = makeprg
end, { desc = "设置 makeprg 的快捷键" })

map('n', get_key('grep-program'), function()
    local grepprg = vim.fn.input('设定 grepprg(grep-program) 为: ', '')
    vim.bo.grepprg = grepprg
end, { desc = "设置 grepprg 的快捷键" })

map('n', get_key('grep-format'), function()
    local grepformat = vim.fn.input('设定 grepformat(grep-format) 为: ', '')
    vim.opt.grepformat = grepformat
end, { desc = "设置 grepformat 的快捷键" })

map('n', get_key('shell-pipe'), function()
    local shellpipe = vim.fn.input('设定 shellpipe(shell-pipe) 为: ', '')
    vim.opt.shellpipe = shellpipe
end, { desc = "设置 shellpipe 的快捷键" })

map('n', get_key('shell-redir'), function()
    local shellredir = vim.fn.input('设定 shellredir(shell-redir) 为: ', '')
    vim.opt.shellredir = shellredir
end, { desc = "设置 shellredir 的快捷键" })

map('n', get_key('content-formater'), function()
    local formatprg = vim.fn.input('设定 formatprg(content-formater) 为: ', '')
    vim.bo.formatprg = formatprg
end, { desc = "设置 shellredir 的快捷键" })

map('n', meta_leader .. 'L', function()
    local help_text = [[
Windows 相关领头键:
    %s : split 相关领头键
    %s : cursor 相关领头键
    %s : size 相关领头键
    %s : status 相关领头键

其它领头键说明:
    %s : buffer 相关领头键
    %s : fold 相关领头键
    %s : lsp 相关领头键
    %s : tab 相关领头键
    %s : quickfix 相关领头键
    %s : fuzzy finder 相关领头键
    %s : 文本对齐相关领头键
    %s : 浮动窗口相关领头键
    ]]
    vim.notify(help_text:format(
        split_leader,
        cursor_leader,
        size_leader,
        status_leader,
        buffer_leader,
        fold_leader,
        lsp_leader,
        tab_leader,
        fix_leader,
        fuzzy_finder_leader,
        align_leader,
        float_window_leader
    ), vim.log.levels.INFO, { title = "其他领头键列表" })
end, { desc = "显示其他 Leader 键位列表" })

map('n', get_key('help'), function()
    local help_text = [[
vim 内置变量快捷键说明:
    %s : 设置 makeprg(make-program) 的快捷键
    %s : 设置 grepprg(grep-program) 的快捷键
    %s : 设置 grepformat(grep-format) 的快捷键
    %s : 设置 shellpipe(shell-pipe) 的快捷键
    %s : 设置 shellredir(shell-redir) 的快捷键
    %s : 另一个更加常用的进入 normal 模式的快捷键
    %s : 打开 Undotree
    %s : 显示其他 Leader 键位列表

Snipets 相关快捷键:
    %s : auto command 相关快捷键
    %s : entry point 相关快捷键
    %s : test 相关快捷键
    ]]
    vim.notify(help_text:format(
        get_key('make-program'),
        get_key('grep-program'),
        get_key('grep-format'),
        get_key('shell-pipe'),
        get_key('shell-redir'),
        get_key('goto-normal'),
        undotree_key,
        meta_leader .. 'L',
        run_key,
        entry_point,
        test_key
    ), vim.log.levels.INFO, { title = "Vim 内置变量快捷键列表" })
end, { desc = "显示设置 vim 内置变量的快捷键文档" })

-- 打开 Undotree
vim.keymap.set('n', undotree_key, function()
    vim.cmd('packadd nvim.undotree')

    require('undotree').open({
      bufnr   = nil,           -- 绘制到指定 buffer(默认创建新 buffer)
      winid   = nil,           -- 绘制到指定 window(默认创建新窗口)
      command = "30vnew",      -- 创建窗口用的 Vim 命令(默认左侧 30 列垂直分割)
      title   = "Undo Tree",   -- 窗口标题; 也可以是函数 fun(bufnr): string
    })
end, { desc = '打开撤销树' })
