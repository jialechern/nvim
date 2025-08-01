-- base.lua
-- 基础按键映射

-- 引入自定义工具函数
local map = require('utils.map').map
local map_by_modes = require('utils.map').map_by_modes

------------------------------ 设置基本按键映射 ----------------------------

-- 设置领导键转译
-- 转译 CoLeader
map('i', _G.CoLeader .. _G.End, _G.CoLeader, { desc = "将副领导键转义为自身" })
map('i', _G.CoLeader .. _G.CoLeader .. _G.End, _G.CoLeader .. _G.CoLeader, { desc = "将副领导键转义为自身" })

-- 转译 LEADER
map('i', '<LEADER>' .. _G.End, '<LEADER>', { desc = "将领导键转义为自身" })
map('i', '<LEADER><LEADER>' .. _G.End, '<LEADER><LEADER>', { desc = "将领导键转义为自身" })

-- 设置进入一般模式的快捷键
map_by_modes({ 'i', 'v', 'x' }, '<C-_>', function ()
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

-- 设置快速上下移动
-- 载入快速移动的配置
local fast_move_by_lines = require('settings.variables.fast-move').fast_move_by_lines
map_by_modes({ 'n', 'x' }, 'J', function()
    return fast_move_by_lines .. 'j'
end, { desc = "设置 J 为快速向下移动, 移动行数可在 init.lua 中设置", expr = true })

map_by_modes({ 'n', 'x' }, 'K', function ()
    return fast_move_by_lines .. 'k'
end, { desc = "设置 K 为快速向上移动, 移动行数可在 init.lua 中设置", expr = true })

-- 设置快速退出快捷键
map('n', '<C-D>', function ()
    vim.cmd('q!')
end, { desc = "强制退出" })

map('n', '<C-S>', function ()
    vim.cmd('wq')
end, { desc = "保存退出" })

-- 定义根据文件类型自动 编译/运行/预览... 的键盘映射
map('n', '<A-r>', function ()
    local Run = require('utils.autocmd-by-filetype').Run
    Run()
end, { desc = "根据当前文件类型自动执行默认命令( 编译/预览/... )." })

map('n', '<LEADER>sc', function ()
    vim.cmd('set spell!')
end, { desc = "切换拼写检查" })

----------------------------------- 设置跳转 -----------------------------------
-- 跳转函数
local function jump_to_next() return
    '<Esc>/' .. _G.Next .. '<CR>:nohlsearch<CR>c' .. _G.Next:len() .. 'l'
end

-- 跳转快捷键
map('i', '<LEADER>;', jump_to_next, { expr = true, desc = "使得光标跳转到下一个锚点" })
map('i', '<LEADER>:', jump_to_next, { expr = true, desc = "使得光标跳转到下一个锚点" })
map('i', _G.CoLeader .. ':', jump_to_next, { expr = true, desc = "使得光标跳转到下一个锚点" })
map('i', '<C-l>', jump_to_next, { expr = true, desc = "使得光标跳转到下一个锚点" })

map('i', '<C-c>', function ()
    vim.cmd('normal! mc:s/' .. _G.Next .. '//g\r`ca')
end, { desc = "清除当前行中所有的跳转锚点" })

------------------------------------ 其它映射 -----------------------------------

map('c', _G.CoLeader .. '%%', function ()
    local file_path = vim.fn.expand('%:h')
    local sep = package.config:sub(1,1)
    if file_path == '' then
        return '%%'
    end
    return file_path .. sep
end, { expr = true, desc = "在命令行中插入当前文件的路径" })

