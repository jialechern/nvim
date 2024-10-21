
" begin 一般设置
" lua require('init')				" 使用 lua 配置文件
syntax on					" 开启语法高亮

" set mouse=a					" 允许使用鼠标
set encoding=utf-8				" 使用 utf-8 编码
set tabstop=8					" 设置 tab 的缩进大小
set list					" 显示空白字符
set backspace=indent,eol,start			" 设置退格键自动换行

set foldmethod=indent				" 可折叠代码
" set laststatus=2

set autochdir					" 设置 vim/neovim 的指令命令路径
au BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif
						" 记住上一次文件关闭时的光标所在位置

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
nnoremap sv <C-w>t<C-w>H			" 横向分屏改为纵向分屏
nnoremap sh <C-w>t<C-w>K			" 纵向分屏改为横向分屏
nnoremap <A-Left> :wincmd H<CR>			" 将当前分屏移至最左
nnoremap <A-Right> :wincmd L<CR>		" 将当前分屏移至最右
nnoremap <A-Up> :wincmd K<CR>			" 将当前分屏移至最上
nnoremap <A-Down> :wincmd J<CR>			" 将当前分屏移至最
" end 分屏设置


" begin 标签页设置

" end 标签页设置


" begin 插件设置
" 自动配置插件
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs 
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif


call plug#begin('~/.local/share/nvim/plugged')

call plug#end()
" end 插件设置












