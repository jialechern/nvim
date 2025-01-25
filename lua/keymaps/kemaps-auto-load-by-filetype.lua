-- keymaps-auto-load-by-filetype.lua

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-math.lua')
--         vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-math.vim')
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-markdown.lua')
--         vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-markdown.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-math.lua')
--         vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-math.vim')
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-elegant_note.lua')
--         vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-elegant_note.vim')
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-latex.lua')
--         vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-latex.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-rust.lua')
--         vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-rust.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-python.lua')
--         vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-python.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-c.lua')
--         vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-c.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 
        "bash",
        "zsh",
    }, 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-shell_base.lua')
--         vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-shell_base.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "make", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-shell_base.lua')
--         vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-shell_base.vim')
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-makefile.lua')
--         vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-makefile.vim')
    end,
})

