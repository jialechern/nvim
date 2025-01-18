"" makefile.vim

" ifeq 语句
execute 'inoremap <LEADER>ifeq'             . ' ' . 
            \   'ifeq (, <++>)'             . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'endif'                     . '<CR>' .
            \   '<Esc>3k$F,i'
            
" ifeq-else 语句
execute 'inoremap <LEADER>eifeq'            . ' ' . 
            \   'ifeq (, <++>)'             . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'else'                      . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'endif'                     . '<CR>' .
            \   '<Esc>5k$F,i'

" ifneq 语句
execute 'inoremap <LEADER>ifneq'            . ' ' . 
            \   'ifneq (, <++>)'            . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'endif'                     . '<CR>' .
            \   '<Esc>3k$F,i'
            
" ifneq-else 语句
execute 'inoremap <LEADER>eifneq'           . ' ' . 
            \   'ifneq (, <++>)'            . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'else'                      . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'endif'                     . '<CR>' .
            \   '<Esc>5k$F,i'

" ifdef 语句
execute 'inoremap <LEADER>ifdef'            . ' ' . 
            \   'ifdef '                    . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'endif'                     . '<CR>' .
            \   '<Esc>3k$a'
            
" ifdef-else 语句
execute 'inoremap <LEADER>eifdef'           . ' ' . 
            \   'ifdef '                    . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'else'                      . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'endif'                     . '<CR>' .
            \   '<Esc>5k$a'

" ifndef 语句
execute 'inoremap <LEADER>ifndef'           . ' ' . 
            \   'ifndef '                   . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'endif'                     . '<CR>' .
            \   '<Esc>3k$a'
            
" ifndef-else 语句
execute 'inoremap <LEADER>eifndef'          . ' ' . 
            \   'ifndef '                   . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'else'                      . '<CR>' .
            \       '<++>'                  . '<CR>' .
            \   'endif'                     . '<CR>' .
            \   '<Esc>5k$a'

