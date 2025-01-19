"" c.vim

" 导入头文件
inoremap <LEADER>include #include <><Esc>F<a
" 导入标准输入输出
inoremap <LEADER>istdio #include <stdio.h>
" 打印
inoremap <LEADER>p printf();<Esc>F)i

" begin 宏替换
inoremap <LEADER>def #define 
inoremap <LEADER>undef #undef
" 宏条件
" macro-if
execute 'inoremap <LEADER>mif'                      . ' ' .
            \   '#if '                              . '<CR>' .
            \   '   <++>'                           . '<CR>' .
            \   '#endif'                            . '<CR>' .
            \   '<Esc>3k$a'

" macro-if-else
execute 'inoremap <LEADER>meif'                     . ' ' .
            \   '#if '                              . '<CR>' .
            \   '   <++>'                           . '<CR>' .
            \   '#else '                            . '<CR><BS>' .
            \   '   <++>'                           . '<CR>' .
            \   '#endif'                            . '<CR>' .
            \   '<Esc>5k$a'


" macro-if-elif
execute 'inoremap <LEADER>melif'                    . ' ' .
            \   '#if '                              . '<CR>' .
            \   '   <++>'                           . '<CR>' .
            \   '#elif <++>'                        . '<CR><BS>' .
            \   '   <++>'                           . '<CR>' .
            \   '#endif'                            . '<CR>' .
            \   '<Esc>5k$a'

" macro-if-elif
execute 'inoremap <LEADER>meelif'                   . ' ' .
            \   '#if '                              . '<CR>' .
            \   '   <++>'                           . '<CR>' .
            \   '#elif <++>'                        . '<CR><BS>' .
            \   '   <++>'                           . '<CR>' .
            \   '#else '                            . '<CR><BS>' .
            \   '   <++>'                           . '<CR>' .
            \   '#endif'                            . '<CR>' .
            \   '<Esc>7k$a'

" if-defnine
execute 'inoremap <LEADER>ifndef'                   . ' ' .
            \   '#ifndef '                          . '<CR>' .
            \   '#define <++>'                      . '<CR>' .
            \   '   <++>'                           . '<CR>' .
            \   '#endif'                            . '<CR>' .
            \   '<Esc>4k$a'
" ifdefine
inoremap <LEADER>ifdef  #ifdef
" end 宏替换


" begin main 函数
execute 'inoremap <LEADER>main'                     . ' ' .
            \   'int main(int argc, char *argv[]) {'. '<CR>' .
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
            \   'for () {'                          . '<CR>' .
            \   '<++>'                              . '<CR>' .
            \   '}'                                 .
            \   '<Esc>2k$2hi'
" end for 循环

" begin while 循环
execute 'inoremap <LEADER>while'                    . ' ' .
            \   'while () {'                        . '<CR>' .
            \   '<++>'                              . '<CR>' .
            \   '}'                                 .
            \   '<Esc>2k$2hi'
" end while 循环

" begin if 分支
execute 'inoremap <LEADER>if'                       . ' ' .
            \   'if () <++>'                        .
            \   '<Esc>F)i'
" end if 分支

" begin if-else_if 分支
execute 'inoremap <LEADER>elif'                     . ' ' .
            \   'if () {'                           . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 . '<CR>' .
            \   'else if (<++>) {'                  . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 . 
            \   '<Esc>5k$2hi'
" end if-else_if 分支

" begin if-else_if-else 分支
execute 'inoremap <LEADER>eelif'                    . ' ' .
            \   'if () {'                           . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 . '<CR>' .
            \   'else if (<++>) {'                  . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 . '<CR>' . 
            \   'else {'                            . '<CR>' . 
            \       '<++>'                          . '<CR>' .
            \   '}'                                 .
            \   '<Esc>8k$2hi'
" end if-else_if-else 分支

" begin if-else 分支
execute 'inoremap <LEADER>eif'                      . ' ' .
            \   'if () {'                           . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 . '<CR>' .
            \   'else {'                            . '<CR>' .
            \       '<++>'                          . '<CR>' .
            \   '}'                                 . 
            \   '<Esc>5k$2hi'
" end if-else 分支

" begin switch 分支
execute 'inoremap <LEADER>switch'                   . ' ' .
            \   'switch () {'                       . '<CR>' .
            \       'case <++> :'                   . '<CR>' .
            \               '<++>'                  . '<CR>' .
            \               'break;'                . '<CR>' .
            \       'default:'                      . '<CR>' .
            \               '<++>'                  . '<CR>' .
            \               'break;'                . '<CR>' .
            \   '}'                                 .
            \   '<Esc>7k$2hi'
" end switch 分支

" begin loop 循环
execute 'inoremap <LEADER>loop'                     . ' ' .
            \   'while (1) {'                       . '<CR>' .
            \   '}'                                 .
            \   '<Esc>O'
" end loop 循环



