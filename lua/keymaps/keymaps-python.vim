
" begin 设置魔法方法的快捷键
inoremap <LEADER>_ ____<++><Esc>F_hi
" 类构造器
" inoremap <LEADER>init def __init__(self, ): <CR><++><Esc>kf)i
execute 'inoremap <LEADER>init' . ' ' .
            \   'def __init__(self, ):' . '<CR><++>' .
            \   '<Esc>kf)i'
" end   设置魔法方法的快捷键

" begin 打印
inoremap <LEADER>p print()<Esc>F)i
" end 打印

" begin 单元测试
execute 'inoremap <LEADER>main' . ' ' .
            \   'def main():'                   . '<CR>' .
            \   '<++><CR><CR>'                  .
            \   '<C-u>'                         .
            \   'if __name__ == "__main__":'    . '<CR>' .
            \   'main()'                        . '<CR>' .
            \   '<Esc>5k$hi'
" end 单元测试



