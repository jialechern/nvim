
" begin 设置魔法方法的快捷键
inoremap <LEADER>_ ____<++><Esc>F_hi
" 类构造器
" inoremap <LEADER>init def __init__(self, ): <CR><++><Esc>kf)i
execute 'inoremap <LEADER>init'                 . ' ' .
            \   'def __init__(self, ):'         . '<CR>' .
            \       '<++>'                      .
            \   '<Esc>kf)i'
" end   设置魔法方法的快捷键

" begin 打印
inoremap <LEADER>p print()<Esc>F)i
" end 打印

" begin 单元测试
execute 'inoremap <LEADER>main'                 . ' ' .
            \   'def main():'                   . '<CR>' .
            \       '<++>'                      . '<CR><CR><C-u>'
            \                                   .
            \   'if __name__ == "__main__":'    . '<CR>' .
            \   'main()'                        . '<CR>' .
            \   '<Esc>5k$hi'
" end 单元测试

" begin for 循环
execute 'inoremap <LEADER>for'                  . ' ' .
            \   'for  :'                        . '<CR>' .
            \       '<++>'                      . '<CR>' .
            \   '<Esc>2k$hi'
" end for 循环

" begin while 循环
execute 'inoremap <LEADER>while'                . ' ' .
            \   'while  :'                      . '<CR>' .
            \       '<++>'                      . '<CR>' .
            \   '<Esc>2k$hi'
" end while 循环

" begin match 分支
execute 'inoremap <LEADER>match'                . ' ' .
            \   'match  :'                      . '<CR>' .
            \       'case <++> :'               . '<CR>' .
            \   '<Esc>2k$hi'
" end match 分支

" begin if 分支
execute 'inoremap <LEADER>if'                   . ' ' .
            \   'if  :'                         . '<CR>' .
            \       '<++>'                      . '<CR>' .
            \   '<Esc>2k$hi'
" end if 分支

" begin if-elif 分支
execute 'inoremap <LEADER>elif'                 . ' ' .
            \   'if  :'                         . '<CR>' .
            \       '<++>'                      . '<CR>' .
            \   'elif <++> :'                   . '<CR>' .
            \       '<++>'                      . '<CR>' .
            \   '<Esc>4k$hi'
" end if-elif 分支

" begin if-else 分支
execute 'inoremap <LEADER>eif'                  . ' ' .
            \   'if  :'                         . '<CR>' .
            \       '<++>'                      . '<CR>' .
            \   'else:'                         . '<CR>' .
            \       '<++>'                      . '<CR>' .
            \   '<Esc>4k$hi'
" end if-else 分支

" begin if-elif-else 分支
execute 'inoremap <LEADER>eelif'                . ' ' .
            \   'if  :'                         . '<CR>' .
            \       '<++>'                      . '<CR>' .
            \   'elif <++> :'                   . '<CR>' .
            \       '<++>'                      . '<CR>' .
            \   'else:'                         . '<CR>' .
            \       '<++>'                      . '<CR>' .
            \   '<Esc>6k$hi'
" end if-elif-else 分支

" begin loop 循环
execute 'inoremap <LEADER>loop'                 . ' ' .
            \   'while True:'                   . '<CR>'
            \   '<Esc>O'
" end loop 循环


