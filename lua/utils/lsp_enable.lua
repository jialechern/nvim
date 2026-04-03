-- lsp_enable.lua
-- 存放用于快速开启 lsp 服务的工具

local M = {}

function M.enable(server)
  if vim.lsp.is_enabled and not vim.lsp.is_enabled(server) then
    vim.lsp.enable(server)
    return
  end

  -- 如果当前版本没有 vim.lsp.is_enabled, 就直接启用
  vim.lsp.enable(server)
end

return M
