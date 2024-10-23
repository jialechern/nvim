inoremap <LEADER><LEADER> \
inoremap <LEADER>inner \left\langle\right\rangle<Esc>12hi
                    " 尖括号符号(内积)
inoremap <LEADER>tuple \left(\right)<Esc>6hi
                    " 圆括号
inoremap <LEADER>list \left[\right]<Esc>6hi

" begin 一些双线体大写字母
inoremap <LEADER>N \mathbb{N}
inoremap <LEADER>Q \mathbb{Q}
inoremap <LEADER>R \mathbb{R}
inoremap <LEADER>C \mathbb{C}
" end   一些双线体大写字母

" begin 一些花体大写字母
inoremap <LEADER>T \mathcal{T}
inoremap <LEADER>L \mathcal{L}
inoremap <LEADER>P \mathcal{P}
inoremap <LEADER>A \mathcal{A}
inoremap <LEADER>B \mathcal{B}
inoremap <LEADER>H \mathcal{H}
" end   一些花体大写字母

" begin 一些数学专用符号
inoremap <LEADER>id \mathrm{id}
inoremap <LEADER>hom \mathrm{hom}
inoremap <LEADER>frac \dfrac{}{}<Esc>2hi
inoremap <LEADER>sum \sum_{}<Esc>i
inoremap <LEADER>lim \lim_{}<Esc>i
" end   一些数学专用符号

" begin 自定义环境
inoremap <LEADER>lineq \left\{\begin{array}{c}<CR>\end{array}\right.<Esc>O
inoremap <LEADER>vector \left(\begin{array}{c}\end{array}\right)<Esc>17hi
" end   自定义环境



