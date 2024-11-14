" begin 字词修饰
inoremap `b **** <++><Esc>F*hi
inoremap `d ~~~~ <++><Esc>F~hi
inoremap `s __ <++><Esc>F_i
inoremap `S ****** <++><Esc>3F*i
" end   字词修饰

" begin 文本控制
inoremap `n <CR><br><CR> 
inoremap `p <p><CR></p><CR><++><Esc>kO
inoremap `r <Esc>mcI> <Esc>`c2la
inoremap `link <CR>[]<CR>(<++>)<Esc>kF[a
inoremap `@ <> <++><Esc>2F<a
inoremap `img ![](<++>)<Esc>F[a
inoremap `ll ----------------<CR>
inoremap `1 # 
inoremap `2 ## 
inoremap `3 ### 
inoremap `4 #### 
" end   文本控制

inoremap `C ```<Esc>o<++><CR>```<Esc>2kA

