local M = {}

local loaded = false

local function setup_blink()
    if loaded then
        return
    end
    loaded = true

    vim.cmd.packadd('colorful-menu.nvim')
    vim.cmd.packadd('blink.cmp')
    vim.cmd.packadd('LuaSnip')

    -- 让所有浮窗默认使用圆角边框
    -- blink.cmp 的 menu / doc 都会优先继承它
    vim.o.winborder = 'rounded'

    local blink = require('blink.cmp')
    local get_key = require('settings.variables.lsp').get_key

    -- 统一设置 blink.cmp 的高亮组
    -- 这里尽量跟随当前配色，而不是写死一堆颜色
    local function set_blink_hls()
        -- 补全菜单背景与边框
        vim.api.nvim_set_hl(0, 'BlinkCmpMenu', {
            link = 'NormalFloat',
        })
        vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', {
            link = 'FloatBorder',
        })

        -- 当前选中项: 用高亮行强调
        -- 这就是 blink.cmp 的"选中框"核心
        vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', {
            link = 'PmenuSel',
        })

        -- 文档窗口背景与边框
        vim.api.nvim_set_hl(0, 'BlinkCmpDoc', {
            link = 'NormalFloat',
        })
        vim.api.nvim_set_hl(0, 'BlinkCmpDocBorder', {
            link = 'FloatBorder',
        })
        vim.api.nvim_set_hl(0, 'BlinkCmpDocCursorLine', {
            link = 'Visual',
        })

        -- 文本类高亮
        vim.api.nvim_set_hl(0, 'BlinkCmpLabel', {
            link = 'NormalFloat',
        })
        vim.api.nvim_set_hl(0, 'BlinkCmpLabelDetail', {
            link = 'Comment',
        })
        vim.api.nvim_set_hl(0, 'BlinkCmpLabelDescription', {
            link = 'Comment',
        })
        vim.api.nvim_set_hl(0, 'BlinkCmpLabelDeprecated', {
            link = 'Comment',
        })
        vim.api.nvim_set_hl(0, 'BlinkCmpLabelMatch', {
            link = 'Special',
        })
        vim.api.nvim_set_hl(0, 'BlinkCmpSource', {
            link = 'Comment',
        })
        vim.api.nvim_set_hl(0, 'BlinkCmpGhostText', {
            link = 'Comment',
        })
    end

    set_blink_hls()

    -- 切换主题后重新应用高亮，避免被 colorscheme 覆盖
    vim.api.nvim_create_autocmd('ColorScheme', {
        callback = set_blink_hls,
    })

    local opts = {
        -- lua | prefer_rust
        fuzzy = {
            implementation = 'prefer_rust',
            prebuilt_binaries = {
                download = true,      -- 允许自动下载预编译库
                force_version = 'v*', -- 跟踪最新 1.x release
            },
        },
    }

    -- 禁用指定 filetype 的补全
    opts.enabled = function()
        return not vim.tbl_contains({
            -- 'lua',
            -- 'markdown',
        }, vim.bo.filetype)
    end

    -- 补全菜单与文档
    opts.completion = {
        -- 菜单自动显示
        menu = {
            enabled = true,
            auto_show = true,
            auto_show_delay_ms = 180,
            border = 'rounded', -- 菜单圆角
            winblend = 0,       -- 避免边框/背景混色太脏
            scrollbar = true,   -- 显示滚动条
            scrolloff = 2,      -- 让光标上下留一点空间
            direction_priority = { 's', 'n' },
            winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
            cmdline_position = function()
                if vim.g.ui_cmdline_pos ~= nil then
                    local pos = vim.g.ui_cmdline_pos
                    return { pos[1] - 1, pos[2] }
                end
                local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
                return { vim.o.lines - height, 0 }
            end,
            draw = {
                -- 让关键字和 label 对齐, 看起来更整齐
                align_to = 'label',
                -- 菜单左右留白, 圆角窗口里会更舒服
                padding = { 0, 1 },
                -- 当前行高亮优先级提高一点, 选中感更强
                cursorline_priority = 20000,
                -- 分成三列: 图标 / 名称 / 来源
                columns = {
                    { 'kind_icon' },
                    { 'label', 'label_description', gap = 1 },
                    { 'source_name' },
                },
                components = {
                    kind_icon = {
                        ellipsis = false,
                        text = function(ctx)
                            return ctx.kind_icon .. ctx.icon_gap
                        end,
                        -- 让图标颜色优先于 cursorline
                        highlight = function(ctx)
                            return { { group = ctx.kind_hl, priority = 20000 } }
                        end,
                    },
                    label = {
                        width = { fill = true, max = 60 },
                        text = function(ctx)
                            return ctx.label .. ctx.label_detail
                        end,
                        highlight = function(ctx)
                            local highlights = {
                                {
                                    0,
                                    #ctx.label,
                                    group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel',
                                },
                            }

                            if ctx.label_detail then
                                table.insert(highlights, {
                                    #ctx.label,
                                    #ctx.label + #ctx.label_detail,
                                    group = 'BlinkCmpLabelDetail',
                                })
                            end

                            for _, idx in ipairs(ctx.label_matched_indices) do
                                table.insert(highlights, {
                                    idx,
                                    idx + 1,
                                    group = 'BlinkCmpLabelMatch',
                                })
                            end

                            return highlights
                        end,
                    },
                    label_description = {
                        width = { max = 30 },
                        text = function(ctx)
                            return ctx.label_description
                        end,
                        highlight = 'BlinkCmpLabelDescription',
                    },
                    source_name = {
                        width = { max = 18 },
                        text = function(ctx)
                            return ctx.source_name
                        end,
                        highlight = 'BlinkCmpSource',
                    },
                },
            },
        },

        -- 文档窗口
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 180,
            update_delay_ms = 50,
            treesitter_highlighting = true,
            window = {
                min_width = 18,
                max_width = 80,
                max_height = 20,
                border = 'rounded', -- 文档圆角
                winblend = 0,
                scrollbar = true,
                winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
                direction_priority = {
                    menu_north = { 'e', 'w', 'n', 's' },
                    menu_south = { 'e', 'w', 's', 'n' },
                },
            },
        },

        -- 关键字范围
        keyword = {
            range = 'full',
        },

        -- 选择行为
        list = {
            selection = {
                preselect = false,
                auto_insert = false,
            },
        },

        -- 幽灵文本：先保持干净，避免和菜单抢视觉焦点
        ghost_text = {
            enabled = false,
        },
    }

    -- 按键映射
    opts.keymap = {
        preset = 'none',
        [get_key('open-hint')] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-p>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-n>'] = { 'scroll_documentation_down', 'fallback' },
        [get_key('close-hint')] = { 'hide' },
        ['<Tab>'] = { 'accept', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        [get_key('snippet_forward')] = { 'snippet_forward', 'fallback' },
        [get_key('snippet_backward')] = { 'snippet_backward', 'fallback' },
    }

    -- 签名提示
    opts.signature = {
        enabled = true,
    }

    -- 命令行补全
    opts.cmdline = {
        completion = {
            menu = { auto_show = false },
            ghost_text = { enabled = true },
        },
        keymap = {
            preset = 'inherit',
            ['<Tab>'] = { 'accept', 'fallback' },
        },
    }

    -- snippet 引擎
    opts.snippets = { preset = 'luasnip' }

    -- 补全源
    opts.sources = {
        default = { 'lsp', 'snippets', 'path', 'buffer' },
        providers = {
            snippets = {},
        },
    }

    blink.setup(opts)
end

function M.setup()
    -- 需加载补全
    vim.api.nvim_create_autocmd({ 'InsertEnter', 'CmdlineEnter' }, {
        once = true,
        callback = setup_blink,
    })
end

return M
