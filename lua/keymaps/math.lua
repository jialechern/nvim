-- math.lua

-- 引入自定义工具函数
local map = require('utils.map').map

--------------------------------- 基本映射 ---------------------------------

map('i', '<LEADER>left', function () return
'\\left' .. _G.CoLeader .. '\\right' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "左右符号匹配" })

map('i', '<LEADER>D', function () return
'_{' .. _G.CoLeader .. '}' .. _G.Next           .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "下标" })

map('i', '<LEADER>U', function () return
'^{' .. _G.CoLeader .. '}' .. _G.Next           .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "上标" })

map('i', '<LEADER>$', function () return
'$' .. _G.CoLeader .. '$' .. _G.Next            .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "行内公式块" })

map('i', '<LEADER>M', function () return
'$$'                                                        .. '<CR>' ..
'$$'                                                        .. '<Esc>O'
end, { expr = true, desc = "行间公式块" })

------------------------------ 常见的符号配对 -----------------------------

map('i', '<LEADER>inner', function () return
'\\left\\langle' .. _G.CoLeader .. '\\right\\rangle' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "尖括号" })

map('i', '<LEADER>tuple', function () return
'\\left(' .. _G.CoLeader .. '\\right)' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "小括号" })

map('i', '<LEADER>list', function () return
'\\left[' .. _G.CoLeader .. '\\right]' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "中括号" })

map('i', '<LEADER>set', function () return
'\\left\\{' .. _G.CoLeader .. '\\right\\}' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "大括号" })

map('i', '<LEADER>abs', function () return
'\\left|' .. _G.CoLeader .. '\\right|' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "绝对值" })

-------------------------------- 常见符号 --------------------------------

-- 双线体大写字母
map('i', '<LEADER>bb', function () return
'\\mathbb{' .. _G.CoLeader .. '}' .. _G.Next    .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "双线体大写字母" })

map('i', '<LEADER>N', function () return
'\\mathbb{N}'
end, { expr = true, desc = "双线体 N" })

map('i', '<LEADER>Q', function () return
'\\mathbb{Q}'
end, { expr = true, desc = "双线体 Q" })

map('i', '<LEADER>R', function () return
'\\mathbb{R}'
end, { expr = true, desc = "双线体 R" })

map('i', '<LEADER>C', function () return
'\\mathbb{C}'
end, { expr = true, desc = "双线体 C" })

map('i', '<LEADER>E', function () return
'\\mathbb{E}'
end, { expr = true, desc = "双线体 E" })


-- 大写花体字母
map('i', '<LEADER>cal', function () return
'\\mathcal{' .. _G.CoLeader .. '}' .. _G.Next   .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "大写花体字母" })

map('i', '<LEADER>T', function () return
'\\mathcal{T}'
end, { expr = true, desc = "花体字母 T" })

map('i', '<LEADER>L' .. _G.End, function () return
'\\mathcal{L}'
end, { expr = true, desc = "花体字母 L" })

map('i', '<LEADER>P', function () return
'\\mathcal{P}'
end, { expr = true, desc = "花体字母 P" })

map('i', '<LEADER>A', function () return
'\\mathcal{A}'
end, { expr = true, desc = "花体字母 A" })

map('i', '<LEADER>B', function () return
'\\mathcal{B}'
end, { expr = true, desc = "花体字母 B" })

map('i', '<LEADER>H', function () return
'\\mathcal{H}'
end, { expr = true, desc = "花体字母 H" })

-- 一些数学专用符号
map('i', '<LEADER>rm', function () return
'\\mathrm{' .. _G.CoLeader .. '}' .. _G.Next    .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "罗马正体" })

map('i', '<LEADER>d' .. _G.End, function () return
'\\mathrm{d}'
end, { expr = true, desc = "正体 d" })

map('i', '<LEADER>p' .. _G.End, function () return
'\\partial'
end, { expr = true, desc = "德文 d" })

map('i', '<LEADER>ker', function () return
'\\mathrm{ker}'
end, { expr = true, desc = "核" })

map('i', '<LEADER>im' .. _G.End, function () return
'\\mathrm{im}'
end, { expr = true, desc = "像" })

map('i', '<LEADER>id', function () return
'\\mathrm{id}'
end, { expr = true, desc = "恒等映射" })

map('i', '<LEADER>hom', function () return
'\\mathrm{hom}'
end, { expr = true, desc = "同态" })

map('i', '<LEADER>dim', function () return
'\\mathrm{dim}'
end, { expr = true, desc = "维数" })

map('i', '<LEADER>frac', function () return
'\\frac{' .. _G.CoLeader .. '}{' .. _G.Next .. '}' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "相对尺寸分式" })

map('i', '<LEADER>dfrac', function () return
'\\dfrac{' .. _G.CoLeader .. '}{' .. _G.Next .. '}' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "绝对尺寸分式" })

map('i', '<LEADER>sum', function () return
'\\sum_{' .. _G.CoLeader .. '}' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "求和" })

map('i', '<LEADER>lim', function () return
'\\lim_{' .. _G.CoLeader .. '}' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "极限" })

map('i', '<LEADER>lra', function () return
'\\longrightarrow'
end, { expr = true, desc = "必要条件" })

map('i', '<LEADER>Lra', function () return
'\\Longrightarrow'
end, { expr = true, desc = "必要条件" })

map('i', '<LEADER>lla', function () return
'\\longleftarrow'
end, { expr = true, desc = "充分条件" })

map('i', '<LEADER>Lla', function () return
'\\Longleftarrow'
end, { expr = true, desc = "充分条件" })

map('i', '<LEADER>iff', function () return
'\\longleftrightarrow'
end, { expr = true, desc = "充要条件" })

map('i', '<LEADER>Iff', function () return
'\\Longleftrightarrow'
end, { expr = true, desc = "充要条件" })

map('i', '<LEADER>ora', function () return
'\\overrightarrow{' .. _G.CoLeader .. '}' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "上方向右箭头" })

map('i', '<LEADER>ura', function () return
'\\underrightarrow{' .. _G.CoLeader .. '}' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "下方向右箭头" })

map('i', '<LEADER>ola', function () return
'\\overleftarrow{' .. _G.CoLeader .. '}' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "上方向左箭头" })

map('i', '<LEADER>ula', function () return
'\\underleftarrow{' .. _G.CoLeader .. '}' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "下方向左箭头" })

map('i', '<LEADER>oia', function () return
'\\overleftrightarrow{' .. _G.CoLeader .. '}' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "上方双边箭头" })

map('i', '<LEADER>uia', function () return
'\\underleftrightarrow{' .. _G.CoLeader .. '}' .. _G.Next
                                                .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "下方双边箭头" })

map('i', '<LEADER>pl', function () return
'\\parallel'
end, { expr = true, desc = "平行" })

-------------------------------------- 希腊字母 -------------------------------

map('i', '<LEADER>a' .. _G.End, function () return
'\\alpha'
end, { expr = true })

map('i', '<LEADER>b' .. _G.End, function () return
'\\beta'
end, { expr = true })

map('i', '<LEADER>g', function () return
'\\gamma'
end, { expr = true })

map('i', '<LEADER>G', function () return
'\\Gamma'
end, { expr = true })

map('i', '<LEADER>vphi', function () return
'\\varphi'
end, { expr = true })

map('i', '<LEADER>phi', function () return
'\\phi'
end, { expr = true })

map('i', '<LEADER>ve' .. _G.End, function () return
'\\varepsilon'
end, { expr = true })

map('i', '<LEADER>e' .. _G.End, function () return
'\\epsilon'
end, { expr = true })

map('i', '<LEADER>del', function () return
'\\delta'
end, { expr = true })

map('i', '<LEADER>lam', function () return
'\\lambda'
end, { expr = true })

map('i', '<LEADER>Lam', function () return
'\\Lambda'
end, { expr = true })

----------------------------------- 标准环境 ---------------------------------

map('i', '<LEADER>lineq', function () return
'\\left\\{'                                                 ..
    '\\begin{array}{c}'                                     .. '<CR>' ..
    '\\end{array}'                                          ..
'\\right.'                                                  .. '<CR>' ..
_G.Next                                                     .. '<Esc>kO'
end, { expr = true, desc = "线性方程组" })

map('i', '<LEADER>vector', function () return
'\\left('                                       ..
    '\\begin{array}{c}'                         ..
        _G.CoLeader                             ..
    '\\end{array}'                              ..
'\\right)' .. _G.Next                           .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "向量" })

map('i', '<LEADER>matrix', function () return
'\\left('                                       ..
    '\\begin{array}{' .. _G.CoLeader .. '}'     .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
    '\\end{array}'                              ..
'\\right)'                                      .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end, { expr = true, desc = "矩阵" })

map('i', '<LEADER>aligned', function () return
'\\begin{aligned}'                                          .. '<CR>' ..
'\\end{aligned}'                                            .. '<Esc>O'
end, { expr = true, desc = "等式排版" })

