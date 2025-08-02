-- lsp.lua
-- 存放 LSP 相关工具

-- 引入相关模块
local registry = require('mason-registry')

local module = {}

-- 获取指定的 LSP 服务器包
local function get_package(name)
    local ok, pkg = pcall(registry.get_package, name)

    if not ok or pkg == nil then
        return nil
    end

    return pkg
end

module.get_package = get_package

-- 检查某个包是否安装
local function is_installed(server_name)
    if not registry.is_installed(server_name) then
        vim.notify(("⚠️ %s 未安装\n"):format(server_name), vim.log.levels.WARN)
        return false
    else
        return true
    end
end

module.is_installed = is_installed

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

module.install_server = install_server

return module

