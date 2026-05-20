-- 配置 neovim 的 Catppuccin 配色方案(Mocha 摩卡口味)
local M = {}

function M.setup()
    -- 加载主题插件
    vim.cmd.packadd('catppuccin')

    require('catppuccin').setup({
        -- 口味固定为 Mocha(深色旗舰版)
        flavour = 'mocha',
        -- 根据 vim.o.background 自动匹配 latre / mocha(flavour 为 auto 时才生效, 此处保留备用)
        background = {
            light = 'latte',
            dark = 'mocha',
        },

        -- 启用透明背景(与之前的 nightfox 配置保持一致)
        transparent_background = true,
        -- 浮动窗口也使用透明背景
        float = {
            transparent = true,
            solid = false,
        },

        -- 将 Catppuccin 调色板同步到终端内置颜色变量(g:terminal_color_0 ~ g:terminal_color_15)
        term_colors = true,

        -- 非当前窗口不做背景变暗(与之前的 nightfox 配置保持一致)
        dim_inactive = {
            enabled = false,
        },

        -- 全局是否禁用斜体 / 粗体 / 下划线(false = 允许；设为 true 则强制全局关闭)
        no_italic = false,
        no_bold = false,
        no_underline = false,

        -- 语法高亮风格控制(留空 {} 表示不添加额外样式, 保持与原 nightfox 一致的简洁风格)
        styles = {
            comments = {},
            conditionals = {},
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },

        -- LSP 诊断相关的显示风格
        lsp_styles = {
            -- 虚拟文字诊断(行尾 floating 诊断块): 不加斜体
            virtual_text = {
                errors = {},
                hints = {},
                warnings = {},
                information = {},
                ok = {},
            },
            -- 下划线诊断(错误单词下方的波纹线)
            underlines = {
                errors = { 'underline' },
                hints = { 'underline' },
                warnings = { 'underline' },
                information = { 'underline' },
                ok = { 'underline' },
            },
            -- Inlay Hint(参数提示): 关闭后台色块, 保持透明
            inlay_hints = {
                background = false,
            },
        },

        -- 颜色覆盖(直接修改 Catppuccin 调色板原色值, 此处为空不覆盖)
        color_overrides = {},

        -- 全局额外高亮覆盖(自定义任意 highlight group, 此处保留为空)
        custom_highlights = {},

        -- 默认开启 Catppuccin 内置的所有插件集成
        default_integrations = true,
        -- 自动检测已安装插件并开启对应集成
        auto_integrations = true,

        -- 显式控制特定插件的集成(覆盖 default / auto 行为)
        integrations = {
            -- blink.cmp: 使用带边框风格的补全菜单
            blink_cmp = { style = 'bordered' },
            -- lualine: 让 lualine 内部直接使用 catppuccin 色值
            lualine = true,
            -- noice.nvim: 匹配 noice 的默认界面风格
            noice = true,
            -- nvim-notify: 通知窗口配色
            notify = true,
            -- markview.nvim: markdown / typst 等文档渲染配色
            markview = true,
            -- nvim-treesitter-context: 上下文固定行配色
            treesitter_context = true,
            -- treesitter(经 default_integrations = true 已默认开启, 此处显式标注以明确)
            -- treesitter = true,
            -- fzf 集成针对的是 fzf-lua, 本配置使用 fzf.vim, 故不在此列
        },

        -- 编译缓存路径: 将最终计算出的高亮 LUA 缓存到磁盘, 加速后续启动
        compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
    })

    -- 应用 Mocha 口味主题
    vim.cmd.colorscheme('catppuccin-mocha')

    -- =============================================================================
    -- 额外强制透明覆盖(确保 Catppuccin 不会在某些场景覆盖为不透明背景)
    -- =============================================================================
    vim.api.nvim_set_hl(0, 'LspInlayHint', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingNormal', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })

    -- 切换主题后重新应用透明覆盖(防止其他插件 / 手动切换主题后丢失透明设置)
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
