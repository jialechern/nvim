-- - keymaps-for-code-fold.lua
-- close fold
vim.api.nvim_set_keymap('n', '<C-A-c>', 'zc', { noremap = true, silent = true })
-- open fold
vim.api.nvim_set_keymap('n', '<C-A-o>', 'zo', { noremap = true, silent = true })
-- delect fold
vim.api.nvim_set_keymap('n', '<C-A-d>', 'zd', { noremap = true, silent = true })
-- fold
vim.api.nvim_set_keymap('n', '<C-A-f>', 'zf', { noremap = true, silent = true })
-- expansion 展开所有折叠
vim.api.nvim_set_keymap('n', '<C-A-e>', 'zR', { noremap = true, silent = true })
-- close all 关闭所有折叠
vim.api.nvim_set_keymap('n', '<C-A-a>', 'zM', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-A-a>', 'zM', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-A-e>', 'zR', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-A-c>', 'zc', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-A-o>', 'zo', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-A-d>', 'zd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-A-f>', 'zf', { noremap = true, silent = true })

