-- lsp.lua
-- 这里是 LSP 相关的配置

vim.lsp.enable 'lua_ls'


-- if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
--     local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
--     vim.api.nvim_create_autocmd(
--         { 'CursorHold','CursorHoldI' },
-- 
--         {
--             buffer = event.buf,
--             group = highlight_augroup,
--             callback = vim.lsp.buf.document_highlight,
--         }
--     )
-- 
--     vim.api.nvim_create_autocmd(
--         { 'CursorMoved', 'CursorMoved' },
-- 
--         {
--             buffer = event.buf,
--             group = highlight_augroup,
--             callback = vim.lsp.buf.clear_references
--         }
--     )
-- end
