-- - keymaps-javascript.lua

-- 设置严格模式
vim.api.nvim_set_keymap('i', '<LEADER>us', '"use strict";', { noremap = true, silent = true})

-- base init
vim.api.nvim_set_keymap('i', '<LEADER>init', '#!/usr/bin/env node<CR>', { noremap = true, silent = true})

-- 字符串插值
vim.api.nvim_set_keymap('i', '<LEADER>$', '${  }' .. '<Esc>F{la', { noremap = true, silent = true})

-- begin 代码块
vim.api.nvim_set_keymap('i', '<LEADER>b', 
        '{'                                         .. '<CR>' ..
        '}'                                         .. '<Esc>O'
, { noremap = true , silent = true })
-- end 代码块

-- begin if 分支
vim.api.nvim_set_keymap('i', '<LEADER>if', 
        'if () ' .. _G.Next                         .. '<Esc>F)i'
, { noremap = true , silent = true })
-- end if 分支

-- begin if-else 分支
vim.api.nvim_set_keymap('i', '<LEADER>eif', 
        'if () {'                                   .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
        '} else {'                                  .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
        '}'                                         .. '<Esc>4k$2hi'
, { noremap = true , silent = true })
-- end if-else 分支

-- begin if-else_if 分支
vim.api.nvim_set_keymap('i', '<LEADER>elif', 
        'if () {'                                   .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
        '} else if (' .. _G.Next .. ') {'           .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
        '}'                                         .. '<Esc>4k$2hi'
, { noremap = true , silent = true })
-- end if-else_if 分支

-- begin if-else_if-else 分支
vim.api.nvim_set_keymap('i', '<LEADER>eelif', 
        'if () {'                                   .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
        '} else if (' .. _G.Next .. ') {'           .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
        '} else {'                                  .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
        '}'                                         .. '<Esc>6k$2hi'
, { noremap = true , silent = true })
-- end if-else_if-else 分支

-- begin switch 分支
vim.api.nvim_set_keymap('i', '<LEADER>switch', 
    'switch () {'                                   .. '<CR>' ..
        'case ' .. _G.Next .. ' :'                  .. '<CR>' ..
                _G.Next                             .. '<CR><BS>' ..
                'break;'                            .. '<CR>' ..
        'default:'                                  .. '<CR>' ..
                _G.Next                             .. '<CR><BS>' ..
                'break;'                            .. '<CR>' ..
    '}'                                             .. '<Esc>7k$2hi'
, { noremap = true , silent = true })
-- end switch 分支

-- begin while 循环
vim.api.nvim_set_keymap('i', '<LEADER>while', 
        'while () {'                                .. '<CR>' ..
                _G.Next                             .. '<CR>' ..
        '}'                                         .. '<Esc>2k$2hi'
, { noremap = true , silent = true })
-- end while 循环

-- begin do-while 循环
vim.api.nvim_set_keymap('i', '<LEADER>dowhile', 
        'do {'                                      .. '<CR>' ..
        '} while ();'                               .. '<Esc>F(a'
, { noremap = true , silent = true })
-- end do-while 循环

-- begin loop 循环
vim.api.nvim_set_keymap('i', '<LEADER>loop', 
    'while (true) {'                                .. '<CR>' ..
    '}'                                             .. '<Esc>O'
, { noremap = true , silent = true })
-- end loop 循环

-- begin function
vim.api.nvim_set_keymap('i', '<LEADER>func', 
        'function  {'                               .. '<CR>' ..
                _G.Next                             .. '<CR>' ..
        '}'                                         .. '<Esc>2k$hi'
, { noremap = true , silent = true })
-- end function

-- begin for 循环
vim.api.nvim_set_keymap('i', '<LEADER>for', 
        'for () {'                                  .. '<CR>' ..
                _G.Next                             .. '<CR>' ..
        '}'                                         .. '<Esc>2k$2hi'
, { noremap = true , silent = true })
-- end for 循环

