-- - keymaps-elegant_note.lua

-- begin 定义环境
vim.api.nvim_set_keymap('i', '<LEADER>def', 
    '\\begin{definition}[]'                                     .. '<CR>' ..
            _G.Next                                             .. '<CR>' ..
    '\\end{definition}'                                         .. '<Esc>2k$i'
, { noremap = true, silent = true})
-- end 定义环境

-- begin 定理环境
vim.api.nvim_set_keymap('i', '<LEADER>theorem', 
    '\\begin{theorem}[]'                                        .. '<CR>' ..
            _G.Next                                             .. '<CR>' ..
    '\\end{theorem}'                                            .. '<Esc>2k$i'
, { noremap = true, silent = true})
-- end 定理环境

-- begin 证明环境
vim.api.nvim_set_keymap('i', '<LEADER>proof', 
    '\\begin{proof}'                                            .. '<CR>' ..
    '\\end{proof}'                                              .. '<Esc>O'
, { noremap = true, silent = true})
-- end 证明环境

-- begin 引理环境
vim.api.nvim_set_keymap('i', '<LEADER>lemma', 
    '\\begin{lemma}[]'                                          .. '<CR>' ..
            _G.Next                                             .. '<CR>' ..
    '\\end{lemma}'                                              .. '<Esc>2k$i'
, { noremap = true, silent = true})
-- end 引理环境

-- begin 命题环境
vim.api.nvim_set_keymap('i', '<LEADER>proposition', 
    '\\begin{proposition}[]'                                    .. '<CR>' ..
            _G.Next                                             .. '<CR>' ..
    '\\end{proposition}'                                        .. '<Esc>2k$i'
, { noremap = true, silent = true})
-- end 命题环境

-- begin 推论环境
vim.api.nvim_set_keymap('i', '<LEADER>corollary', 
    '\\begin{corollary}[]'                                      .. '<CR>' ..
            _G.Next                                             .. '<CR>' ..
    '\\end{corollary}'                                          .. '<Esc>2k$i'
, { noremap = true, silent = true})
-- end 推论环境

-- begin 猜想环境
vim.api.nvim_set_keymap('i', '<LEADER>conjecture', 
    '\\begin{conjecture}[]'                                     .. '<CR>' ..
            _G.Next                                             .. '<CR>' ..
    '\\end{conjecture}'                                         .. '<Esc>2k$i'
, { noremap = true, silent = true})
-- end 猜想环境

-- begin 示例环境
vim.api.nvim_set_keymap('i', '<LEADER>example', 
    '\\begin{example}[]'                                        .. '<CR>' ..
            _G.Next                                             .. '<CR>' ..
    '\\end{example}'                                            .. '<Esc>2k$i'
, { noremap = true, silent = true})
-- end 示例环境

-- begin 备注环境
vim.api.nvim_set_keymap('i', '<LEADER>note', 
    '\\begin{note}[]'                                           .. '<CR>' ..
            _G.Next                                             .. '<CR>' ..
    '\\end{note}'                                               .. '<Esc>2k$i'
, { noremap = true, silent = true})
-- end 备注环境

-- begin 评论环境
vim.api.nvim_set_keymap('i', '<LEADER>remark', 
    '\\begin{remark}[]'                                         .. '<CR>' ..
            _G.Next                                             .. '<CR>' ..
    '\\end{remark}'                                             .. '<Esc>2k$i'
, { noremap = true, silent = true})
-- end 评论环境

-- begin 案例环境
vim.api.nvim_set_keymap('i', '<LEADER>case', 
    '\\begin{case}[]'                                           .. '<CR>' ..
            _G.Next                                             .. '<CR>' ..
    '\\end{case}'                                               .. '<Esc>2k$i'
, { noremap = true, silent = true})
-- end 案例环境

-- begin 图片环境
vim.api.nvim_set_keymap('i', '<LEADER>img', 
    '\\begin{figure}[]'                                         .. '<CR>' ..
        '\\centering'                                           .. '<CR>' ..
        '\\includegraphics[width=\\textwidth]{' .. _G.Next .. '}'   .. '<CR>' ..
        '\\caption{' .. _G.Next .. '}'                          .. '<CR>' ..
        '\\lable{fig: ' .. _G.Next .. '}'                       .. '<CR>' ..
    '\\end{figure}'                                             .. '<Esc>5k$i'
, { noremap = true, silent = true})
-- end 图片环境

