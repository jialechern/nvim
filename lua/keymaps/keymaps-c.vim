
" 导入头文件
inoremap <LEADER>i #include
" 打印
inoremap <LEADER>p printf();<Esc>F)i


" begin main 函数
execute 'inoremap <LEADER>main'                     . ' ' .
            \   'int main(int argc, char *argv[])'  . '<CR>' .
            \   '{'                                 . '<CR>' .
            \   'return 0;'                         . '<CR>' .
            \   '}'                                 . '<CR>' .
            \   '<Esc>2kO'
" end main 函数

" begin 代码块
execute 'inoremap <LEADER>b'                        . ' ' .
            \   '{'                                 . '<CR>' .
            \   '}'                                 . 
            \   '<Esc>O'
" end 代码块

" begin for 循环
execute 'inoremap <LEADER>for'                      . ' ' .
            \   'for ()'                             . '<CR>' .
            \   '{'                                 . '<CR>' .
            \   '<++>'                              . '<CR>' .
            \   '}'                                 .
            \   '<Esc>3k$i'
" end for 循环

" begin while 循环
execute 'inoremap <LEADER>while'                    . ' ' .
            \   'while ()'                          . '<CR>' .
            \   '{'                                 . '<CR>' .
            \   '<++>'                              . '<CR>' .
            \   '}'                                 .
            \   '<Esc>3k$i'
" end while 循环

" begin if 分支
execute 'inoremap <LEADER>if'                       . ' ' .
            \   'if () <++>'                        .
            \   '<Esc>F)i'
" end if 分支

" begin if-else 分支
execute 'inoremap <LEADER>elif'                     . ' ' .
            \   'if () '                            . '<CR>' .
            \   '{'                                 . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '} else if (<++>) '                 . '<CR>' .
            \   '{'                                 . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 . 
            \   '<Esc>6k$hi'
" end if-else 分支

" begin switch 分支
execute 'inoremap <LEADER>switch'                   . ' ' .
            \   'switch ()'                         . '<CR>' .
            \   '{'                                 . '<CR>' .
            \       'case <++> :'                   . '<CR>' .
            \               '<++>'                  . '<CR>' .
            \               'break;'                . '<CR>' .
            \       'default:'                      . '<CR>' .
            \               '<++>'                  . '<CR>' .
            \               'break;'                . '<CR>' .
            \   '}'                                 .
            \   '<Esc>8k$i'
" end switch 分支




