-- - keymaps-typst.lua

-- begin 字词修饰
-- 加粗字体
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'b', '**' .. _G.Next .. '<Esc>F*i', { noremap = true, silent = true})
-- 强调字体
vim.api.nvim_set_keymap('i', _G.CoLeader .. 's', '__' .. _G.Next .. '<Esc>F_i', { noremap = true, silent = true})
-- 删除内容
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'd', 
'#strike[' .. _G.CoLeader .. ']' .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})
-- end 字词修饰

-- begin 文本控制
-- 一级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '1', '= ', { noremap = true, silent = true})
-- 二级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '2', '== ', { noremap = true, silent = true})
-- 三级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '3', '=== ', { noremap = true, silent = true})
-- 四级标题
vim.api.nvim_set_keymap('i', _G.CoLeader .. '4', '==== ', { noremap = true, silent = true})
-- 表格
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'table', 
'#table(columns: ' .. _G.CoLeader .. ', align: center, ' .. _G.Next .. ')' .. 
                    '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})
-- 设置默认值
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'set', '#set ', { noremap = true, silent = true})
-- end 文本控制

-- begin 代码块
-- 行内代码块
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'c', '``' .. _G.Next .. '<Esc>F`i', { noremap = true, silent = true})
-- 多行代码块
vim.api.nvim_set_keymap('i', _G.CoLeader .. 'C', 
'```'                                       .. '<CR>' .. 
'```'                                       .. '<Esc>kA'
, { noremap = true, silent = true})
-- end 代码块

-- begin 脚本模式
-- 脚本模式
vim.api.nvim_set_keymap('i', '<LEADER>#', '#( ' .. _G.CoLeader .. ' )' .. '<Esc>F' .. _G.CoLeader .. 's', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', _G.CoLeader .. '#', '#[' .. _G.CoLeader .. ']' .. '<Esc>F' .. _G.CoLeader .. 's', { noremap = true, silent = true})
-- end 脚本模式

-- begin 数学模式
-- 行内公式块
vim.api.nvim_set_keymap('i', '<LEADER>$', '$$' .. _G.Next .. '<Esc>F$i', { noremap = true, silent = true})
-- 行间公式块
vim.api.nvim_set_keymap('i', '<LEADER>M', '$ '.. _G.CoLeader ..' $' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's', { noremap = true, silent = true})
-- end 数学模式

-- begin 常用符号
-- 希腊字母
vim.api.nvim_set_keymap('i', '<LEADER>a' .. _G.End, 'alpha', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>be', 'beta', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>g' .. _G.End, 'gamma', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>G' .. _G.End, 'Gamma', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>p' .. _G.End, 'phi.alt', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>vp' .. _G.End, 'phi', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>P' .. _G.End, 'Phi', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>del' .. _G.End, 'delta', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>Del' .. _G.End, 'Delta', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>e' .. _G.End, 'epsilon.alt', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ve' .. _G.End, 'epsilon', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>lam' .. _G.End, 'lambda', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>Lam' .. _G.End, 'Lambda', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>o' .. _G.End, 'omega', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>O' .. _G.End, 'Omega', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>s' .. _G.End, 'sigma', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>S' .. _G.End, 'Sigma', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>t' .. _G.End, 'tau', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>the' .. _G.End, 'theta', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>The' .. _G.End, 'Theta', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>vthe' .. _G.End, 'theta.alt', { noremap = true, silent = true})
-- 上/下 标
vim.api.nvim_set_keymap('i', '<LEADER>D' .. _G.End, 
'_(' .. _G.CoLeader ..')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>U' .. _G.End, 
'^(' .. _G.CoLeader ..')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>overl' .. _G.End, 
'overline(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>underl' .. _G.End, 
'underline(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>underb' .. _G.End, 
'underbrace(' .. _G.CoLeader .. ',' .. _G.Next .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>overb' .. _G.End, 
'overbrace(' .. _G.CoLeader .. ',' .. _G.Next .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', 
'<LEADER>hat', 'hat(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', 
'<LEADER>caron', 'caron(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', 
'<LEADER>tilde', 'tilde(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', 
'<LEADER>arrow', 'arrow(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})
-- 二元关系
vim.api.nvim_set_keymap('i', '<LEADER>ge' .. _G.End, 'gt.eq', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>le' .. _G.End, 'lt.eq', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>==' .. _G.End, 'equiv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ne' .. _G.End, 'eq.not', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>sim' .. _G.End, 'tilde', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>cong' .. _G.End, 'tilde.eq', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ni' .. _G.End, 'in.rev', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>nin' .. _G.End, 'in.not', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>pl' .. _G.End, 'parallel', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>|' .. _G.End, 'divides', { noremap = true, silent = true})
-- 二元运算
vim.api.nvim_set_keymap('i', '<LEADER>pm' .. _G.End, 'plus.minus', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>mp' .. _G.End, 'minus.plus', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>circ' .. _G.End, 'compose', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>op' .. _G.End, 'xor', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ot' .. _G.End, 'times.circle', { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>frac' .. _G.End, 
'frac(' .. _G.CoLeader .. ', ' .. _G.Next .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>C' .. _G.End, 
'binom(' .. _G.CoLeader .. ', ' .. _G.Next .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})
-- 积分
vim.api.nvim_set_keymap('i', '<LEADER>i' .. _G.End, 'integral', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ii' .. _G.End, 'integral.double', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>iii' .. _G.End, 'integral.triple', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>oi' .. _G.End, 'integral.cont', { noremap = true, silent = true})
-- 各种箭头
vim.api.nvim_set_keymap('i', '<LEADER>iff' .. _G.End, 'arrow.l.r.long', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>siff' .. _G.End, 'arrow.l.r', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>Iff' .. _G.End, 'arrow.l.r.double.long', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>sIff' .. _G.End, 'arrow.l.r.double', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>mapsto' .. _G.End, 'arrow.r.bar', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>lmapsto' .. _G.End, 'arrow.r.long.bar', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>Lla' .. _G.End, 'arrow.l.double.long', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>lla' .. _G.End, 'arrow.l.long', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>La' .. _G.End, 'arrow.l.double', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>la' .. _G.End, 'arrow.l', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>Lra' .. _G.End, 'arrow.r.double.long', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>lra' .. _G.End, 'arrow.r.long', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>Ra' .. _G.End, 'arrow.r.double', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ra' .. _G.End, 'arrow.r', { noremap = true, silent = true})
-- 其他符号
vim.api.nvim_set_keymap('i', '<LEADER>f' .. _G.End, 'forall', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>e' .. _G.End, 'exists', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>inf' .. _G.End, 'infinity', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>im' .. _G.End, '"im"', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ker' .. _G.End, '"ker"', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>hom' .. _G.End, '"hom"', { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>cal' .. _G.End, 
'cal(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>bb' .. _G.End, 
'bb(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>abs' .. _G.End, 
'abs(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>sqrt' .. _G.End, 
'sqrt(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>norm' .. _G.End, 
'norm(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>inner' .. _G.End, 
'lr(angle.l ' .. _G.CoLeader .. ' angle.r)' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>mat' .. _G.End, 
'mat(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<LEADER>cases' .. _G.End, 
'cases(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
, { noremap = true, silent = true})
-- end 常用符号

