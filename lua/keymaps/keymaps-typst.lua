-- - keymaps-typst.lua

-- begin 字词修饰
-- 加粗字体
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'b', '**' .. _G.Next .. '<Esc>F*i', { noremap = true, silent = true})
-- 强调字体
vim.api.nvim_set_keymap('i', _G.CoLeader .. 's', '__' .. _G.Next .. '<Esc>F_i', { noremap = true, silent = true})
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

-- begin 代码块
-- 行内代码块
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'c', '``' .. _G.Next .. '<Esc>F`i', { noremap = true, silent = true})
-- 多行代码块
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'C', 
'```'                                       .. '<CR>' .. 
'```'                                       .. '<Esc>kA'
, { noremap = true, silent = true})
-- end 代码块

-- begin 脚本模式
-- 脚本模式
vim.api.nvim_set_keymap('i', '<LEADER>#', '#( ' .. _G.CoLeader .. ' )' .. '<Esc>F' .. _G.CoLeader .. 's', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', _G.CoLeader .. '#', '#[' .. _G.CoLeader .. ']' .. '<Esc>F' .. _G.CoLeader .. 's', { noremap = true, silent = true})
-- end 脚本模式

-- begin 数学模式
-- 行内公式块
vim.api.nvim_set_keymap('i', '<LEADER>$', '$$' .. _G.Next .. '<Esc>F$i', { noremap = true, silent = true})
-- 行间公式块
vim.api.nvim_set_keymap('i', '<LEADER>M', '$ '.. _G.CoLeader ..' $' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's', { noremap = true, silent = true})
-- end 数学模式

