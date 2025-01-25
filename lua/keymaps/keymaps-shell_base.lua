-- - kemaps-shell_base.lua

-- begin init shell
-- bash
vim.api.nvim_set_keymap('i', '<LEADER>initb', '#!/bin/bash ', { noremap = true, silent = true})
-- zsh
vim.api.nvim_set_keymap('i', '<LEADER>initz', '#!/bin/zsh ', { noremap = true, silent = true})
-- end init shell

-- begin if 语句
vim.api.nvim_set_keymap('i', '<LEADER>if', 
    'if '                                           .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'fi'                                            .. '<Esc>3kA'
, { noremap = true, silent = true})
-- end if 语句

-- begin if-else 语句
vim.api.nvim_set_keymap('i', '<LEADER>eif', 
    'if '                                           .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'else'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'fi'                                            .. '<Esc>5kA'
, { noremap = true, silent = true})
-- end if-else 语句

-- begin elif 语句
vim.api.nvim_set_keymap('i', '<LEADER>elif', 
    'if '                                           .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'elif ' .. _G.Next                              .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'fi'                                            .. '<Esc>6kA'
, { noremap = true, silent = true})
-- end elif 语句

-- begin elif-else 语句
vim.api.nvim_set_keymap('i', '<LEADER>eelif', 
    'if '                                           .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'elif ' .. _G.Next                              .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'else'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'fi'                                            .. '<Esc>8kA'
, { noremap = true, silent = true})
-- end elif-else 语句

-- begin loop 语句
vim.api.nvim_set_keymap('i', '<LEADER>loop', 
    'while true'                                    .. '<CR>' ..
    'do'                                            .. '<CR>' ..
    'done'                                          .. '<Esc>O'
, { noremap = true, silent = true})
-- end loop 语句

-- begin case 分支
vim.api.nvim_set_keymap('i', '<LEADER>case', 
    'case  in'                                      .. '<CR><C-u>' ..
    _G.Next .. ')'                                  .. '<CR><BS>' ..
        '   ' .. _G.Next                            .. '<CR><C-u>' ..
    '*)'                                            .. '<CR>' ..
        '   ' .. _G.Next                            .. '<CR>' ..
    'esac'                                          .. '<Esc>5k$Fihi'
, { noremap = true, silent = true})
-- end case 分支

