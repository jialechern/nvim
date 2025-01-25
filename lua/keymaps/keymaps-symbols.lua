-- - keymaps-symbols.lua

-- 小括号匹配
vim.api.nvim_set_keymap('i', '<LEADER>(', '()' .. _G.Next .. '<Esc>F)i', { noremap = true, silent = true })
-- 中括号匹配
vim.api.nvim_set_keymap('i', '<LEADER>[', '[]' .. _G.Next .. '<Esc>F]i', { noremap = true, silent = true })
-- 大括号匹配
vim.api.nvim_set_keymap('i', '<LEADER>{', '{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true })
-- 尖括号匹配
vim.api.nvim_set_keymap('i', '<LEADER><', '<' .. _G.CoLeader .. '>' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's', { noremap = true, silent = true })
-- 单引号匹配
vim.api.nvim_set_keymap('i', "<LEADER>'", "''" .. _G.Next .. "<Esc>F'i", { noremap = true, silent = true })
-- 双引号匹配
vim.api.nvim_set_keymap('i', '<LEADER>"', '""' .. _G.Next .. '<Esc>F"i', { noremap = true, silent = true })



