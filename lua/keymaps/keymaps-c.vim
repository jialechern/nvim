
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


