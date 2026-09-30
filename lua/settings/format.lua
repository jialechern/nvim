--- format.lua
--- 按文件类型的外部格式化工具(formatprg, gq 调用)。
--- 空串 = 显式不接外部格式化工具(gq 走内置排版); 未列出的文件类型随全局默认(空)。

local lookup = require('utils.ft').lookup

local M = {}

--- 文件类型 -> formatprg
---@type table<string, string>
M.formatters = {
    bash = '', -- 不接外部格式化工具
    sh = '',
    zsh = '',
    c = 'clang-format -style=file',
    cpp = 'clang-format -style=file',
    haskell = 'ormolu --stdin-input-file %',
    javascript = 'prettierd %',
    nix = 'nixfmt -',
    python = 'black -q -',
    rust = 'rustfmt --emit stdout',
    tex = 'latexindent -m',
}

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('ft_format', { clear = true }),
    pattern = '*',
    ---@param event vim.api.keyset.create_autocmd.callback_args
    callback = function(event)
        local formatter = lookup(M.formatters, vim.bo[event.buf].filetype)
        if formatter == nil then
            return
        end
        vim.api.nvim_set_option_value('formatprg', formatter, { buf = event.buf, scope = 'local' })
    end,
})

return M
