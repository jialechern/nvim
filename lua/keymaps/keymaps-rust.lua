-- - keymaps-rust.lua

-- begin main
vim.api.nvim_set_keymap('i', '<LEADER>main', 
'fn main () -> Result<(), Box<dyn std::error::Error>> {'            .. '<CR><Esc>0i\t' ..
    'Ok(())'                                                        .. '<CR>' ..
'}'                                                                 .. '<Esc>kO'
,{ noremap = true, silent = true})
-- end main

-- begin init test
vim.api.nvim_set_keymap('i', '<LEADER>initt', 
'#[cfg(test)]'                          .. '<CR>' ..
'mod tests {'                           .. '<CR>' ..
    'use super::*;'                     .. '<CR><CR>' ..

    '#[test]'                           .. '<CR>' ..
    'fn  () {'                          .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
    '}'                                 .. '<CR>' ..
'}'                                     .. '<Esc>3k$Fnla'
,{ noremap = true, silent = true})
-- end init test

-- 匿名函数
vim.api.nvim_set_keymap('i', '<LEADER><Bar>', '<Bar><Bar>' .. _G.Next .. '<Esc>F<Bar>i',{ noremap = true, silent = true})
-- 打印
vim.api.nvim_set_keymap('i', '<LEADER>p', 'println!();' .. '<Esc>F)i',{ noremap = true, silent = true})

-- begin for 循环
vim.api.nvim_set_keymap('i', '<LEADER>for', 
'for  {'                                 .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>2k$hi'
,{ noremap = true, silent = true})
-- end for 循环

-- begin while 循环
vim.api.nvim_set_keymap('i', '<LEADER>while', 
'while  {'                              .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>2k$hi'
,{ noremap = true, silent = true})
-- end while 循环

-- begin if 分支
vim.api.nvim_set_keymap('i', '<LEADER>if', 
'if  {'                                 .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>2k$hi'
,{ noremap = true, silent = true})
-- end if 分支

-- begin elif 分支
vim.api.nvim_set_keymap('i', '<LEADER>elif', 
'if  {'                                 .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'} else if ' .. _G.Next .. ' {'         .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>4k$hi'
,{ noremap = true, silent = true})
-- end elif 分支

-- begin elif-else 分支
vim.api.nvim_set_keymap('i', '<LEADER>eelif', 
'if  {'                                 .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'} else if ' .. _G.Next .. ' {'         .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'} else {'                              .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>6k$hi'
,{ noremap = true, silent = true})
-- end elif-else 分支

-- begin match 模式匹配
vim.api.nvim_set_keymap('i', '<LEADER>match', 
'match  {'                              .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>2k$hi'
,{ noremap = true, silent = true})
-- end match 模式匹配

-- begin loop 循环
vim.api.nvim_set_keymap('i', '<LEADER>loop', 
'loop {'                               .. '<CR>' ..
'}'                                     .. '<Esc>O'
,{ noremap = true, silent = true})
-- end loop 循环

