-- - keymaps-fish.lua

-- begin 代码块
vim.api.nvim_set_keymap('i', '<LEADER>b', 
        'begin'                                         .. '<CR>' ..
        'end'                                           .. '<Esc>O'
, { noremap = true , silent = true })
-- end 代码块

-- begin if 语句
-- if
vim.api.nvim_set_keymap('i', '<LEADER>if', 
    'if test '                                          .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'end'                                               .. '<Esc>2k$a'
, { noremap = true , silent = true })
-- if-else
-- if-elif
-- if-elif-else
-- end if 语句
