-- - keymaps-base.lua
-- 基础按键映射

-- 引入自定义工具函数
local map = require('utils.map').map
local map_by_modes = require('utils.map').map_by_modes

-- 设置进入一般模式的快捷键
map_by_modes({ 'i', 'v', 'x' }, '<C-_>', function ()
    vim.cmd('stopinsert')
end, { desc = "一个更加常用的进入 normal 模式的快捷键" })

-- 定义根据文件类型自动 编译/运行/预览... 的键盘映射
map('n', '<A-r>', function ()
    local Run = require('settings.settings-auto-cmd-by-file-type').Run
    Run()
end, { desc = "根据当前文件类型自动执行默认命令( 编译/预览/... )." })

-- begin 设置写入模式的传送锚点
-- 跳转函数
local function jump_to_next()
    vim.fn.search(_G.Next)
    vim.cmd('normal! d' .. _G.Next:len() .. 'l')
end

map('i', '<LEADER>;', jump_to_next, { desc = "使得光标跳转到下一个锚点" })
map('i', '<LEADER>:', jump_to_next, { desc = "使得光标跳转到下一个锚点" })
map('i', _G.CoLeader .. ':', jump_to_next, { desc = "使得光标跳转到下一个锚点" })
map('i', '<C-l>', jump_to_next, { desc = "使得光标跳转到下一个锚点" })

map('i', '<C-c>', function ()
    vim.cmd('normal! mc:s/' .. _G.Next .. '//g\r`ca')
end, { desc = "清除当前行中所有的跳转锚点" })
-- end 设置写入模式的传送锚点

-- begin 设置快速退出快捷键
map('n', '<C-D>', function ()
    vim.cmd('q!')
end, { desc = "强制退出" })

map('n', '<C-S>', function ()
    vim.cmd('wq')
end, { desc = "保存退出" })
-- end 设置快速推出快捷键

-- begin 分屏设置
map('n', 'sk', function ()
    vim.cmd('set nosplitbelow')
    vim.cmd('split')
end, { desc = "向上分屏" })

map('n', 'sj', function ()
    vim.cmd('set splitbelow')
    vim.cmd('split')
end, { desc = "向下分屏" })

map('n', 'sh', function ()
    vim.cmd('set nosplitright')
    vim.cmd('vsplit')
end, { desc = "向左分屏" })

map('n', 'sl', function ()
    vim.cmd('set splitright')
    vim.cmd('vsplit')
end, { desc = "向右分屏" })

map('n', '<C-h>', function ()
    vim.cmd('wincmd h')
end, { desc = "分屏时光标左移" })

map('n', '<C-l>', function ()
    vim.cmd('wincmd l')
end, { desc = "分屏时光标右移" })

map('n', '<C-k>', function ()
    vim.cmd('wincmd k')
end, { desc = "分屏时光标上移" })

map('n', '<C-j>', function ()
    vim.cmd('wincmd j')
end, { desc = "分屏时光标下移" })

map('n', '<C-Left>', function ()
    vim.cmd('vertical resize -5')
end, { desc = "纵向分屏分界线左移" })

map('n', '<C-Right>', function ()
    vim.cmd('vertical resize +5')
end, { desc = "纵向分屏分界线右移" })

map('n', '<C-Up>', function ()
    vim.cmd('resize +5')
end, { desc = "横向分屏分界线上移" })

map('n', '<C-Down>', function ()
    vim.cmd('resize -5')
end, { desc = "横向分屏分界线下移" })

map('n', 'sV', function ()
    vim.cmd('wincmd t')
    vim.cmd('wincmd H')
end, { desc = "更改横向分屏为纵向" })

map('n', 'sH', function ()
    vim.cmd('wincmd t')
    vim.cmd('wincmd K')
end, { desc = "更改纵向分屏为横向" })

map('n', '<C-A-Up>', function ()
    vim.cmd('wincmd K')
end, { desc = "将当前分屏移至最上" })

map('n', '<C-A-Down>', function ()
    vim.cmd('wincmd J')
end, { desc = "将当前分屏移至最下" })

map('n', '<C-A-Left>', function ()
    vim.cmd('wincmd H')
end, { desc = "将当前分屏移至最左" })

map('n', '<C-A-Right>', function ()
    vim.cmd('wincmd L')
end, { desc = "将当前分屏移至最右" })
-- end 分屏设置

-- begin 设置 noremal 模式快速跳转
map_by_modes({ 'n', 'x' }, 'H', '^', { desc = "设置 H 为跳转到当前行第一个有效字符" })
map('n', '^', 'H', { desc = "设置 ^ 为跳转至首行" })
-- 设置跳转到行尾键
map_by_modes({ 'n', 'x' }, 'L', '$', { desc = "设置 L 为跳转到当前行最后一个字符" })
map('n', '$', 'L', { desc = "设置 $ 为跳转至末行" })
-- 设置快速上下移动
-- 载入快速移动的配置
local FastMoveLines = require('settings.settings-variables').FastMoveLines
map_by_modes({ 'n', 'x' }, 'J', function()
    return FastMoveLines .. 'j'
end, { desc = "设置 J 为快速向下移动, 移动行数可在 init.lua 中设置", expr = true })

map_by_modes({ 'n', 'x' }, 'K', function ()
    return FastMoveLines .. 'k'
end, { desc = "设置 K 为快速向上移动, 移动行数可在 init.lua 中设置", expr = true })
-- end 设置 noremal 模式快速跳转

map('n', '<LEADER>sc', function ()
    vim.cmd('set spell!')
end, { desc = "切换拼写检查" })

-- begin 设置转译字符
-- 转译 CoLeader
map('i', _G.CoLeader .. _G.End, _G.CoLeader, { desc = "将副领导键转义为自身" })
map('i', _G.CoLeader .. _G.CoLeader .. _G.End, _G.CoLeader .. _G.CoLeader, { desc = "将副领导键转义为自身" })
-- 转译 LEADER
map('i', '<LEADER>' .. _G.End, '<LEADER>', { desc = "将领导键转义为自身" })
map('i', '<LEADER><LEADER>' .. _G.End, '<LEADER><LEADER>', { desc = "将领导键转义为自身" })
-- end 设置转译字符
