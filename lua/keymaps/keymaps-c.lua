-- - keymaps-c.lua

-- begin 导入头文件
-- include
vim.api.nvim_set_keymap('i', '<LEADER>include', '#include <>' .. '<Esc>F<a', { noremap = true, silent = true})
-- 导入标准输入输出
vim.api.nvim_set_keymap('i', '<LEADER>istdio', '#include <stdio.h>', { noremap = true, silent = true})
-- end 导入头文件

-- 打印
vim.api.nvim_set_keymap('i', '<LEADER>p', 'printf();' .. '<Esc>F)i', { noremap = true, silent = true})

-- begin 宏替换
vim.api.nvim_set_keymap('i', '<LEADER>def', '#define ', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>undef', '#undef ', { noremap = true, silent = true})
-- end 宏替换

-- begin 条件编译
-- macro-if
vim.api.nvim_set_keymap('i', '<LEADER>mif', 
'#if '                                              .. '<CR>' ..
    '   ' .. _G.Next                                .. '<CR>' ..
'#endif'                                            .. '<Esc>2k$a'
, { noremap = true, silent = true})
-- macro-if-else
vim.api.nvim_set_keymap('i', '<LEADER>meif', 
'#if '                                              .. '<CR>' ..
    '   ' .. _G.Next                                .. '<CR>' ..
'#else'                                             .. '<CR><BS>' ..
    '   ' .. _G.Next                                .. '<CR>' ..
'#endif'                                            .. '<Esc>4k$a'
, { noremap = true, silent = true})
-- macro-if-elif
vim.api.nvim_set_keymap('i', '<LEADER>melif', 
'#if '                                              .. '<CR>' ..
    '   ' .. _G.Next                                .. '<CR>' ..
'#elif ' .. _G.Next                                 .. '<CR><BS>' ..
    '   ' .. _G.Next                                .. '<CR>' ..
'#endif'                                            .. '<Esc>4k$a'
, { noremap = true, silent = true})
-- macro-if-elif-else
vim.api.nvim_set_keymap('i', '<LEADER>meelif', 
'#if '                                              .. '<CR>' ..
    '   ' .. _G.Next                                .. '<CR>' ..
'#elif ' .. _G.Next                                 .. '<CR><BS>' ..
    '   ' .. _G.Next                                .. '<CR>' ..
'#else'                                             .. '<CR><BS>' ..
    '   ' .. _G.Next                                .. '<CR>' ..
'#endif'                                            .. '<Esc>6k$a'
, { noremap = true, silent = true})
-- macro-if-defnine
vim.api.nvim_set_keymap('i', '<LEADER>mifndef', 
'#ifndef '                                          .. '<CR>' ..
'#define ' .. _G.Next                               .. '<CR>' ..
    '   ' .. _G.Next                                .. '<CR>' ..
'#endif'                                            .. '<Esc>3k$a'
, { noremap = true, silent = true})
-- macro-if-define
vim.api.nvim_set_keymap('i', '<LEADER>mifdef', '#ifdef ', { noremap = true , silent = true })
-- end 条件编译

-- begin main 函数
vim.api.nvim_set_keymap('i', '<LEADER>main', 
'int main (int argc, char *argv[]) {'               .. '<CR>' ..
        'return 0;'                                 .. '<CR>' ..
        '}'                                         .. '<Esc>kO'
, { noremap = true , silent = true })
-- end main 函数

-- begin 代码块
vim.api.nvim_set_keymap('i', '<LEADER>b', 
        '{'                                         .. '<CR>' ..
        '}'                                         .. '<Esc>O'
, { noremap = true , silent = true })
-- end 代码块

-- begin for 循环
vim.api.nvim_set_keymap('i', '<LEADER>for', 
        'for () {'                                  .. '<CR>' ..
                _G.Next                             .. '<CR>' ..
        '}'                                         .. '<Esc>2k$2hi'
, { noremap = true , silent = true })
-- end for 循环

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

-- begin loop 循环
vim.api.nvim_set_keymap('i', '<LEADER>loop', 
    'while (1) {'                                   .. '<CR>' ..
    '}'                                             .. '<Esc>O'
, { noremap = true , silent = true })
-- end loop 循环

