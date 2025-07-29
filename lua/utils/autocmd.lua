-- autocmd.lua
-- 给出一个 vim.keymap.set 的一个基本抽象

local module = {}

local function autocmd(event,  opts)
    local options = {
        pattern = { '*' },
        desc = "unknown",
    }

    -- 合并配置
    if opts then
        options = vim.tbl_deep_extend('force', options, opts)
    end

    vim.api.nvim_create_autocmd(event, options)
end

module.autocmd = autocmd


local function autocmd_by_pattern(patterns, callback, opts, event)
    -- 如果没有指定事件，则默认为 'FileType'
    if not event then
        event = 'FileType'
    end

    if not opts then
        opts = {}
    end

    opts.callback = callback
    opts.pattern = patterns

    local options = {
        desc = "unknown",
    }

    -- 合并配置
    if opts then
        options = vim.tbl_deep_extend('force', options, opts)
    end

    vim.api.nvim_create_autocmd(event, options)
end

module.autocmd_by_pattern = autocmd_by_pattern

return module

