--- lsp.lua
--- 存放与 LSP 相关的快捷键

local module = {}

local lsp_leader = '<C-l>'
module.lsp_leader = lsp_leader

local function get_key(v)
    if v == 'goto-def' then
        return lsp_leader .. 'gd'
    elseif v == 'goto-dec' then
        return lsp_leader .. 'gD'
    elseif v == 'goto-ref' then
        return lsp_leader .. 'gr'
    elseif v == 'goto-impl' then
        return lsp_leader .. 'gi'
    elseif v == 'show-doc' then
        return lsp_leader .. 'd'
    elseif v == 'rename' then
        return lsp_leader .. 'r'
    elseif v == 'code-action' then
        return lsp_leader .. 'ca'
    elseif v == 'goto-next-diag' then
        return lsp_leader .. 'n'
    elseif v == 'goto-prev-diag' then
        return lsp_leader .. 'p'
    elseif v == 'doc-in-new-window' then
        return lsp_leader .. 'w'
    elseif v == 'setloclist' then
        return lsp_leader .. 'q'
    elseif v == 'type-hint' then
        return lsp_leader .. 't'
    elseif v == 'doc' then
        return lsp_leader .. 'D'
    elseif v == 'open-hint' then
        return lsp_leader .. 'o'
    elseif v == 'close-hint' then
        return lsp_leader .. 'x'
    elseif v == 'help' then
        return lsp_leader .. '?'
    else
        return nil
    end
end

module.get_key = get_key

return module

