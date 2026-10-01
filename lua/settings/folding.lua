--- folding.lua
--- foldexpr 的唯一裁决点: 谁给这个 buffer 提供折叠(支持 foldingRange 的 LSP > treesitter)。
--- 之所以独立成模块: 原本三处各写一份 —— treesitter.lua 的 FileType、lsp.lua 的 LspAttach、
--- base.lua 的 loadview; 而 loadview 最后执行, 还会把 view 里陈旧的 foldexpr 一起恢复,
--- 于是"没有任何客户端"的 buffer 也可能指向 v:lua.vim.lsp.foldexpr()(该表达式此时返回 0 = 无折叠),
--- 折叠静默失效(见 docs/code-review-2026-10-01.md 的 BUG-02)。
--- 本模块只写 foldmethod/foldexpr, 不碰 foldenable/foldlevel —— 折叠开关与折叠层级仍由
--- viewoptions='folds' 的 view 恢复, 从而保住"记住折叠"这个功能本身。

local M = {}

--- 该 buffer 是否已有支持 foldingRange 的客户端
---@param bufnr integer
---@return boolean
local function lsp_can_fold(bufnr)
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
        if client:supports_method('textDocument/foldingRange') then
            return true
        end
    end
    return false
end

--- 重新裁决本 buffer 的 foldexpr 归属; 两者都不用时保持不动(留给 view 或用户自己的设置)
---@param bufnr integer
function M.refresh(bufnr)
    ---@type integer
    local win = vim.fn.bufwinid(bufnr)
    if win == -1 then
        -- FileType 阶段 buffer 可能还没进窗口, 当前 buffer 就先用当前窗口
        if bufnr ~= vim.api.nvim_get_current_buf() then
            return
        end
        win = 0
    end

    ---@type string?
    local owner
    if lsp_can_fold(bufnr) then
        owner = 'v:lua.vim.lsp.foldexpr()'
    elseif vim.b[bufnr].treesitter_fold then
        owner = 'v:lua.vim.treesitter.foldexpr()'
    else
        return
    end

    vim.api.nvim_set_option_value('foldmethod', 'expr', { win = win, scope = 'local' })
    vim.api.nvim_set_option_value('foldexpr', owner, { win = win, scope = 'local' })
end

return M
