-- - keymaps-auto-load-by-filetype.lua
-- 该文件用于根据文件类型自动加载相应的键位映射配置

-- 引入自定义的函数来加载配置文件
local loadcfg = require('utils.loadcfg').loadcfg

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        loadcfg("/lua/keymaps/keymaps-math.lua")
        loadcfg("/lua/keymaps/keymaps-markdown.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        loadcfg("/lua/keymaps/keymaps-math.lua")
        loadcfg("/lua/keymaps/keymaps-elegant_note.lua")
        loadcfg("/lua/keymaps/keymaps-latex.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        loadcfg("/lua/keymaps/keymaps-rust.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        loadcfg("/lua/keymaps/keymaps-python.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        loadcfg("/lua/keymaps/keymaps-c.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 
        "bash",
        "zsh",
    },
    callback = function()
        loadcfg("/lua/keymaps/keymaps-shell_base.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        loadcfg("/lua/keymaps/keymaps-shell_base.lua")
        loadcfg("/lua/keymaps/keymaps-makefile.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    callback = function()
        loadcfg("/lua/keymaps/keymaps-javascript.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sshconfig",
    callback = function()
        loadcfg("/lua/keymaps/keymaps-sshconfig.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "fish",
    callback = function()
        loadcfg("/lua/keymaps/keymaps-fish.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
        loadcfg("/lua/keymaps/keymaps-typst.lua")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "toml",
    callback = function()
        loadcfg("/lua/keymaps/keymaps-toml.lua")
    end,
})

