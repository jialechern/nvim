-- 配置 neovim 的配色方案
local M = {}

function M.setup()
    -- 加载主题插件
    vim.cmd.packadd('nightfox.nvim')

    require('nightfox').setup({
        options = {
            -- 编译缓存目录
            compile_path = vim.fn.stdpath('cache') .. '/nightfox',

            -- 编译文件后缀
            compile_file_suffix = '_compiled',

            -- 保持透明背景
            transparent = true,

            -- 同步终端颜色
            terminal_colors = true,

            -- 非当前窗口不做额外变暗
            dim_inactive = false,

            -- 默认开启模块功能
            module_default = true,

            colorblind = {
                enable = false,
                simulate_only = false,
                severity = {
                    protan = 0,
                    deutan = 0,
                    tritan = 0,
                },
            },

            styles = {
                comments = 'NONE',
                conditionals = 'NONE',
                constants = 'NONE',
                functions = 'NONE',
                keywords = 'NONE',
                numbers = 'NONE',
                operators = 'NONE',
                strings = 'NONE',
                types = 'NONE',
                variables = 'NONE',
            },

            inverse = {
                match_paren = false,
                visual = false,
                search = false,
            },

            modules = {},
        },
        palettes = {},
        specs = {},
        groups = {},
    })

    -- 应用主题
    vim.cmd.colorscheme('nightfox')

    -- 重置 lsp 背景色为透明
    vim.api.nvim_set_hl(0, 'LspInlayHint', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingNormal', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })

    vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
            vim.api.nvim_set_hl(0, 'LspInlayHint', { bg = 'NONE' })
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { bg = 'NONE' })
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { bg = 'NONE' })
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = 'NONE' })
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = 'NONE' })
            vim.api.nvim_set_hl(0, 'DiagnosticFloatingNormal', { bg = 'NONE' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
            vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })
        end,
    })
end

return M
