-- - keymaps-markdown.lua

-- begin 字词修饰
-- 加粗字体
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'b', '****' .. _G.Next .. '<Esc>2F*i', { noremap = true, silent = true})
-- 删除线
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'd', '~~~~' .. _G.Next .. '<Esc>2F~i', { noremap = true, silent = true})
-- 斜体字体
vim.api.nvim_set_keymap('i', _G.CoLeader .. 's', '__' .. _G.Next .. '<Esc>F_i', { noremap = true, silent = true})
-- 加粗斜体字体
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'S', '******' .. _G.Next .. '<Esc>3F*i', { noremap = true, silent = true})
-- end 字词修饰

-- begin 文本控制
-- 换行
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'n', '<CR><br><CR>', { noremap = true, silent = true})
-- 段落
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'p', '<p><CR></p><CR>' .. _G.Next .. '<Esc>kO', { noremap = true, silent = true})
-- 引用
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'r', '<Esc>mcI> <Esc>`c2la', { noremap = true, silent = true})
-- 链接1
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'link', '[](' .. _G.Next .. ')<Esc>F[a', { noremap = true, silent = true})
-- 链接2
vim.api.nvim_set_keymap('i', _G.CoLeader .. '@', '<' .. _G.CoLeader ..'>' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's', { noremap = true, silent = true})
-- 图片
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'img', '![](' .. _G.Next .. ')<Esc>F]i', { noremap = true, silent = true})
-- 页间分隔线
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'll', '----------------<CR>', { noremap = true, silent = true})
-- 一级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '1', '# ', { noremap = true, silent = true})
-- 二级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '2', '## ', { noremap = true, silent = true})
-- 三级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '3', '### ', { noremap = true, silent = true})
-- 四级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '4', '#### ', { noremap = true, silent = true})
-- end 文本控制

-- begin 代码块
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'C', 
'```'                                       .. '<CR>' .. 
    _G.Next                                 .. '<CR>' ..
'```'                                       .. '<CR>' ..
'<Esc>3kA'
, { noremap = true, silent = true})
-- end 代码块


