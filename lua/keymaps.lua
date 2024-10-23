-- vim.g.mapleader = " "                                   -- 设置空格键为 LEADER 键
vim.cmd('source ~/.config/nvim/lua/keymaps.vim')        -- 复用旧的分屏设置
vim.api.nvim_set_keymap('n', '<leader>sc', ':set spell!<CR>', { noremap = true, silent = true})
                                                        -- 设置拼写检查
vim.api.nvim_set_keymap('n', 'H', '^', {noremap = true, silent = true})                                                                  -- 设置跳转到行首键
vim.api.nvim_set_keymap('n', 'L', '$', {noremap = true, silent = true})
                                                        -- 设置跳转到行尾键
vim.api.nvim_set_keymap('n', '^', 'H', {noremap = true, silent = true})
                                                        -- 设置跳转到首行键
vim.api.nvim_set_keymap('n', '$', 'L', {noremap = true, silent = true})
                                                        -- 设置跳转到末行键
-- vim.cmd('source $NVIMCONFIGP/lua/mathkeymaps.vim')
                                                        -- 引入数学公式的快捷键

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/mathkeymaps.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/mathkeymaps.vim')
    end,
})
