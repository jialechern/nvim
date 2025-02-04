-- - keymaps-math.lua

-- 左右符号匹配
vim.api.nvim_set_keymap('i', '<LEADER>left', '\\left\\right' .. _G.Next .. '<Esc>F\\i', { noremap = true, silent = true})
-- 下标
vim.api.nvim_set_keymap('i', '<LEADER>D', '_{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
-- 上标
vim.api.nvim_set_keymap('i', '<LEADER>U', '^{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
-- 行内公式块
-- vim.api.nvim_set_keymap('i', '<LEADER>math', '$$' .. _G.Next .. '<Esc>F$i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>$', '$$' .. _G.Next .. '<Esc>F$i', { noremap = true, silent = true})

-- begin 行间公式块
vim.api.nvim_set_keymap('i', '<LEADER>M', 
    '$$'                                                        .. '<CR>' ..
    '$$'                                                        .. '<Esc>O'
, { noremap = true, silent = true})
-- end 行间公式块

-- begin 常见的 \left \right 包裹的符号
-- 尖括号
vim.api.nvim_set_keymap('i', '<LEADER>inner', '\\left\\langle\\right\\rangle' .. _G.Next .. '<Esc>2F\\i', { noremap = true, silent = true})
-- 小括号
vim.api.nvim_set_keymap('i', '<LEADER>tuple', '\\left(\\right)' .. _G.Next .. '<Esc>F\\i', { noremap = true, silent = true})
-- 中括号
vim.api.nvim_set_keymap('i', '<LEADER>list', '\\left[\\right]' .. _G.Next .. '<Esc>F\\i', { noremap = true, silent = true})
-- 大括号
vim.api.nvim_set_keymap('i', '<LEADER>set', '\\left\\{\\right\\}' .. _G.Next .. '<Esc>2F\\i', { noremap = true, silent = true})
-- end 常见的 \left \right 包裹的符号

-- begin 一些双线体大写字母
vim.api.nvim_set_keymap('i', '<LEADER>bb', '\\mathbb{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>N', '\\mathbb{N}', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>Q', '\\mathbb{Q}', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>R', '\\mathbb{R}', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>C', '\\mathbb{C}', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>E', '\\mathbb{E}', { noremap = true, silent = true})
-- end 一些双线体大写字母

-- begin 一些大写花体字母
vim.api.nvim_set_keymap('i', '<LEADER>cal', '\\mathcal{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>T', '\\mathcal{T}', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>L', '\\mathcal{L}', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>P', '\\mathcal{P}', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>A', '\\mathcal{A}', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>B', '\\mathcal{B}', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>H', '\\mathcal{H}', { noremap = true, silent = true})
-- end 一些大写花体字母

-- begin 一些数学专用符号
-- 罗马正体
vim.api.nvim_set_keymap('i', '<LEADER>rm', '\\mathrm{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
-- 正体 d 
vim.api.nvim_set_keymap('i', '<LEADER>d', '\\mathrm{d}', { noremap = true, silent = true})
-- partial (德文 d )
vim.api.nvim_set_keymap('i', '<LEADER>p', '\\partial', { noremap = true, silent = true})
-- 核
vim.api.nvim_set_keymap('i', '<LEADER>ker', '\\mathrm{ker}', { noremap = true, silent = true})
-- 像
vim.api.nvim_set_keymap('i', '<LEADER>im', '\\mathrm{im}', { noremap = true, silent = true})
-- 恒等映射
vim.api.nvim_set_keymap('i', '<LEADER>id', '\\mathrm{id}', { noremap = true, silent = true})
-- 同态
vim.api.nvim_set_keymap('i', '<LEADER>hom', '\\mathrm{hom}', { noremap = true, silent = true})
-- 维数
vim.api.nvim_set_keymap('i', '<LEADER>dim', '\\mathrm{dim}', { noremap = true, silent = true})
-- 分式
vim.api.nvim_set_keymap('i', '<LEADER>frac', '\\frac{}{' .. _G.Next .. '}' .. _G.Next .. '<Esc>2F}i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>dfrac', '\\dfrac{}{' .. _G.Next .. '}' .. _G.Next .. '<Esc>2F}i', { noremap = true, silent = true})
-- 求和
vim.api.nvim_set_keymap('i', '<LEADER>sum', '\\sum_{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
-- 极限
vim.api.nvim_set_keymap('i', '<LEADER>lim', '\\lim_{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
-- 必要条件
vim.api.nvim_set_keymap('i', '<LEADER>lra', '\\longrightarrow', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>Lra', '\\Longrightarrow', { noremap = true, silent = true})
-- 充分条件
vim.api.nvim_set_keymap('i', '<LEADER>lla', '\\longleftarrow', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>Lla', '\\Longleftarrow', { noremap = true, silent = true})
-- 充要条件
vim.api.nvim_set_keymap('i', '<LEADER>iff', '\\longleftrightarrow', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>Iff', '\\Longleftrightarrow', { noremap = true, silent = true})
-- 上下箭头
vim.api.nvim_set_keymap('i', '<LEADER>ora', '\\overrightarrow{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ura', '\\underrightarrow{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ola', '\\overleftarrow{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ula', '\\underleftarrow{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>olra', '\\overleftrightarrow{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ulra', '\\underleftrightarrow{}' .. _G.Next .. '<Esc>F}i', { noremap = true, silent = true})
-- 平行
vim.api.nvim_set_keymap('i', '<LEADER>pl', '\\parallel', { noremap = true, silent = true})
-- end 一些数学专用符号

-- begin 希腊字母
vim.api.nvim_set_keymap('i', '<LEADER>a', '\\alpha', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>b', '\\beta', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>g', '\\gamma', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>G', '\\Gamma', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>vphi', '\\varphi', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>ve', '\\varepsilon', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>e', '\\epsilon', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>del', '\\delta', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>lam', '\\lamdba', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<LEADER>Lam', '\\Lamdba', { noremap = true, silent = true})
-- end 希腊字母

-- begin 线性方程组
vim.api.nvim_set_keymap('i', '<LEADER>lineq', 
    '\\left\\{'                                                  .. 
        '\\begin{array}{c}'                                     .. '<CR>' ..
        '\\end{array}'                                          ..
    '\\right.'                                                  .. '<CR>' ..
    _G.Next                                                     .. '<Esc>kO'
, { noremap = true, silent = true})
-- end 线性方程组

-- begin 向量
vim.api.nvim_set_keymap('i', '<LEADER>vector', 
    '\\left('                                                   .. 
        '\\begin{array}{c}'                                     .. 
        '\\end{array}'                                          .. 
    '\\right)' .. _G.Next                                       .. '<Esc>2F\\i'
, { noremap = true, silent = true})
-- end 向量

-- begin 矩阵
vim.api.nvim_set_keymap('i', '<LEADER>matrix', 
    '\\left('                                                   .. 
        '\\begin{array}{}'                                      .. '<CR>' ..
            _G.Next                                             .. '<CR>' ..
        '\\end{array}'                                          .. 
    '\\right)'                                                  .. '<Esc>2k$i'
, { noremap = true, silent = true})
-- end 矩阵

-- begin 等式排版
vim.api.nvim_set_keymap('i', '<LEADER>aligned', 
    '\\begin{aligned}'                                          .. '<CR>' ..
    '\\end{aligned}'                                            .. '<Esc>O'
, { noremap = true, silent = true})
-- end 等式排版



