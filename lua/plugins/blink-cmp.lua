-- blink-cmp.lua

return {
    'saghen/blink.cmp',
    event = { 'BufReadPost', 'BufNewFile' },
    version = '1.*',
    -- build = 'cargo build --release',
    -- 增加命令补全菜单栏的语法高亮插件
    dependencies = {
        'xzbdmw/colorful-menu.nvim',
        dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        opts = {},
    },
    opts = {

        -- 禁用指定文件类型的补全
        enabled = function() return not vim.tbl_contains({
            -- 'lua',
            -- 'markdown',
        }, vim.bo.filetype) end,

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

            keyword = {
                -- 使用以整个单词为单位的补全
                range = 'full',
            },

            -- 关闭与选择与自动插入
            list = { selection = { preselect = false, auto_insert = false }, },
        },

        -- 重定义默认快捷键
        keymap = {
            preset = 'none',
            -- 开启/关闭补全文档
            ['<C-o>'] = { 'show', 'show_documentation', 'hide_documentation' },

            -- 上下滚动文档
            ['<C-p>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-n>'] = { 'scroll_documentation_down', 'fallback' },

            -- 关闭补全菜单
            ['<C-x>'] = { 'hide', 'fallback' },

            -- 接受补全
            ['<CR>'] = { 'accept', 'fallback' },

            -- 选择补全菜单项
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },

            -- snippet 跳转键
            ['<C-l>'] = { 'snippet_forward', 'fallback' },
            ['<A-l>'] = { 'snippet_backward', 'fallback' },
        },

        -- 自动给出函数签名提示
        signature = {
            enabled = true,
        },

        -- neovim 命令行模式自动补全
        cmdline = {
            completion = {

                -- 默认启用补全
                menu = { auto_show = false },

                -- 幽灵文本提示
                ghost_text = { enabled = true },
            },

            -- 继承默认快捷键
            keymap = {
                preset = 'inherit',

                -- 禁用 Tab 键的默认行为
                ['<Tab>'] = false,

                ['<CR>'] = { 'accept_and_enter', 'fallback' },
            },
        },

        -- 配置 luasnip 为默认代码片段补全引擎
        snippets = { preset = 'luasnip' },

        -- 提高自定义 snippet 的权重
        sources = {
            -- 默认补全源
            default = { 'lsp', 'snippets', 'path', 'buffer' },
            -- 配置 snippets 的权重
            providers = {
                snippets = { score_offset = 1000, },
            },
        },
    },
}

