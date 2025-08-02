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
    print(("⚠️ %s 尚未安装"):format(server_name))
    return false
  end
  print(("✅ %s 已安装"):format(server_name))
  return true
end

module.is_installed = is_installed

-- 获取已安装的 LSP 服务器列表
local function get_installed_servers()
    for _, pkg in ipairs(registry.get_installed_packages()) do
        print("• " .. pkg.name)
    end
end

module.get_installed_servers = get_installed_servers

-- 安装指定的 LSP 服务器
local function install_server(server_name)
  if is_installed(server_name) then
    print(("ℹ️ %s 已经安装，无需重复安装"):format(server_name))
    return
  end

  local pkg = get_package(server_name)
  if not pkg then
    print(("⚠️ 找不到 Mason 包：%s，请确认名称是否正确"):format(server_name))
    return
  end

  print(("正在安装 %s ..."):format(server_name))
  pkg:install()
    :once("closed", function()
      if registry.is_installed(server_name) then
        print(("✅ %s 安装完成"):format(server_name))
      else
        print(("❌ %s 安装失败，请查看 Mason 日志"):format(server_name))
      end
    end)
end

module.install_server = install_server

return module

