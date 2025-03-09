-- - kemaps-shell_base.lua

-- begin init shell
-- base init
vim.api.nvim_set_keymap('i', '<LEADER>init', '#!/usr/bin/env ', { noremap = true, silent = true})
-- bash
vim.api.nvim_set_keymap('i', '<LEADER>initb', '#!/bin/bash<CR>', { noremap = true, silent = true})
-- zsh
vim.api.nvim_set_keymap('i', '<LEADER>initz', '#!/bin/zsh<CR>', { noremap = true, silent = true})
-- end init shell

-- begin if 语句
-- if
vim.api.nvim_set_keymap('i', '<LEADER>if', 
    'if test '                                      .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'fi'                                            .. '<Esc>3kA'
, { noremap = true, silent = true})
-- if-else
vim.api.nvim_set_keymap('i', '<LEADER>eif', 
    'if test '                                      .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'else'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'fi'                                            .. '<Esc>5kA'
, { noremap = true, silent = true})
-- elif
vim.api.nvim_set_keymap('i', '<LEADER>elif', 
    'if test '                                      .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'elif test ' .. _G.Next                         .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'fi'                                            .. '<Esc>6kA'
, { noremap = true, silent = true})
-- if-elif-else 
vim.api.nvim_set_keymap('i', '<LEADER>eelif', 
    'if test '                                      .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'elif test ' .. _G.Next                         .. '<CR>' ..
    'then'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'else'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'fi'                                            .. '<Esc>8kA'
, { noremap = true, silent = true})
-- end if 语句

-- begin for 循环语句
vim.api.nvim_set_keymap('i', '<LEADER>for', 
    'for $ in ' .. _G.Next                          .. '<CR>' ..
    'do'                                            .. '<CR>' ..
        _G.Next                                     .. '<CR>' ..
    'done'                                          .. '<Esc>3k^f$a'
, { noremap = true, silent = true})
-- end for 循环语句

-- begin loop 循环
vim.api.nvim_set_keymap('i', '<LEADER>loop', 
    'while true'                                    .. '<CR>' ..
    'do'                                            .. '<CR>' ..
    'done'                                          .. '<Esc>O'
, { noremap = true, silent = true})
-- end loop 循环

-- begin while 循环
vim.api.nvim_set_keymap('i', '<LEADER>while', 
    'while test '                                   .. '<CR>' ..
    'do'                                            .. '<CR>' ..
        _G.Next                                     .. '<CR>' ..
    'done'                                          .. '<Esc>3kA'
, { noremap = true, silent = true})
-- end while 循环

-- begin case 分支
vim.api.nvim_set_keymap('i', '<LEADER>case', 
    'case  in'                                      .. '<CR><BS>' ..
    _G.Next .. ')'                                  .. '<CR>' ..
            _G.Next                                 .. '<CR><BS>' ..
    '*)'                                            .. '<CR>\t' ..
            _G.Next                                 .. '<CR>' ..
    'esac'                                          .. '<Esc>5k$Fihi'
, { noremap = true, silent = true})
-- end case 分支

-- begin 函数
vim.api.nvim_set_keymap('i', '<LEADER>func', 
    'function () {'                                 .. '<CR>' ..
        _G.Next                                     .. '<CR>' ..
    '}'                                             .. '<Esc>2k^f(i'
, { noremap = true, silent = true})
-- end 函数

