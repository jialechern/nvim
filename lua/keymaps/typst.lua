-- typst.lua

-- 导入自定义工具函数
local map = require('utils.map').map

---------------------------------- 常用符号 ---------------------------------
-- 希腊字母
map('i', '<LEADER>a' .. _G.End, function () return
'alpha'
end, { expr = true })

map('i', '<LEADER>be' .. _G.End, function () return
'beta'
end, { expr = true })

map('i', '<LEADER>g' .. _G.End, function () return
'gamma'
end, { expr = true })

map('i', '<LEADER>G' .. _G.End, function () return
'Gamma'
end, { expr = true })

map('i', '<LEADER>p' .. _G.End, function () return
'phi.alt'
end, { expr = true })

map('i', '<LEADER>vp' .. _G.End, function () return
'phi'
end, { expr = true })

map('i', '<LEADER>P' .. _G.End, function () return
'Phi'
end, { expr = true })

map('i', '<LEADER>del' .. _G.End, function () return
'delta'
end, { expr = true })

map('i', '<LEADER>Del' .. _G.End, function () return
'Delta'
end, { expr = true })

map('i', '<LEADER>ep' .. _G.End, function () return
'epsilon.alt'
end, { expr = true })

map('i', '<LEADER>vep' .. _G.End, function () return
'epsilon'
end, { expr = true })

map('i', '<LEADER>lam' .. _G.End, function () return
'lambda'
end, { expr = true })

map('i', '<LEADER>Lam' .. _G.End, function () return
'Lambda'
end, { expr = true })

map('i', '<LEADER>o' .. _G.End, function () return
'omega'
end, { expr = true })

map('i', '<LEADER>O' .. _G.End, function () return
'Omega'
end, { expr = true })

map('i', '<LEADER>s' .. _G.End, function () return
'sigma'
end, { expr = true })

map('i', '<LEADER>S' .. _G.End, function () return
'Sigma'
end, { expr = true })

map('i', '<LEADER>t' .. _G.End, function () return
'tau'
end, { expr = true })

map('i', '<LEADER>the' .. _G.End, function () return
'theta'
end, { expr = true })

map('i', '<LEADER>The' .. _G.End, function () return
'Theta'
end, { expr = true })

map('i', '<LEADER>vthe' .. _G.End, function () return
'theta.alt'
end, { expr = true })

-- 上/下 标
map('i', '<LEADER>U' .. _G.End, function () return
'^(' .. _G.CoLeader ..')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "上标" })

map('i', '<LEADER>D' .. _G.End, function () return
'_(' .. _G.CoLeader ..')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "下标" })

map('i', '<LEADER>ol' .. _G.End, function () return
'overline(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "上横线" })

map('i', '<LEADER>ob' .. _G.End, function () return
'overbrace(' .. _G.CoLeader .. ',' .. _G.Next .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "上括号" })

map('i', '<LEADER>ul' .. _G.End, function () return
'underline(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "下横线" })

map('i', '<LEADER>ub' .. _G.End, function () return
'underbrace(' .. _G.CoLeader .. ',' .. _G.Next .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "下括号" })

map('i', '<LEADER>hat' .. _G.End, function () return
'hat(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "上尖括号" })

map('i', '<LEADER>caron', function () return
'caron(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "上倒尖括号" })

map('i', '<LEADER>tilde', function () return
'tilde(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "上波浪号" })

map('i', '<LEADER>arrow', function () return
'arrow(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "上标向右箭头" })

-- 二元关系
map('i', '<LEADER>ge' .. _G.End, function () return
'gt.eq'
end, { expr = true, desc = "大于等于" })

map('i', '<LEADER>le' .. _G.End, function () return
'lt.eq'
end, { expr = true, desc = "小于等于" })

map('i', '<LEADER>ne' .. _G.End, function () return
'eq.not'
end, { expr = true, desc = "不等于" })

map('i', '<LEADER>sim' .. _G.End, function () return
'tilde'
end, { expr = true, desc = "等价" })

map('i', '<LEADER>cong' .. _G.End, function () return
'tilde.eq'
end, { expr = true, desc = "全等于1" })

map('i', '<LEADER>==' .. _G.End, function () return
'equiv'
end, { expr = true, desc = "全等于2" })

map('i', '<LEADER>ni' .. _G.End, function () return
'in.rev'
end, { expr = true, desc = "属于(反向)" })

map('i', '<LEADER>nin' .. _G.End, function () return
'in.not'
end, { expr = true, desc = "不属于" })

map('i', '<LEADER>pl' .. _G.End, function () return
'parallel'
end, { expr = true, desc = "平行" })

map('i', '<LEADER>|' .. _G.End, function () return
'divides'
end, { expr = true, desc = "整除" })

-- 二元运算
map('i', '<LEADER>pm' .. _G.End, function () return
'plus.minus'
end, { expr = true, desc = "正负" })

map('i', '<LEADER>mp' .. _G.End, function () return
'minus.plus'
end, { expr = true, desc = "负正" })

map('i', '<LEADER>circ' .. _G.End, function () return
'compose'
end, { expr = true, desc = "复合" })

map('i', '<LEADER>op' .. _G.End, function () return
'xor'
end, { expr = true, desc = "异或/直和" })

map('i', '<LEADER>ot' .. _G.End, function () return
'times.circle'
end, { expr = true, desc = "圈乘" })

map('i', '<LEADER>frac' .. _G.End, function () return
'frac(' .. _G.CoLeader .. ', ' .. _G.Next .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "分式" })

map('i', '<LEADER>C' .. _G.End, function () return
'binom(' .. _G.CoLeader .. ', ' .. _G.Next .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "组合数" })

-- 积分
map('i', '<LEADER>i' .. _G.End, function () return
'integral'
end, { expr = true, desc = "积分1" })

map('i', '<LEADER>ii' .. _G.End, function () return
'integral.double'
end, { expr = true, desc = "积分2" })

map('i', '<LEADER>iii' .. _G.End, function () return
'integral.triple'
end, { expr = true, desc = "积分3" })

map('i', '<LEADER>oi' .. _G.End, function () return
'integral.cont'
end, { expr = true, desc = "围道积分" })

-- 各种箭头

map('i', '<LEADER>Iff' .. _G.End, function () return
'arrow.l.r.double.long'
end, { expr = true, desc = "充要条件1" })

map('i', '<LEADER>sIff' .. _G.End, function () return
'arrow.l.r.double'
end, { expr = true, desc = "充要条件2" })

map('i', '<LEADER>iff' .. _G.End, function () return
'arrow.l.r.long'
end, { expr = true, desc = "充要条件3" })

map('i', '<LEADER>siff' .. _G.End, function () return
'arrow.l.r'
end, { expr = true, desc = "充要条件4" })

map('i', '<LEADER>mapsto' .. _G.End, function () return
'arrow.r.bar'
end, { expr = true, desc = "元素对应" })

map('i', '<LEADER>lmapsto' .. _G.End, function () return
'arrow.r.long.bar'
end, { expr = true, desc = "元素对应(加长)" })

map('i', '<LEADER>Lla' .. _G.End, function () return
'arrow.l.double.long'
end, { expr = true, desc = "必要条件1" })

map('i', '<LEADER>La' .. _G.End, function () return
'arrow.l.double'
end, { expr = true, desc = "必要条件2" })

map('i', '<LEADER>lla' .. _G.End, function () return
'arrow.l.long'
end, { expr = true, desc = "必要条件3" })

map('i', '<LEADER>la' .. _G.End, function () return
'arrow.l'
end, { expr = true, desc = "必要条件4" })

map('i', '<LEADER>Rra' .. _G.End, function () return
'arrow.r.double.long'
end, { expr = true, desc = "充分条件1" })

map('i', '<LEADER>Ra' .. _G.End, function () return
'arrow.r.double'
end, { expr = true, desc = "充分条件2" })

map('i', '<LEADER>lra' .. _G.End, function () return
'arrow.r.long'
end, { expr = true, desc = "充分条件3" })

map('i', '<LEADER>ra' .. _G.End, function () return
'arrow.r'
end, { expr = true, desc = "充分条件4" })

-- 其他符号
map('i', '<LEADER>f' .. _G.End, function () return
'forall'
end, { expr = true, desc = "全称量词" })

map('i', '<LEADER>e' .. _G.End, function () return
'exists'
end, { expr = true, desc = "存在量词" })

map('i', '<LEADER>infty' .. _G.End, function () return
'infinity'
end, { expr = true, desc = "无穷" })

map('i', '<LEADER>im' .. _G.End, function () return
'im'
end, { expr = true, desc = "像" })

map('i', '<LEADER>ker' .. _G.End, function () return
'ker'
end, { expr = true, desc = "核" })

map('i', '<LEADER>hom' .. _G.End, function () return
'hom'
end, { expr = true, desc = "同态" })

map('i', '<LEADER>cal' .. _G.End, function () return
'cal(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "花体字母" })

map('i', '<LEADER>bb' .. _G.End, function () return
'bb(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "双线体字母" })

map('i', '<LEADER>abs' .. _G.End, function () return
'abs(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "绝对值" })

map('i', '<LEADER>sqrt' .. _G.End, function () return
'sqrt(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "根式" })

map('i', '<LEADER>norm' .. _G.End, function () return
'norm(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "范数" })

map('i', '<LEADER>inner' .. _G.End, function () return
'lr(angle.l ' .. _G.CoLeader .. ' angle.r)' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "内积" })

map('i', '<LEADER>mat' .. _G.End, function () return
'mat(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "矩阵" })

map('i', '<LEADER>cases' .. _G.End, function () return
'cases(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "分段函数/线性方程组" })

------------------------------- 自动预览 --------------------------------

require('settings.autocmd-by-filetype').cmds['typst'] = function ()
    vim.cmd('silent TypstPreview')
end

