local M = {}

function M.setup()
    vim.cmd.packadd('nui.nvim')
    vim.cmd.packadd('nvim-notify')
    vim.cmd.packadd('noice.nvim')

    -- 导入颜色设置
    local colors = require('settings.consts').colors

    -- 先初始化 notify
    local has_notify, notify = pcall(require, 'notify')
    if has_notify then
        notify.setup({
            background_colour = colors.bg1,
        })
    end

    -- 保持浮窗透明
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', ctermbg = 'NONE' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', ctermbg = 'NONE' })

    require('noice').setup({
        cmdline = {
            enabled = true,
            view = 'cmdline_popup',
            opts = {},
            format = {
                cmdline = { pattern = '^:', icon = '$', lang = 'vim' },
                search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
                search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
                filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
                lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = '', lang = 'lua' },
                help = { pattern = '^:%s*he?l?p?%s+', icon = '' },
                input = { view = 'cmdline_input', icon = '󰥻 ' },
            },
        },

        messages = {
            enabled = true,
            view = 'notify',
            view_error = 'notify',
            view_warn = 'notify',
            view_history = 'messages',
            view_search = 'virtualtext',
        },

        popupmenu = {
            enabled = false,
            -- backend = 'nui',
            -- kind_icons = {},
        },

        redirect = {
            view = 'popup',
            filter = { event = 'msg_show' },
        },

        commands = {
            history = {
                view = 'split',
                opts = { enter = true, format = 'details' },
                filter = {
                    any = {
                        { event = 'notify' },
                        { error = true },
                        { warning = true },
                        { event = 'msg_show', kind = { '' } },
                        { event = 'lsp',      kind = 'message' },
                    },
                },
            },
            last = {
                view = 'popup',
                opts = { enter = true, format = 'details' },
                filter = {
                    any = {
                        { event = 'notify' },
                        { error = true },
                        { warning = true },
                        { event = 'msg_show', kind = { '' } },
                        { event = 'lsp',      kind = 'message' },
                    },
                },
                filter_opts = { count = 1 },
            },
            errors = {
                view = 'popup',
                opts = { enter = true, format = 'details' },
                filter = { error = true },
                filter_opts = { reverse = true },
            },
            all = {
                view = 'split',
                opts = { enter = true, format = 'details' },
                filter = {},
            },
        },

        notify = {
            enabled = true,
            view = 'notify',
        },

        lsp = {
            progress = {
                enabled = true,
                format = 'lsp_progress',
                format_done = 'lsp_progress_done',
                throttle = 1000 / 30,
                view = 'mini',
            },
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
                ['vim.lsp.util.stylize_markdown'] = false,
                ['cmp.entry.get_documentation'] = false,
            },
            hover = {
                enabled = true,
                silent = false,
                view = nil,
                opts = {},
            },
            signature = {
                enabled = true,
                auto_open = {
                    enabled = true,
                    trigger = true,
                    throttle = 50,
                },
                view = nil,
                opts = {},
            },
            message = {
                enabled = true,
                view = 'notify',
                opts = {},
            },
            documentation = {
                view = 'hover',
                opts = {
                    lang = 'markdown',
                    replace = true,
                    render = 'plain',
                    format = { '{message}' },
                    win_options = { concealcursor = 'n', conceallevel = 3 },
                },
            },
        },

        markdown = {
            hover = {
                ['|(%S-)|'] = vim.cmd.help,
                ['%[.-%]%((%S-)%)'] = require('noice.util').open,
            },
            highlights = {
                ['|%S-|'] = '@text.reference',
                ['@%S+'] = '@parameter',
                ['^%s*(Parameters:)'] = '@text.title',
                ['^%s*(Return:)'] = '@text.title',
                ['^%s*(See also:)'] = '@text.title',
                ['{%S-}'] = '@parameter',
            },
        },

        health = {
            checker = true,
        },

        presets = {
            bottom_search = false,
            command_palette = false,
            long_message_to_split = false,
            inc_rename = false,
            lsp_doc_border = false,
        },

        throttle = 1000 / 30,

        views = {
            cmdline_popup = {
                position = {
                    row = '30%',
                    col = '50%',
                },
                size = {
                    width = math.floor(vim.o.columns * 0.8),
                    max_width = '80%',
                    height = 'auto',
                },
                border = { style = 'rounded' },
            },
            popup = {
                size = {
                    width = math.floor(vim.o.columns * 0.5),
                    max_width = '50%',
                    height = 'auto',
                },
                border = { style = 'rounded' },
            },
            popupmenu = {
                relative = 'editor',
                position = {
                    row = '55%',
                    col = '50%',
                },
                size = {
                    width = math.floor(vim.o.columns * 0.5),
                    max_width = '50%',
                    height = 'auto',
                },
                border = {
                    style = 'rounded',
                    padding = { 0, 1 },
                },
                win_options = {
                    winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
                },
            },
            mini = {
                size = {
                    width = math.floor(vim.o.columns * 0.3),
                    max_width = '30%',
                    height = 'auto',
                },
            },
        },
    })

    local cmdline_border_fg = colors.frost3
    local search_border_fg = colors.bg3
    local keep_transparent = true

    local function set_noice_hls()
        vim.api.nvim_set_hl(0, 'NoiceCmdlinePopup', { bg = keep_transparent and 'NONE' or nil, fg = search_border_fg })
        vim.api.nvim_set_hl(0, 'NoiceCmdlineIcon', { bg = keep_transparent and 'NONE' or nil, fg = search_border_fg })
        vim.api.nvim_set_hl(0, 'NoiceCmdlinePrompt',
            { bg = keep_transparent and 'NONE' or nil, fg = search_border_fg, bold = true })
        vim.api.nvim_set_hl(0, 'NoiceConfirm', { bg = keep_transparent and 'NONE' or nil, fg = search_border_fg })
        vim.api.nvim_set_hl(0, 'NoiceError', { bg = keep_transparent and 'NONE' or nil, fg = search_border_fg })
        vim.api.nvim_set_hl(0, 'NoiceWarn', { bg = keep_transparent and 'NONE' or nil, fg = search_border_fg })
        vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder',
            { fg = cmdline_border_fg, bg = keep_transparent and 'NONE' or nil })
        vim.api.nvim_set_hl(0, 'NoicePopupBorder', { fg = search_border_fg, bg = keep_transparent and 'NONE' or nil })
        vim.api.nvim_set_hl(0, 'NoicePopupmenuBorder', { fg = search_border_fg, bg = keep_transparent and 'NONE' or nil })
        vim.api.nvim_set_hl(0, 'NoiceSplitBorder', { fg = search_border_fg, bg = keep_transparent and 'NONE' or nil })
    end

    set_noice_hls()
    vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
            set_noice_hls()
        end,
    })

    local map = require('utils.map').map
    local keys = require('keys.windows.float_window')

    map(keys.last_message, function() require('noice').cmd('last') end)
    map(keys.history, function() require('noice').cmd('history') end)
    map(keys.dismiss, function() require('noice').cmd('dismiss') end)

end

return M
