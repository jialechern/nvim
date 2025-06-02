-- keymaps-auto-load-by-filetype.lua

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown", 
    callback = function()
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-math.lua")
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-markdown.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex", 
    callback = function()
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-math.lua")
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-elegant_note.lua")
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-latex.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust", 
    callback = function()
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-rust.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python", 
    callback = function()
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-python.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c", 
    callback = function()
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-c.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 
        "bash",
        "zsh",
    }, 
    callback = function()
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-shell_base.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "make", 
    callback = function()
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-shell_base.lua")
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-makefile.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript", 
    callback = function()
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-javascript.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sshconfig", 
    callback = function()
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-sshconfig.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "fish", 
    callback = function()
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-fish.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst", 
    callback = function()
        _G.LoadNvimConfigFile("/lua/keymaps/keymaps-typst.lua")
    end,
})

