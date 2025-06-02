-- - keymaps-typst.lua

-- begin 字词修饰
-- 加粗字体
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'b', '**' .. _G.Next .. '<Esc>F*i', { noremap = true, silent = true})
-- end 字词修饰

-- begin 文本控制
-- 一级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '1', '= ', { noremap = true, silent = true})
-- 二级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '2', '== ', { noremap = true, silent = true})
-- 三级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '3', '=== ', { noremap = true, silent = true})
-- 四级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '4', '==== ', { noremap = true, silent = true})
-- end 文本控制

