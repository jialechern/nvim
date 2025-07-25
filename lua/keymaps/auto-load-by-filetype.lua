-- auto-load-by-filetype.lua
-- 该文件用于根据文件类型自动加载相应的键位映射配置

-- 引入自定义的函数来加载配置文件
local map = require('utils.map').map

-------------------------- 加载不同文件类型的键位映射 --------------------------

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        require('keymaps.math')
        require('keymaps.markdown')
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'tex',
    callback = function()
        require('keymaps.math')
        require('keymaps.latex')
        require('keymaps.elegant-note')
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'rust',
    callback = function()
        require('keymaps.rust')
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    callback = function()
        require('keymaps.python')
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'c',
    callback = function()
        require('keymaps.c')
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'bash',
        'zsh',
    },
    callback = function()
        require('keymaps.shell-base')
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'make',
    callback = function()
        require('keymaps.shell-base')
        require('keymaps.makefile')
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'javascript',
    callback = function()
        require('keymaps.javascript')
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'fish',
    callback = function()
        require('keymaps.fish')
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'typst',
    callback = function()
        require('keymaps.typst')
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'toml',
    callback = function()
        require('keymaps.toml')
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'lua',
    callback = function()
        require('keymaps.lua')
    end,
})

------------------------------- 加载编程语言的通用映射 -------------------------------

-- 根据不同的程序类型加载相应的程序入口点
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*' },
    callback = function()
        local entry_point = require('utils.entry-point').GetEntryPoint()
        local entry_key = require('settings.variables').entry_point
        if entry_point then
            map('i', '<LEADER>' .. entry_key, entry_point, { expr = true, desc = "程序入口点", })
        end
    end,
})

-- 根据不同的程序类型加载相应的程序函数片段
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*' },
    callback = function()
        local func = require('utils.functions').GetFunction()
        local func_key = require('settings.variables').func_key
        if func then
            map('i', '<LEADER>' .. func_key, func, { expr = true, desc = "根据不同的程序类型加载相应的程序函数片段", })
        end
    end,
})

-- 根据不同的程序语言类型加载相应的分支型结构映射
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*' },
    callback = function()
        local branchs = require('settings.variables').branch_keys
        local GetBrach = require('utils.branchs').GetBrach
        for type, key in pairs(branchs) do
            local branch = GetBrach(type)
            if key and branch then
                map('i', '<LEADER>' .. key, branch, { expr = true, desc = "分支结构: " .. type, })
            end
        end
    end,
})


-- 根据不同的程序语言类型加载相应的循环结构映射
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*' },
    callback = function()
        local loops = require('settings.variables').loop_keys
        local GetLoop = require('utils.loops').GetLoop
        for type, key in pairs(loops) do
            local loop = GetLoop(type)
            if key and loop then
                map('i', '<LEADER>' .. key, loop, { expr = true, desc = "分支结构: " .. type, })
            end
        end
    end,
})

