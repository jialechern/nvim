-- - keymaps-python.lua

-- 设置魔法方法快捷键
vim.api.nvim_set_keymap('i', '<LEADER>_', '____' .. _G.Next .. '<Esc>2F_i', { noremap = true, silent = true})

-- 打印
vim.api.nvim_set_keymap('i', '<LEADER>p', 'print()<Esc>F(a', { noremap = true, silent = true})

-- begin 对象初始化
vim.api.nvim_set_keymap('i', '<LEADER>init', 
    'def __init__(self, ):'                             .. '<CR>' ..
            '<++>'                                      .. '<CR>' ..
                                                        '<Esc>2k$hi'
, { noremap = true, silent = true})
-- end 对象初始化

-- begin 单元测试
vim.api.nvim_set_keymap('i', '<LEADER>main', 
    'def main():'                                           .. '<CR>' ..
            _G.Next                                         .. '<CR><CR><C-u>' ..

    'if __name__ == "__main__":'                            .. '<CR>' ..
            'main()'                                        .. '<Esc>5k$hi'
, { noremap = true, silent = true})
-- end 单元测试

-- begin for 循环
vim.api.nvim_set_keymap('i', '<LEADER>for', 
    'for  :'                                                .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end for'                                             .. '<Esc>2k$hi'
, { noremap = true, silent = true})
-- end for 循环

-- begin while 循环
vim.api.nvim_set_keymap('i', '<LEADER>while', 
    'while  :'                                              .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end while'                                           .. '<Esc>2k$hi'
, { noremap = true, silent = true})
-- end while 循环

-- begin loop 循环
vim.api.nvim_set_keymap('i', '<LEADER>loop', 
    'while True :'                                          .. '<CR><BS>' ..
    '# end while'                                           .. '<Esc>O'
, { noremap = true, silent = true})
-- end loop 循环

-- begin match 分支
vim.api.nvim_set_keymap('i', '<LEADER>match', 
    'match  :'                                              .. '<CR>' ..
        'case ' .. _G.Next .. ' :'                          .. '<CR>' ..
                _G.Next                                     .. '<CR><BS><BS>' ..
    '# end match'                                           .. '<Esc>3k$hi'
, { noremap = true, silent = true})
-- end match 分支

-- begin if 分支
vim.api.nvim_set_keymap('i', '<LEADER>if', 
    'if  :'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end if'                                              .. '<Esc>3k$hi'
, { noremap = true, silent = true})
-- end if 分支

-- begin if-else 分支
vim.api.nvim_set_keymap('i', '<LEADER>eif', 
    'if  :'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    'else:'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end if'                                              .. '<Esc>4k$hi'
, { noremap = true, silent = true})
-- end if-else 分支

-- begin elif 分支
vim.api.nvim_set_keymap('i', '<LEADER>elif', 
    'if  :'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    'elif ' .. _G.Next .. ' :'                              .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end if'                                              .. '<Esc>5k$hi'
, { noremap = true, silent = true})
-- end elif 分支

-- begin elif-else 分支
vim.api.nvim_set_keymap('i', '<LEADER>eelif', 
    'if  :'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    'elif ' .. _G.Next .. ' :'                              .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    'else:'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end if'                                              .. '<Esc>6k$hi'
, { noremap = true, silent = true})
-- end elif-else 分支


