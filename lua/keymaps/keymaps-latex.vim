" 一般的 begin-end 环境
inoremap <LEADER>be \begin{}<CR>\end{<++>}<CR><++><Esc>2k$i

" begin 等式环境
inoremap <LEADER>eq \begin{equation}<CR>\end{equation}<CR><++><Esc>kO
inoremap <LEADER>neq \begin{equation*}<CR>\end{equation*}<CR><++><Esc>kO
" end   等式环境

" begin 枚举环境
inoremap <LEADER>enum \begin{enumerate}<CR>\end{enumerate}<CR><++><Esc>kO
inoremap <LEADER>itemize \begin{itemize}<CR>\end{itemize}<CR><++><Esc>kO
" end   枚举环境

