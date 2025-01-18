"" rust.vim

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

" begin 代码块
execute 'inoremap <LEADER>b'                        . ' ' .
            \   '{'                                 . '<CR>' .
            \   '}'                                 . 
            \   '<Esc>O'
" end 代码块


" begin for 循环
execute 'inoremap <LEADER>for'                      . ' ' .
            \   'for  {'                             . '<CR>' .
            \   '<++>'                              . '<CR>' .
            \   '}'                                 .
            \   '<Esc>2k$hi'
" end for 循环

" begin while 循环
execute 'inoremap <LEADER>while'                    . ' ' .
            \   'while  {'                          . '<CR>' .
            \   '<++>'                              . '<CR>' .
            \   '}'                                 .
            \   '<Esc>2k$hi'
" end while 循环


" begin if 分支
execute 'inoremap <LEADER>if'                       . ' ' .
            \   'if  {'                             . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 .
            \   '<Esc>2k$hi'
" end if 分支

" begin elif 分支
execute 'inoremap <LEADER>elif'                     . ' ' .
            \   'if  {'                             . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '} else if <++> {'                  . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 . 
            \   '<Esc>4k$hi'
" end elif 分支

" begin if-else 分支
execute 'inoremap <LEADER>eif'                      . ' ' .
            \   'if  {'                             . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '} else  {'                         . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 . 
            \   '<Esc>4k$hi'
" end if-else 分支

" begin elif-else 分支
execute 'inoremap <LEADER>eelif'                    . ' ' .
            \   'if  {'                             . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '} else if <++> {'                  . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '} else {'                          . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 .
            \   '<Esc>6k$hi'
" end elif-else 分支

" begin match 模式匹配
execute 'inoremap <LEADER>match'                    . ' ' .
            \   'match  {'                          . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 .
            \   '<Esc>2k$hi'
" end match 模式匹配

" begin loop 循环
execute 'inoremap <LEADER>loop'                     . ' ' .
            \   'loop {'                            . '<CR>' .
            \   '}'                                 .
            \   '<Esc>O'
" end loop 循环



