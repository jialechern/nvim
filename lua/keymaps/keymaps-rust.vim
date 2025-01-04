
" begin 匿名函数
execute 'inoremap <LEADER><Bar>' . ' ' .
            \   '<Bar><Bar><++>' .
            \   '<Esc>F<Bar>i'
" end 匿名函数

" begin 打印
execute 'inoremap <LEADER>p' . ' ' .
            \   'println!();' .
            \   '<Esc>F)i'
" end 打印


