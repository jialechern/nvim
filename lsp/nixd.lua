local module = {}

-- 核心启动配置
module.cmd = { "nixd" }
module.filetypes = { "nix" }
module.root_markers = { "flake.nix", ".git", "home.nix" }

-- nixd 独有的深度配置
module.settings = {
    nixd = {
        -- 1. 告诉 LSP 哪里的 nixpkgs 仓库（用于包名补全）
        nixpkgs = {
            expr = "import <nixpkgs> { }",
        },
        -- 2. 格式化工具配置
        formatting = {
            command = { "nixpkgs-fmt" },
        },
        -- 3. 选项补全（Home Manager 关键配置）
        -- 这部分会让 nixd 尝试去解析 Home Manager 的选项，
        -- 这样你在写 programs.zsh... 时能看到详细的文档提示。
        options = {
            -- 针对 Home Manager 的选项提示
            home_manager = {
                expr = '(import <home-manager/modules> { pkgs = import <nixpkgs> { }; }).options'
            },
            -- 如果以后你用了 NixOS，可以取消下面的注释
            -- nixos = {
            --     expr = '(import <nixpkgs/nixos/lib/eval-config.nix> { modules = [ ]; }).options'
            -- },
        },
    },
}

-- 动态功能绑定 (LspAttach)
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.name == "nixd" then
            local bufnr = args.buf

            -- [快捷键]：手动触发格式化（如果没开自动格式化）
            vim.keymap.set("n", "<leader>nf", function()
                vim.lsp.buf.format({ async = true })
                vim.notify("Nix 代码已格式化")
            end, { buffer = bufnr, desc = "Nix: Format File" })

            -- [文档查询]：查看当前光标下的 Nix 选项文档
            -- nixd 支持通过 hover 显示 Nix 选项的默认值和说明
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Nix: Hover Documentation" })
        end
    end,
})

return module
