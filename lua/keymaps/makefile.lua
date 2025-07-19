-- makefile.lua

-- begin ifeq 语句
vim.api.nvim_set_keymap('i', '<LEADER>ifeq', 
    'ifeq (, ' .. _G.Next .. ')'                    .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'endif'                                         .. '<Esc>2k$F,i'
, { noremap = true, silent = true})
-- end ifeq 语句

-- begin ifneq 语句
vim.api.nvim_set_keymap('i', '<LEADER>ifneq', 
    'ifneq (, ' .. _G.Next .. ')'                   .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'endif'                                         .. '<Esc>2k$F,i'
, { noremap = true, silent = true})
-- end ifneq 语句

-- begin ifeq-else 语句
vim.api.nvim_set_keymap('i', '<LEADER>eifeq', 
    'ifeq (, ' .. _G.Next .. ')'                    .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'else'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'endif'                                         .. '<Esc>4k$F,i'
, { noremap = true, silent = true})
-- end ifeq-else 语句

-- begin ifneq-else 语句
vim.api.nvim_set_keymap('i', '<LEADER>eifneq', 
    'ifneq (, ' .. _G.Next .. ')'                   .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'else'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'endif'                                         .. '<Esc>4k$F,i'
, { noremap = true, silent = true})
-- end ifneq-else 语句

-- begin ifdef 语句
vim.api.nvim_set_keymap('i', '<LEADER>ifdef', 
    'ifdef '                                        .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'endif'                                         .. '<Esc>2kA'
, { noremap = true, silent = true})
-- end ifdef 语句

-- begin ifdef-else 语句
vim.api.nvim_set_keymap('i', '<LEADER>eifdef', 
    'ifdef '                                        .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'else'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'endif'                                         .. '<Esc>4kA'
, { noremap = true, silent = true})
-- end ifdef-else 语句

-- begin ifndef 语句
vim.api.nvim_set_keymap('i', '<LEADER>ifndef', 
    'ifndef '                                       .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'endif'                                         .. '<Esc>2kA'
, { noremap = true, silent = true})
-- end ifndef 语句

-- begin ifndef-else 语句
vim.api.nvim_set_keymap('i', '<LEADER>eifndef', 
    'ifndef '                                       .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'else'                                          .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'endif'                                         .. '<Esc>4kA'
, { noremap = true, silent = true})
-- end ifndef-else 语句

