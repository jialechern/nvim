local module = {}

-- 使用 wrapper 可以让 HLS 自动适应项目目录下的具体 GHC 版本
module.cmd = { 'haskell-language-server-wrapper', '--lsp' }
module.filetypes = { 'haskell', 'lhaskell', 'cabal' }

-- 核心配置: 识别项目根目录
-- 增加了 flake.nix, 这对使用 Nix 构建 Haskell 项目的环境非常关键
module.root_markers = { 'hie.yaml', 'cabal.project', '*.cabal', 'flake.nix', 'stack.yaml', '.git' }

module.settings = {
    haskell = {
        formattingProvider = "ormolu", -- 推荐使用 ormolu(严格)或 fourmolu(相对宽松)
        plugin = {
            -- Eval 插件: Haskell 开发中最惊艳的功能之一
            -- 允许在注释中写代码, LSP 会帮你计算并直接插入结果
            eval = {
                globalOn = true,
            },
            -- HLint: 写出更"地道"的函数式代码的 Lint 工具
            hlint = {
                globalOn = true,
                diagnosticsOn = true,
            },
            -- 自动修复缺失的模块导入
            importLens = {
                globalOn = true,
                codeLensOn = true,
            },
            -- 开启 Wingman(自动写代码推导工具), 在类型洞 (_) 处生成实现
            tactics = {
                globalOn = true,
                codeLensOn = true,
            }
        }
    }
}

module.on_attach = function(client, bufnr)
    if client.server_capabilities.semanticTokensProvider then
        client.handlers['textDocument/semanticTokens/full'] = function() end
        client.handlers['textDocument/semanticTokens/range'] = function() end
    end

    vim.keymap.set("n", "<leader>ev", vim.lsp.codelens.run,
        { buffer = bufnr, desc = "Haskell: Run CodeLens" })

    vim.keymap.set("n", "<leader>cr", function()
        vim.lsp.codelens.enable(true, { bufnr = bufnr })
    end, { buffer = bufnr, desc = "Haskell: Refresh CodeLens" })

    vim.keymap.set("n", "<leader>ht", function()
        vim.lsp.buf.code_action({
            context = { only = { "refactor.wingman" } },
            apply = true
        })
    end, { buffer = bufnr, desc = "Haskell: Wingman Tactics" })

    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
        buffer = bufnr,
        callback = function()
            vim.lsp.codelens.enable(true, { bufnr = bufnr })
        end,
    })
end

return module
