"" shell_base.vim

inoremap <LEADER>initb #!/bin/bash
inoremap <LEADER>initz #!/bin/zsh

" begin if 语句
execute 'inoremap <LEADER>if'                       . ' ' .
            \   'if '                               . '<CR>' .
            \   'then'                              . '<CR>' .
            \           '<++>'                      . '<CR>' .
            \   'fi'                                .
            \   '<Esc>3k$a'
" end if 语句

" begin elif 语句
execute 'inoremap <LEADER>elif'                     . ' ' .
            \   'if '                               . '<CR>' .
            \   'then'                              . '<CR>' .
            \           '<++>'                      . '<CR>' .
            \   'elif <++>'                         . '<CR>' .
            \   'then'                              . '<CR>' .
            \           '<++>'                      . '<CR>' .
            \   'fi'                                .
            \   '<Esc>6k$a'
" end elif 语句

" begin if-elif-else 语句
execute 'inoremap <LEADER>eelif'                    . ' ' .
            \   'if '                               . '<CR>' .
            \   'then'                              . '<CR>' .
            \           '<++>'                      . '<CR>' .
            \   'elif <++>'                         . '<CR>' .
            \   'then'                              . '<CR>' .
            \           '<++>'                      . '<CR>' .
            \   'else'                              . '<CR>' .
            \           '<++>'                      . '<CR>' .
            \   'fi'                                .
            \   '<Esc>8k$a'
" end if-elif-else 语句

" begin if-else 语句
execute 'inoremap <LEADER>eif'                      . ' ' .
            \   'if '                               . '<CR>' .
            \   'then'                              . '<CR>' .
            \           '<++>'                      . '<CR>' .
            \   'else'                              . '<CR>' .
            \           '<++>'                      . '<CR>' .
            \   'fi'                                .
            \   '<Esc>5k$a'
" end if-else 语句

" begin loop 循环
execute 'inoremap <LEADER>loop'                     . ' ' .
            \   'while true'                        . '<CR>' .
            \   'do'                                . '<CR>' .
            \   'done'                              . '<CR>' .
            \   '<Esc>kO'
" end loop 循环

" begin case 分支
execute 'inoremap <LEADER>case'                     . ' ' .
            \   'case  in'                          . '<CR><C-u>' .
            \   '<++>)'                             . '<CR><BS>' .
            \   '   <++>'                           . '<CR><C-u>' .
            \   '*)'                                . '<CR>' .
            \   '   <++>'                           . '<CR>' .
            \   'esac'                              . '<CR>' .
            \   '<Esc>6k$Fihi'
" end case 分支

