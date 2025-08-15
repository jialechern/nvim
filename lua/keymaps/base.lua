--- base.lua
--- 基础按键映射

-- 引入自定义工具函数
local map = require('utils.map').map
local map_by_modes = require('utils.map').map_by_modes

------------------------------ 设置基本按键映射 ----------------------------

-- 设置进入一般模式的快捷键
map_by_modes({ 'i', 'v', 'x', 's', 'o' }, '<C-' .. _G.CoLeader .. '>', function ()
    vim.cmd('stopinsert')
end, { desc = "一个更加常用的进入 normal 模式的快捷键" })

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

map_by_modes({ 'n', 'x' }, 'K', function ()
    return fast_move_by_lines .. 'k'
end, { desc = "设置 K 为快速向上移动, 移动行数可在 init.lua 中设置", expr = true })

-- 使用 <ESC> 取消搜索高亮
map({ 'i', 'n', 's' }, '<esc>', function()
  vim.cmd('noh')
  return '<esc>'
end, { expr = true, desc = '使用 <ESC> 键来取消搜索模式的高亮' })

-- 设置 <C-e> 为括号匹配
map('n', '<C-e>', function()
    return '%'
end, { expr = true, desc = '设置 <C-n> 为括号匹配快捷键' })

-- 添加撤消断点
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- 自动缩进
map({'v', 'x'}, '<', '<gv')
map({'v', 'x'}, '>', '>gv')

--- 其它映射

--- 设置一些 neovim中的元符号(Meta)

local get_key = require('settings.variables.vim-variables').get_key

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

-- 定义 _G.CoLeader .. '%%' 为当前文件路径
map('c', _G.CoLeader .. '%%', function ()
    local file_path = vim.fn.expand('%:h')
    local sep = require('utils.path').path_prefix
    if file_path == '' then
        return _G.CoLeader .. '%%'
    end
    return file_path .. sep
end, { expr = true, desc = "在命令行中插入当前文件的路径" })

