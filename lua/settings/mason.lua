-- mason.lua
-- 这里是 mason 的一些配置

local module = {}

-- 引入相关模块
local registry = require('mason-registry')
local map = require('utils.map').map
local require_lsps = require('settings.lsp').require_lsps

-- 获取指定的 LSP 服务器包
local function get_package(name)
    local ok, pkg = pcall(registry.get_package, name)

    if not ok or pkg == nil then
        return nil
    end

    return pkg
end

-- 检查某个包是否安装
local function is_installed(server_name)
    if not registry.is_installed(server_name) then
        vim.notify(("⚠️ %s 未安装\n"):format(server_name), vim.log.levels.WARN)
        return false
    else
        return true
    end
end

-- 安装指定的 LSP 服务器
local function install_server(server_name)
    local pkg = get_package(server_name)
    if not pkg then
        vim.notify(("⚠️ 找不到 Mason 包：%s，请确认名称是否正确\n"):format(server_name), vim.log.levels.ERROR)
        return
    end

    vim.notify(("🔄 正在安装 %s ...\n"):format(server_name), vim.log.levels.INFO)
    pkg:install()
        :once('installation-success', function()
            vim.schedule(function()
                vim.notify(("✅ %s 安装完成\n"):format(server_name), vim.log.levels.INFO)
            end)
        end)
        :once('installation-failed', function()
            vim.schedule(function()
                vim.notify(("❌ %s 安装失败，请查看 Mason 日志\n"):format(server_name), vim.log.levels.ERROR)
            end)
    end)
end

-- 自动检查/加载/下载 LSP 及其服务器
vim.api.nvim_create_autocmd("FileType", {
    pattern = { '*' },
    callback = function()
        local filetype = vim.bo.filetype
        local lsp = require_lsps[filetype]
        if lsp then
            -- 检查并安装 LSP 服务器
            local server = lsp[2]
            if not is_installed(server) then
                install_server(server)
            end

            -- 配置检查 LSP 服务器的快捷键
            map('n', '<leader>clsp', function ()
                if is_installed(server) then
                    vim.notify(("✅ %s 安装完成\n"):format(server), vim.log.levels.INFO)
                end
            end, { desc = '检查 LSP 服务器' })
        end
    end,
})

return module

