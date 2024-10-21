
" begin 一般设置
syntax on					" 开启语法高亮

set number					" 显示行号
set relativenumber				" 显示从当前行数的前后行数
set cursorline					" 高亮显示当前行
set wrap					" 自动换行
set showcmd					" 显示指令
set wildmenu					" 命令补全
set hlsearch					" 高亮显示搜索
set incsearch					" 动态高亮搜索"
set smartcase					" 智能大小写搜索
" end 一般设置


" begin 分屏设置
nnoremap sr :set splitright<CR>:vsplit<CR>	" 左分屏
nnoremap sl :set nosplitright<CR>:vsplit<CR>	" 右分屏
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
" end 分屏设置















