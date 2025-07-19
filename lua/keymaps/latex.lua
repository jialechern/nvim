-- latex.lua

-- begin 一些标准的排版方式
-- 章节
vim.api.nvim_set_keymap('i', '<LEADER>chapter', '\\chapter {}' .. '<Esc>F{a', { noremap = true, silent = true})
-- 节
vim.api.nvim_set_keymap('i', '<LEADER>section', '\\section {}' .. '<Esc>F{a', { noremap = true, silent = true})
-- 小节
vim.api.nvim_set_keymap('i', '<LEADER>ssection', '\\subsection {}' .. '<Esc>F{a', { noremap = true, silent = true})
-- 小小节
vim.api.nvim_set_keymap('i', '<LEADER>sssection', '\\subsubsection {}' .. '<Esc>F{a', { noremap = true, silent = true})
-- 小小小节
vim.api.nvim_set_keymap('i', '<LEADER>ssssection', '\\subsubsubsection {}' .. '<Esc>F{a', { noremap = true, silent = true})
-- end 一些标准的排版方式

-- begin 等式环境
-- 带标号
vim.api.nvim_set_keymap('i', '<LEADER>eq', 
    '\\begin{equation}'                                         .. '<CR>' ..
    '\\end{equation}'                                           .. '<Esc>O'
, { noremap = true, silent = true})
-- 不带标号
vim.api.nvim_set_keymap('i', '<LEADER>neq', 
    '\\begin{equation*}'                                        .. '<CR>' ..
    '\\end{equation*}'                                          .. '<Esc>O'
, { noremap = true, silent = true})
-- end 等式环境

-- begin 枚举环境
-- enumerate 环境
vim.api.nvim_set_keymap('i', '<LEADER>enum', 
    '\\begin{enumerate}'                                        .. '<CR>' ..
            '\\item '                                           .. '<CR>' ..
    '\\end{enumerate}'                                          .. '<Esc>kA'
, { noremap = true, silent = true})
-- itemize 环境
vim.api.nvim_set_keymap('i', '<LEADER>itemize', 
    '\\begin{itemize}'                                          .. '<CR>' ..
            '\\item '                                           .. '<CR>' ..
    '\\end{itemize}'                                            .. '<Esc>kA'
, { noremap = true, silent = true})
-- end 枚举环境

-- begin latex 初始化
vim.api.nvim_set_keymap('i', '<LEADER>init', 
    '\\documentclass{} % article / book / report'                       .. '<CR><CR>' ..

    '\\title{' .. _G.Next .. '}'                                        .. '<CR>' ..
    '\\author{' .. _G.Next .. '}'                                       .. '<CR>' ..
    '\\institute{' .. _G.Next .. '}'                                    .. '<CR>' ..
    '\\version{' .. _G.Next .. '}'                                      .. '<CR><CR>' ..

    '\\date{\\zhtoday}'                                                 .. '<CR><CR>' ..

    '\\usepackage{array}'                                               .. '<CR>' ..
    '\\usepackage{amssymb}'                                             .. '<CR>' ..
    '\\usepackage{float}'                                               .. '<CR>' ..
    '\\usepackage{mathrsfs}'                                            .. '<CR>' ..
    '\\usepackage{' .. _G.Next .. '}'                                   .. '<CR><CR>' ..

    '\\begin{document}'                                                 .. '<CR>' ..
    '\\maketitle'                                                       .. '<CR>' ..
    '\\end{document}'                                                   .. '<Esc>17k$F}i'
, { noremap = true, silent = true})
-- end latex 初始化

-- begin 居中环境
vim.api.nvim_set_keymap('i', '<LEADER>center', 
    '\\begin{center}'                                         .. '<CR>' ..
    '\\end{center}'                                           .. '<Esc>O'
, { noremap = true, silent = true})
-- end 居中环境

