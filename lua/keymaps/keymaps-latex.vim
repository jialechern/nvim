" begin 一般的 begin-end 环境
" inoremap <LEADER>be \begin{}<CR>\end{<++>}<CR><++><Esc>2k$i
execute 'inoremap <LEADER>be'   . ' ' .
            \   '\begin{}'      . '<CR>' .
            \   '\end{<++>}'    . '<CR>' .
            \   '<++><Esc>2k$i'
" end 一般的 begin-end 环境


" begin 等式环境
" 带标号
execute 'inoremap <LEADER>eq'       . ' ' .
            \   '\begin{equation}'  . '<CR>' .
            \   '\end{equation}'    . '<CR>' .
            \   '<++><Esc>kO'

" 不带标号
execute 'inoremap <LEADER>neq'      . ' ' .
            \   '\begin{equation*}' . '<CR>' .
            \   '\end{equation*}'   . '<CR>' .
            \   '<++><Esc>kO'
" end   等式环境


" begin 枚举环境
" enumerate 环境
execute 'inoremap <LEADER>enum'     . ' ' .
            \   '\begin{enumerate}' . '<CR>' .
            \   '\end{enumerate}'   . '<CR>' .
            \   '<++><Esc>kO\item' . ' '

" itemize 环境
execute 'inoremap <LEADER>itemize'  . ' ' .
            \   '\begin{itemize}'   . '<CR>' .
            \   '\end{itemize}'     . '<CR>' .
            \   '<++><Esc>kO\item' . ' '
" end   枚举环境

