" begin 分屏设置
nnoremap sr :set nosplitright<CR>:vsplit<CR>	" 左分屏
nnoremap sl :set splitright<CR>:vsplit<CR>	" 右分屏
nnoremap su :set nosplitbelow<CR>:split<CR>	" 上分屏
nnoremap sd :set splitbelow<CR>:split<CR>	" 下分屏
nnoremap <C-h> <C-w>h				" 分屏时光标左移
nnoremap <C-l> <C-W>l				" 分屏时光标右移
nnoremap <C-k> <C-w>k				" 分屏时光标上移
nnoremap <C-j> <C-w>j				" 分屏时光标下移
nnoremap <C-Left> :vertical resize-5<CR>	" 纵向分屏分界线左移
nnoremap <C-Right> :vertical resize+5<CR>	" 纵向分屏分界线右移
nnoremap <C-Up> :resize+5<CR>			" 横向分屏分界线上移
nnoremap <C-Down> :resize-5<CR>			" 横向分屏分界线下移
nnoremap sv <C-w>t<C-w>H			" 横向分屏改为纵向分屏
nnoremap sh <C-w>t<C-w>K			" 纵向分屏改为横向分屏
nnoremap <A-Left> :wincmd H<CR>			" 将当前分屏移至最左
nnoremap <A-Right> :wincmd L<CR>		" 将当前分屏移至最右
nnoremap <A-Up> :wincmd K<CR>			" 将当前分屏移至最上
nnoremap <A-Down> :wincmd J<CR>			" 将当前分屏移至最
" end 分屏设置

" begin 转译字符
inoremap <LEADER>` `
inoremap `<LEADER> .
inoremap `` ``
inoremap <LEADER><LEADER> ..
" end   转译字符


