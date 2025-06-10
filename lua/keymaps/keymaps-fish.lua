-- - keymaps-fish.lua

-- begin if 语句
-- if
vim.api.nvim_set_keymap('i', '<LEADER>if', 
    'if test '                                          .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'end'                                               .. '<Esc>2k$a'
, { noremap = true , silent = true })
-- if-else
vim.api.nvim_set_keymap('i', '<LEADER>eif', 
    'if test '                                          .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'else'                                              .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'end'                                               .. '<Esc>4k$a'
, { noremap = true , silent = true })
-- if-elif
vim.api.nvim_set_keymap('i', '<LEADER>elif', 
    'if test '                                          .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'else if test ' .. _G.Next                          .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'end'                                               .. '<Esc>4k$a'
, { noremap = true , silent = true })
-- if-elif-else
vim.api.nvim_set_keymap('i', '<LEADER>eelif', 
    'if test '                                          .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'else if test ' .. _G.Next                          .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'else'                                              .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'end'                                               .. '<Esc>6k$a'
, { noremap = true , silent = true })
-- end if 语句

-- begin for 循环
vim.api.nvim_set_keymap('i', '<LEADER>for', 
    'for  in ' .. _G.Next                               .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'end'                                               .. '<Esc>2k^fihi'
, { noremap = true , silent = true })
-- end for 循环

-- begin while 循环
vim.api.nvim_set_keymap('i', '<LEADER>while', 
    'while test '                                       .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'end'                                               .. '<Esc>2k$a'
, { noremap = true , silent = true })
-- end while 循环

-- begin switch 分支
vim.api.nvim_set_keymap('i', '<LEADER>switch', 
    'switch ""'                                         .. '<CR>' ..
        'case "' .. _G.Next .. '"'                      .. '<CR>' ..
                _G.Next                                 .. '<CR>' ..
        'case "*"'                                      .. '<CR>' ..
                _G.Next                                 .. '<CR>' ..
    'end'                                               .. '<Esc>5k$i'
, { noremap = true , silent = true })
-- end switch 分支

-- begin 函数
vim.api.nvim_set_keymap('i', '<LEADER>func', 
    'function '                                         .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
    'end'                                               .. '<Esc>2k$a'
, { noremap = true , silent = true })
-- end 函数

