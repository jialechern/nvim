--- indent.lua
--- 按文件类型的缩进: 一张宽度表 + 单个 FileType autocmd。
--- 表里只列与全局默认(base.lua 的 4 空格)不同的项。

local lookup = require('utils.ft').lookup

local M = {}

--- 文件类型 -> 缩进宽度
---@type table<string, integer>
M.widths = {
    haskell = 2, -- haskell 惯例
    nix = 2, -- nixpkgs 惯例
    scheme = 2, -- Scheme/Lisp 惯例
}

--- 缩进机制开关: lisp 让缩进按括号层级工作, 不依赖内容缩进
---@type table<string, table<string, boolean>>
M.flags = {
    scheme = { lisp = true },
}

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('ft_indent', { clear = true }),
    pattern = '*',
    ---@param event vim.api.keyset.create_autocmd.callback_args
    callback = function(event)
        local ft = vim.bo[event.buf].filetype

        local width = lookup(M.widths, ft)
        if width then
            for _, name in ipairs({ 'tabstop', 'shiftwidth', 'softtabstop' }) do
                vim.api.nvim_set_option_value(name, width, { buf = event.buf, scope = 'local' })
            end
            vim.api.nvim_set_option_value('expandtab', true, { buf = event.buf, scope = 'local' })
        end

        local flags = lookup(M.flags, ft)
        if flags then
            for name, value in pairs(flags) do
                vim.api.nvim_set_option_value(name, value, { buf = event.buf, scope = 'local' })
            end
        end
    end,
})

return M
