vim.cmd.packadd('nui.nvim')
-- nvim-notify 是可选的通知后端: 不装也能跑 —— noice 的 views.notify 后端列表是
-- { 'snacks', 'notify' } 且自带 fallback = 'mini', 两条路都没有时用内置 mini 视图
-- (右下角一行、2 秒消失)。装了 snacks.nvim 则优先用 snacks(无需改这里)。
-- 因此不硬 packadd, 缺失时静默降级(与 plugins/telescope.lua 对 fzf-native 的处理一致)。
local has_nvim_notify = pcall(vim.cmd.packadd, 'nvim-notify')
vim.cmd.packadd('noice.nvim')

local colors = require('settings.consts').colors

-- 通知窗口的"背后底色": 只在通知带淡入淡出(opacity)阶段时生效
if has_nvim_notify then
    require('notify').setup({
        background_colour = colors.bg1,
    })
end

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

    -- 搜索计数已经在 lualine 的 search_result() 里显示; 上游默认还会往 virtualtext
    -- 视图送一份, 这里跳过以免重复(官方 doc ROUTES 一节的做法)
    routes = {
        {
            filter = { event = 'msg_show', kind = 'search_count' },
            opts = { skip = true },
        },
    },

    views = {
        -- 尺寸一律用百分比: nui 会按当前编辑器尺寸实时换算;
        -- 写成 math.floor(vim.o.columns * 0.8) 只会在启动时求值一次, 之后改窗口大小不再跟随
        cmdline_popup = {
            position = { row = '30%', col = '50%' },
            size = { width = '80%', height = 'auto' },
        },
        popup = {
            size = { width = '50%', height = 'auto' },
        },
        -- LSP hover / signature 浮窗边框: 与 0.12 的 winborder = 'rounded' 保持一致
        -- (上游 hover 视图默认 border.style = 'none')
        hover = {
            border = { style = 'rounded' },
        },
    },
})

-- noice 高亮只保留我们主动想要的差别, 其余交给 catppuccin 的 noice 集成;
-- 透明背景由 colorscheme.lua(transparent_background + float.transparent)与
-- settings/transparency.lua 负责, 这里不再重复设置 NormalFloat / FloatBorder。
-- 注意: NoiceError / NoiceWarn 这两个组在 noice 里并不存在(消息级别颜色由
-- NoiceFormatLevel*、以及装了 nvim-notify 时的 Notify* 决定), 不要在这里设置。
local cmdline_border_fg = colors.frost3

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
