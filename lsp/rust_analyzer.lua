---@brief
---
--- rust-analyzer LSP 配置
--- 文档: https://rust-analyzer.github.io/book/configuration.html
---
--- 用法示例:
--- ```lua
--- vim.lsp.config('rust_analyzer', {
---   settings = {
---     ['rust-analyzer'] = {
---       diagnostics = { enable = false }
---     }
---   }
--- })
--- ```
---
--- 注意: 请勿手动设置 `init_options`, 本配置会在 `before_init` 中
--- 自动从 settings["rust-analyzer"] 填充, 详见:
--- https://github.com/rust-lang/rust-analyzer/blob/eb5da56d839ae0a9e9f50774fa3eb78eb0964550/docs/dev/lsp-extensions.md?plain=1#L26

--- --- --- --- 工具函数 --- --- ---
--- 在 bufnr 对应的 rust_analyzer 客户端上重新加载 Cargo workspace
local function reload_workspace(bufnr)
    local clients = vim.lsp.get_clients { bufnr = bufnr, name = 'rust_analyzer' }
    for _, client in ipairs(clients) do
        vim.notify 'Reloading Cargo Workspace'
        client.request('rust-analyzer/reloadWorkspace', nil, function(err)
            if err then
                error(tostring(err))
            end
            vim.notify 'Cargo workspace reloaded'
        end, 0)
    end
end

--- 判断文件是否属于 Cargo registry / rustup toolchain(库文件)
--- 若是, 则复用已有 rust_analyzer 客户端的 root_dir, 避免重复启动新实例
local function is_library(fname)
    local user_home    = vim.fs.normalize(vim.env.HOME)
    local cargo_home   = os.getenv 'CARGO_HOME' or (user_home .. '/.cargo')
    local rustup_home  = os.getenv 'RUSTUP_HOME' or (user_home .. '/.rustup')

    local search_roots = {
        rustup_home .. '/toolchains',
        cargo_home .. '/registry/src',
        cargo_home .. '/git/checkouts',
    }

    for _, root in ipairs(search_roots) do
        if vim.fs.relpath(root, fname) then
            local clients = vim.lsp.get_clients { name = 'rust_analyzer' }
            return #clients > 0 and clients[#clients].config.root_dir or nil
        end
    end
end

--- --- --- --- LSP 配置主体 --- --- ---
return {
    cmd          = { 'rust-analyzer' },
    filetypes    = { 'rust' },

    root_dir     = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)

        -- 1. 库文件：复用已有客户端的 root_dir
        local reused_dir = is_library(fname)
        if reused_dir then
            on_dir(reused_dir)
            return
        end

        -- 2. 非 Cargo 项目：尝试 rust-project.json → .git 目录 → 文件所在目录
        local cargo_crate_dir = vim.fs.root(fname, { 'Cargo.toml' })
        if cargo_crate_dir == nil then
            local git_root = vim.fs.find('.git', { path = fname, upward = true })[1]
            on_dir(
                vim.fs.root(fname, { 'rust-project.json' })
                or (git_root and vim.fs.dirname(git_root))
                or vim.fs.dirname(fname) -- ← 兜底：单独 .rs 文件，回退到文件所在目录
            )
            return
        end

        -- 3. Cargo 项目：通过 `cargo metadata` 解析真实 workspace root
        local cmd = {
            'cargo', 'metadata',
            '--no-deps', '--format-version', '1',
            '--manifest-path', cargo_crate_dir .. '/Cargo.toml',
        }

        vim.system(cmd, { text = true }, function(output)
            if output.code == 0 then
                local workspace_root
                if output.stdout then
                    local ok, result = pcall(vim.json.decode, output.stdout)
                    if ok and result.workspace_root then
                        workspace_root = vim.fs.normalize(result.workspace_root)
                    end
                end
                on_dir(workspace_root or cargo_crate_dir)
            else
                vim.schedule(function()
                    vim.notify(
                        ('[rust_analyzer] cargo metadata 失败 (code %d):\n%s\n%s')
                        :format(output.code, table.concat(cmd, ' '), output.stderr),
                        vim.log.levels.WARN
                    )
                end)
            end
        end)
    end,

    capabilities = {
        experimental = {
            serverStatusNotification = true,
        },
    },

    --- rust-analyzer 要求将配置通过 initializationOptions 传递
    before_init  = function(init_params, config)
        if config.settings and config.settings['rust-analyzer'] then
            init_params.initializationOptions = config.settings['rust-analyzer']
        end
    end,

    on_attach    = function(_, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, 'LspCargoReload', function()
            reload_workspace(bufnr)
        end, { desc = 'Reload current cargo workspace' })
    end,
}
