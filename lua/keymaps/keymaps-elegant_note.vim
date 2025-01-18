"" elegant_note.vim

" begin 定义环境
execute 'inoremap <LEADER>def'          . ' ' .
            \   '\begin{definition}[]'  . '<CR>' .
            \   '\end{definition}'      . '<CR>' .
            \   '<++><Esc>2k$i'
" end 定义环境


" begin 定理环境
execute 'inoremap <LEADER>theorem'      . ' ' .
            \   '\begin{theorem}[]'     . '<CR>' .
            \   '\end{theorem}'         . '<CR>' .
            \   '<++><Esc>2k$i'
" end 定理环境


" begin 证明环境
execute 'inoremap <LEADER>proof'        . ' ' .
            \   '\begin{proof}'         . '<CR>' .
            \   '\end{proof}'           . '<CR>' .
            \   '<++><Esc>kO'
" end 证明环境


" begin 引理环境
execute 'inoremap <LEADER>lemma'        . ' ' .
            \   '\begin{lemma}[]'       . '<CR>' .
            \   '\end{lemma}'           . '<CR>' .
            \   '<++><Esc>2k$i'
" end 引理环境


" begin 命题环境
execute 'inoremap <LEADER>proposition'  . ' ' .
            \   '\begin{proposition}[]' . '<CR>' .
            \   '\end{proposition}'     . '<CR>' .
            \   '<++><Esc>2k$i'
" end 命题环境


" begin 推论环境
execute 'inoremap <LEADER>corollary'    . ' ' .
            \   '\begin{corollary}[]'   . '<CR>' .
            \   '\end{corollary}'       . '<CR>' .
            \   '<++><Esc>2k$i'
" end 推论环境


" begin 猜想环境
execute 'inoremap <LEADER>conjecture'   . ' ' .
            \   '\begin{conjecture}[]'  . '<CR>' .
            \   '\end{conjecture}'      . '<CR>' .
            \   '<++><Esc>2k$i'
" end 猜想环境

" begin 示例环境
execute 'inoremap <LEADER>example'      . ' ' .
            \   '\begin{example}[]'     . '<CR>' .
            \   '\end{example}'         . '<CR>' .
            \   '<++><Esc>2k$i'
" end 示例环境


" begin 备注环境
execute 'inoremap <LEADER>note'         . ' ' .
            \   '\begin{note}[]'        . '<CR>' .
            \   '\end{note}'            . '<CR>' .
            \   '<++><Esc>2k$i'
" end 备注环境


" begin 评论环境
execute 'inoremap <LEADER>remark'       . ' ' .
            \   '\begin{remark}[]'      . '<CR>' .
            \   '\end{remark}'          . '<CR>' .
            \   '<++><Esc>2k$i'
" end 评论环境


" begin 案例环境
execute 'inoremap <LEADER>case'         . ' ' .
            \   '\begin{case}[]'        . '<CR>' .
            \   '\end{case}'            . '<CR>' .
            \   '<++><Esc>2k$i'
" end 案例环境


" begin 图片环境
execute 'inoremap <LEADER>img'          . ' ' .
            \   '\begin{figure}[]'      . '<CR>' .
            \       '\centering<CR>'    .
            \       '\includegraphics[width=\textwidth]{<++>}' . 
            \                           '<CR>' .
            \       '\caption{<++>}'    . '<CR>' .
            \       '\label{fig:<++>}'  . '<CR>' .
            \   '\end{figure}'          . '<CR><++>' .
            \   '<Esc>6k$i'
" end 图片环境



