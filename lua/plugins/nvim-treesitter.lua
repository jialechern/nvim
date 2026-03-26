-- lua/plugins/nvim-treesitter.lua
local M = {}
M[1] = {}
local nvim_treesitter = M[1]

nvim_treesitter[1] = "nvim-treesitter/nvim-treesitter"

-- 当前主分支的 nvim-treesitter 不支持 lazy-loading，
-- 所以这里必须常驻加载, 而不是 FileType 懒加载
nvim_treesitter.lazy = false

nvim_treesitter.config = function()
    -- 先判断当前 Neovim 版本
    local has_nvim_012 = vim.fn.has("nvim-0.12") == 1

    if has_nvim_012 then
        -- 现代分支: 适配当前 nvim-treesitter 写法
        local ok, ts = pcall(require, "nvim-treesitter")
        if not ok then
            vim.notify(
                "无法加载 nvim-treesitter：请检查插件是否已正确安装",
                vim.log.levels.ERROR
            )
            return
        end

        -- 当前版本官方入口: setup()
        -- 在 NixOS 里已经由 Nix 提供 parser, 这里不必再让插件自己装 parser
        ts.setup({})

        local group = vim.api.nvim_create_augroup("UserTreesitterModern", { clear = true })

        -- 只对你常用的文件类型启用 Treesitter
        local filetypes = {
            "bash", "c", "cpp", "css", "go", "html", "java",
            "javascript", "json", "lua", "markdown", "nix", "python",
            "rust", "toml", "typescript", "vim", "vimdoc", "yaml",
            "sh", "zsh",
        }

        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = filetypes,
            callback = function()
                -- 语法高亮: 由 Neovim 自己提供
                vim.treesitter.start()

                -- 自动缩进: 由 nvim-treesitter 提供
                vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

                -- 折叠: 由 Neovim 自己提供
                vim.opt_local.foldmethod = "expr"
                vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.opt_local.foldenable = false
            end,
        })
    else
        -- 兼容分支:
	    nvim_treesitter.branch = "master"
        -- 0.11.6 下, 当前新版 nvim-treesitter 主分支不保证可用;
        -- 只有把插件 pin 到旧版时, 这个分支才有意义
        local ok, configs = pcall(require, "nvim-treesitter.configs")
        if not ok then
            vim.notify(
                "当前 Neovim < 0.12, 且没有找到旧版 nvim-treesitter.configs. 建议升级 Neovim 到 0.12+, 或者把 nvim-treesitter pin 到旧版.",
                vim.log.levels.WARN
            )
            return
        end

        configs.setup({
            -- 旧版配置风格
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
            },

            -- parser 已由 Nix 管理, 这里不让插件自己安装
            ensure_installed = {
                -- Shell / 系统
                'bash',
                'c',
                'diff',
                'dockerfile',
                'git_config',
                'git_rebase',
                'gitattributes',
                'gitcommit',
                'gitignore',
                'nix',
                'query',
                'vim',
                'vimdoc',

                -- Web / 前端
                'css',
                'html',
                'javascript',
                'jsdoc',
                'json',
                'json5',
                'jsonc',
                'tsx',
                'typescript',

                -- 常用/常见开发语言
                'lua',
                'luadoc',
                'markdown',
                'markdown_inline',
                'python',
                'regex',
                'rust',
                'toml',
                'yaml',

                -- LaTeX / Typst
                'latex',
                'typst',
            },
            auto_install = true,
        })

        local group = vim.api.nvim_create_augroup("UserTreesitterLegacy", { clear = true })

        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = {
                "bash", "c", "cpp", "css", "go", "html", "java",
                "javascript", "json", "lua", "markdown", "nix", "python",
                "rust", "toml", "typescript", "vim", "vimdoc", "yaml",
                "sh", "zsh",
            },
            callback = function()
                vim.treesitter.start()
                vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                vim.opt_local.foldmethod = "expr"
                vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.opt_local.foldenable = false
            end,
        })
    end
end

return M
