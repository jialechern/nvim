-- latex.lua

-- 引入自定义工具函数
local map = require('utils.map').map

-------------------------------- 基本设置 --------------------------------

-- 入口函数
require('settings.entry-points').entry_points['tex'] = function () return
'\\documentclass{' .. _G.CoLeader .. '} % article / book / report'                       .. '<CR><CR>' ..

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
'\\end{document}'                                                   .. '<Esc>17k0f' .. _G.CoLeader .. 's'
end

-- 标准排版
map('i', '<LEADER>chapter', function () return
'\\chapter {' .. _G.CoLeader .. '}' .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "章节" })

map('i', '<LEADER>section', function () return
'\\section {' .. _G.CoLeader .. '}' .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "节" })

map('i', '<LEADER>ssection', function () return
'\\subsection {' .. _G.CoLeader .. '}' .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "小节" })

map('i', '<LEADER>sssection', function () return
'\\subsubsection {' .. _G.CoLeader .. '}' .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "小小节" })

map('i', '<LEADER>ssssection', function () return
'\\subsubsubsection {' .. _G.CoLeader .. '}' .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "小小小节" })

---------------------------------- 常见环境 ----------------------------------

-- 居中环境
map('i', '<LEADER>center', function () return
'\\begin{center}'                                         .. '<CR>' ..
'\\end{center}'                                           .. '<Esc>O'
end, { expr = true, desc = "center 环境" })

-- 等式环境
map('i', '<LEADER>eq', function () return
'\\begin{equation}'                                         .. '<CR>' ..
'\\end{equation}'                                           .. '<Esc>O'
end, { expr = true, desc = "带标号的等式环境" })

map('i', '<LEADER>neq', function () return
'\\begin{equation*}'                                         .. '<CR>' ..
'\\end{equation*}'                                           .. '<Esc>O'
end, { expr = true, desc = "不带标号的等式环境" })

-- 枚举环境
map('i', '<LEADER>enum', function () return
'\\begin{enumerate}'                                        .. '<CR>' ..
        '\\item '                                           .. '<CR>' ..
'\\end{enumerate}'                                          .. '<Esc>kA'
end, { expr = true, desc = "enumerate 环境" })

map('i', '<LEADER>itemize', function () return
    '\\begin{itemize}'                                          .. '<CR>' ..
            '\\item '                                           .. '<CR>' ..
    '\\end{itemize}'                                            .. '<Esc>kA'
end, { expr = true, desc = "itemize 环境" })

