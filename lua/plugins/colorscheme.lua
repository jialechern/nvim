-- 配置 neovim 的 Catppuccin 配色方案(Mocha 摩卡口味)

vim.cmd.packadd('catppuccin-nvim')

require('catppuccin').setup({
    flavour = 'mocha',
    -- 仅在 flavour = 'auto' 时才生效, 此处保留备用
    background = {
        light = 'latte',
        dark = 'mocha',
    },

    transparent_background = true,
    -- 浮动窗口同样透明
    float = {
        transparent = true,
        solid = false,
    },

    -- 同步调色板到终端颜色变量 g:terminal_color_0 ~ g:terminal_color_15
    term_colors = true,

    -- 非当前窗口不做背景变暗
    dim_inactive = {
        enabled = false,
    },

    -- false = 允许斜体 / 粗体 / 下划线
    no_italic = false,
    no_bold = false,
    no_underline = false,

    -- 语法高亮风格控制(留空 {} 表示不添加额外样式)
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
        miscs = {}, -- 关掉 @module/@tag 等硬编码斜体
    },

    -- LSP 诊断相关
    lsp_styles = {
        virtual_text = {
            errors = {},
            hints = {},
            warnings = {},
            information = {},
            ok = {},
        },
        -- 错误单词下方的波纹线
        underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
            ok = { 'underline' },
        },
        -- 关掉 Inlay Hint 的色块, 保持透明
        inlay_hints = {
            background = false,
        },
    },

    -- 手动覆盖调色板原色值 / 任意 highlight group, 此处保持为空
    color_overrides = {},
    custom_highlights = {},

    default_integrations = true,
    -- auto 集成: 自动检测已装插件并开启对应集成(默认关, 这里显式打开)
    auto_integrations = true,

    integrations = {
        -- 命令行 / 消息 / LSP 文档浮窗配色(命令行浮窗边框色见 plugins/noice.lua)
        noice = true,
        -- 通知配色跟随后端: 现在不装 nvim-notify, 走 noice 内置 mini 视图
        -- (NoiceMini / NoiceFormatLevel*); 以后装 snacks.nvim 由 auto_integrations 接管
    },

    compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
})

vim.cmd.colorscheme('catppuccin-mocha')

-- 透明背景完全由上面的 transparent_background / float.transparent 负责;
-- settings/transparency.lua 只在无插件路径下被 settings.lua 调用。
