" begin 控制命令
inoremap <LEADER>D _{} <++><Esc>F}i
inoremap <LEADER>U ^{} <++><Esc>F}i
" end   控制命令

" begin 公式块
inoremap <LEADER>math $$ <++><Esc>F$i
inoremap <LEADER>M $$<CR>$$<CR><++><Esc>kO
" end   公式块


" begin 一些常用的 left right 包裹的命令
inoremap <LEADER><LEADER> \\
inoremap <LEADER>inner \left\langle\right\rangle<++><Esc>2F\i
                    " 尖括号符号(内积)
inoremap <LEADER>tuple \left(\right)<++><Esc>F\i
                    " 圆括号
inoremap <LEADER>list \left[\right]<++><Esc>F\i
" end   一些常用的 left right 包裹的命令

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
inoremap <LEADER>d \mathrm{d}
inoremap <LEADER>p \partial
inoremap <LEADER>ker \mathrm{ker}
inoremap <LEADER>im \mathrm{im}
inoremap <LEADER>id \mathrm{id}
inoremap <LEADER>hom \mathrm{hom}
inoremap <LEADER>frac \dfrac{}{<++>} <++><Esc>2F}i
inoremap <LEADER>sum \sum_{} <++><Esc>F}i
inoremap <LEADER>lim \lim_{} <++><Esc>F}i
inoremap <LEADER>Lra \Longrightarrow
inoremap <LEADER>lra \longrightarrow
inoremap <LEADER>Lla \Longleftarrow
inoremap <LEADER>lla \longleftarrow
inoremap <LEADER>Iff \Longleftrightarrow
inoremap <LEADER>iff \longleftrightarrow
" end   一些数学专用符号

" begin 希腊字母
inoremap <LEADER>a \alpha
inoremap <LEADER>b \beta
inoremap <LEADER>g \gamma
inoremap <LEADER>G \Gamma
inoremap <LEADER>vphi \varphi
inoremap <LEADER>ve \varepsilon
inoremap <LEADER>e \epsilon
inoremap <LEADER>del \delta
inoremap <LEADER>lam \lambda
inoremap <LEADER>Lam \Lambda
" end   希腊字母

" begin 自定义环境
inoremap <LEADER>lineq \left\{\begin{array}{c}<CR>\end{array}\right.<CR><++><Esc>kO
inoremap <LEADER>vector \left(\begin{array}{c}\end{array}\right)<++><Esc>2F\i
inoremap <LEADER>matrix \left(\begin{array}{}<CR><++><CR>\end{array}\right)<Esc>2k$i
inoremap <LEADER>aligned \begin{aligned}<CR>\end{aligned}<CR><++><Esc>kO
" end   自定义环境



