local module = {}

-- 核心启动配置
module.cmd = { "nixd" }
module.filetypes = { "nix" }
module.root_markers = { "flake.nix", ".git", "home.nix" }

module.settings = {
    nixd = {
        -- 告诉 LSP 哪里的 nixpkgs 仓库(用于包名补全)
        nixpkgs = {
            expr = "import <nixpkgs> { }",
        },
        -- 格式化工具配置
        formatting = {
            command = { "nixpkgs-fmt" },
        },
        -- 选项补全(Home Manager 关键配置)
        -- 这部分会让 nixd 尝试去解析 Home Manager 的选项,
        -- 这样在写 programs.zsh... 时能看到详细的文档提示
        options = {
            -- 针对 Home Manager 的选项提示
            home_manager = {
                expr = '(import <home-manager/modules> { pkgs = import <nixpkgs> { }; }).options'
            },
            -- 如果以后用了 NixOS, 可以取消下面的注释
            -- nixos = {
            --     expr = '(import <nixpkgs/nixos/lib/eval-config.nix> { modules = [ ]; }).options'
            -- },
        },
    },
}

return module
