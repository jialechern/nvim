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

    local blink = require('blink.cmp')
    local get_key = require('settings.variables.lsp').get_key

    local opts = {
	-- lua | prefer_rust 即选用 lua 实现还是 rust 实现
        fuzzy = {
		    implementation = 'prefer_rust',
            prebuilt_binaries = {
                download = true,      -- 允许自动下载预编译库
                force_version = 'v*', -- 跟踪最新 1.x release; 也可以写成固定版本，比如 'v1.10.1'
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
        documentation = {
            auto_show = true,
        },
        menu = {
            draw = {
                columns = { { 'kind_icon' }, { 'label', gap = 1 } },
                components = {
                    label = {
                        text = function(ctx)
                            return require('colorful-menu').blink_components_text(ctx)
                        end,
                        highlight = function(ctx)
                            return require('colorful-menu').blink_components_highlight(ctx)
                        end,
                    },
                },
            },
        },
        keyword = {
            range = 'full',
        },
        list = {
            selection = {
                preselect = false,
                auto_insert = false,
            },
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
        ['<C-.>'] = { 'snippet_forward', 'fallback' },
        ['<C-,>'] = { 'snippet_backward', 'fallback' },
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
