-- - keymaps-base.lua

-- end 设置写入模式的传送锚点
-- 跳转方式
vim.api.nvim_set_keymap('i', '<leader>;', '<Esc>/<++><CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<leader>:', '<Esc>/<++><CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '`;', '<Esc>/<++><CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Esc>/<++><CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
-- 设置清除当前行的传送锚点
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>mc:s/<++>//g<CR>`ca', { noremap = true, silent = true })
-- end 设置写入模式的传送锚点

-- begin 设置快速退出快捷键
vim.api.nvim_set_keymap('n', '<C-D>', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':wq<CR>', { noremap = true, silent = true })
-- end 设置快速推出快捷键

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
vim.api.nvim_set_keymap('n', '<leader>sc', ':set spell!<CR>', { noremap = true, silent = true})
