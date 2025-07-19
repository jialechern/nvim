-- elegant-note.lua
-- 这是一个用于存放 elegant-note 快捷键的文件

-- 导入自定义工具函数
local map = require('utils.map').map

map('i', '<LEADER>def', function () return
'\\begin{definition}[]'                                     .. '<CR>' ..
        _G.Next                                             .. '<CR>' ..
'\\end{definition}'                                         .. '<Esc>2k$i'
end, { expr = true, desc = "定义环境" })

map('i', '<LEADER>theorem', function () return
'\\begin{theorem}[]'                                        .. '<CR>' ..
        _G.Next                                             .. '<CR>' ..
'\\end{theorem}'                                            .. '<Esc>2k$i'
end, { expr = true, desc = "定理环境" })

map('i', '<LEADER>proof', function () return
'\\begin{proof}'                                            .. '<CR>' ..
'\\end{proof}'                                              .. '<Esc>O'
end, { expr = true, desc = "证明环境" })

map('i', '<LEADER>lemma', function () return
'\\begin{lemma}[]'                                          .. '<CR>' ..
        _G.Next                                             .. '<CR>' ..
'\\end{lemma}'                                              .. '<Esc>2k$i'
end, { expr = true, desc = "引理环境" })

map('i', '<LEADER>proposition', function () return
'\\begin{proposition}[]'                                    .. '<CR>' ..
        _G.Next                                             .. '<CR>' ..
'\\end{proposition}'                                        .. '<Esc>2k$i'
end, { expr = true, desc = "命题环境" })

map('i', '<LEADER>corollary', function () return
'\\begin{corollary}[]'                                      .. '<CR>' ..
        _G.Next                                             .. '<CR>' ..
'\\end{corollary}'                                          .. '<Esc>2k$i'
end, { expr = true, desc = "推论环境" })

map('i', '<LEADER>conjecture', function () return
'\\begin{conjecture}[]'                                     .. '<CR>' ..
        _G.Next                                             .. '<CR>' ..
'\\end{conjecture}'                                         .. '<Esc>2k$i'
end, { expr = true, desc = "猜想环境" })

map('i', '<LEADER>example', function () return
'\\begin{example}[]'                                        .. '<CR>' ..
        _G.Next                                             .. '<CR>' ..
'\\end{example}'                                            .. '<Esc>2k$i'
end, { expr = true, desc = "示例环境" })

map('i', '<LEADER>note', function () return
'\\begin{note}[]'                                           .. '<CR>' ..
        _G.Next                                             .. '<CR>' ..
'\\end{note}'                                               .. '<Esc>2k$i'
end, { expr = true, desc = "备注环境" })

map('i', '<LEADER>remark', function () return
'\\begin{remark}[]'                                         .. '<CR>' ..
        _G.Next                                             .. '<CR>' ..
'\\end{remark}'                                             .. '<Esc>2k$i'
end, { expr = true, desc = "评论环境" })

map('i', '<LEADER>case', function () return
'\\begin{case}[]'                                           .. '<CR>' ..
        _G.Next                                             .. '<CR>' ..
'\\end{case}'                                               .. '<Esc>2k$i'
end, { expr = true, desc = "案例环境" })

map('i', '<LEADER>img', function () return
'\\begin{figure}[]'                                         .. '<CR>' ..
    '\\centering'                                           .. '<CR>' ..
    '\\includegraphics[width=\\textwidth]{' .. _G.Next .. '}'   .. '<CR>' ..
    '\\caption{' .. _G.Next .. '}'                          .. '<CR>' ..
    '\\lable{fig: ' .. _G.Next .. '}'                       .. '<CR>' ..
'\\end{figure}'                                             .. '<Esc>5k$i'
end, { expr = true, desc = "图片环境" })

