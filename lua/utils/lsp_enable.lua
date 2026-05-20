-- lsp_enable.lua
-- 存放用于快速开启 lsp 服务的工具

local M = {}

local function enable_one(server)
    -- 如果版本不支持 vim.lsp.is_enabled, 直接启用
    if not vim.lsp.is_enabled then
        vim.lsp.enable(server)
        return
    end

    -- 避免重复启用
    if not vim.lsp.is_enabled(server) then
        vim.lsp.enable(server)
    end
end

function M.enable(servers)
    if type(servers) == 'string' then
        enable_one(servers)
    else
        for _, server in ipairs(servers) do
            enable_one(server)
        end
    end
end

return M
