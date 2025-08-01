-- blink-cmp.lua

return {
    'saghen/blink.cmp',
    event = { 'BufReadPost', 'BufNewFile' },
    version = '1.*',
    -- build = 'cargo build --release',
    -- 增加命令补全菜单栏的语法高亮插件
    dependencies = { 'xzbdmw/colorful-menu.nvim', opts = {}, },
    opts = {

        -- 代码提示时自动显示文档
        completion = {

            -- 自动显示补全时的文档
            documentation = {
                auto_show = true,
            },

            -- 补全时高亮
            menu = {
                draw = {
                    columns = { { 'kind_icon' }, { 'label', gap = 1 } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require('colorful-menu').
                                blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require('colorful-menu').
                                blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
            },
        },

        -- 重定义默认快捷键
        keymap = {
            ['<C-p>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-n>'] = { 'scroll_documentation_down', 'fallback' },
        },

        -- 自动给出函数签名提示
        signature = {
            enabled = true,
        },

        -- neovim 命令行模式自动补全
        cmdline = {
            completion = {
                menu = { auto_show = true },
            },
        },

        -- 提高自定义 snippet 的权重
        sources = {
            providers = {
                snippets = { score_offset = 1000, },
            },
        },
    },
}

