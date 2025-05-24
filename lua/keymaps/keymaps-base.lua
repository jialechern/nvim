-- - keymaps-base.lua

-- begin 设置写入模式的传送锚点
-- 跳转方式
vim.api.nvim_set_keymap('i', '<leader>;', '<Esc>/' .. _G.Next .. '<CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<leader>:', '<Esc>/' .. _G.Next .. '<CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '`;', '<Esc>/' .. _G.Next .. '<CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Esc>/' .. _G.Next .. '<CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
-- 设置清除当前行的传送锚点
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>mc:s/' .. _G.Next .. '//g<CR>`ca', { noremap = true, silent = true })
-- end 设置写入模式的传送锚点

-- begin 设置快速退出快捷键
vim.api.nvim_set_keymap('n', '<C-D>', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':wq<CR>', { noremap = true, silent = true })
-- end 设置快速推出快捷键

-- begin 分屏设置
-- 上分屏
vim.api.nvim_set_keymap('n', 'sk', ':set nosplitbelow<CR>:split<CR>', { noremap = true, silent = true })
-- 下分屏
vim.api.nvim_set_keymap('n', 'sj', ':set splitbelow<CR>:split<CR>', { noremap = true, silent = true })
-- 左分屏
vim.api.nvim_set_keymap('n', 'sh', ':set nosplitright<CR>:vsplit<CR>', { noremap = true, silent = true })
-- 右分屏
vim.api.nvim_set_keymap('n', 'sl', ':set splitright<CR>:vsplit<CR>', { noremap = true, silent = true })
-- 分屏时光标左移
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- 分屏时光标右移
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true, silent = true })
-- 分屏时光标上移
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- 分屏时光标下移
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- 纵向分屏分界线左移
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -5<CR>', { noremap = true, silent = true })
-- 纵向分屏分界线右移
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +5<CR>', { noremap = true, silent = true })
-- 横向分屏分界线上移
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +5<CR>', { noremap = true, silent = true })
-- 横向分屏分界线下移
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -5<CR>', { noremap = true, silent = true })
-- 更改横向分屏为纵向
vim.api.nvim_set_keymap('n', 'sV', '<C-w>t<C-w>H', { noremap = true, silent = true })
-- 更改纵向分屏为横向
vim.api.nvim_set_keymap('n', 'sH', '<C-w>t<C-w>K', { noremap = true, silent = true })
-- 将当前分屏移至最上
vim.api.nvim_set_keymap('n', '<C-A-Up>', ':wincmd K<CR>', { noremap = true, silent = true })
-- 将当前分屏移至最下
vim.api.nvim_set_keymap('n', '<C-A-Down>', ':wincmd J<CR>', { noremap = true, silent = true })
-- 将当前分屏移至最左
vim.api.nvim_set_keymap('n', '<C-A-Left>', ':wincmd H<CR>', { noremap = true, silent = true })
-- 将当前分屏移至最右
vim.api.nvim_set_keymap('n', '<C-A-Right>', ':wincmd L<CR>', { noremap = true, silent = true })
-- end 分屏设置

-- begin 设置 noremal 模式快速跳转
vim.api.nvim_set_keymap('n', 'H', '^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'H', '^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '^', 'H', {noremap = true, silent = true})
-- 设置跳转到行尾键
vim.api.nvim_set_keymap('n', 'L', '$', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'L', '$', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '$', 'L', {noremap = true, silent = true})
-- 设置快速上下移动
vim.api.nvim_set_keymap('n', 'J', '5j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', '5j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', '5k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'K', '5k', {noremap = true, silent = true})
-- end 设置 noremal 模式快速跳转

-- 设置拼写检查
vim.api.nvim_set_keymap('n', '<LEADER>sc', ':set spell!<CR>', { noremap = true, silent = true})

-- begin 设置转译字符
-- 转译 CoLeader
vim.api.nvim_set_keymap('i', _G.CoLeader .. _G.End, _G.CoLeader, { noremap = true, silent = true })
-- 转译 CoLeader CoLeader
vim.api.nvim_set_keymap('i', _G.CoLeader .. _G.CoLeader .. _G.End, _G.CoLeader .. _G.CoLeader, { noremap = true, silent = true })
-- 转译 LEADER
vim.api.nvim_set_keymap('i', '<LEADER>' .. _G.End, '<LEADER>', { noremap = true, silent = true })
-- 转译 LEADER LEADER
vim.api.nvim_set_keymap('i', '<LEADER><LEADER>' .. _G.End, '<LEADER><LEADER>', { noremap = true, silent = true })
-- end 设置转译字符
