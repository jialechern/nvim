-- blink-cmp.lua

local M = {}
M[1] = {}
local blink_cmp = M[1]


blink_cmp[1] = 'saghen/blink.cmp'


-- 在读入或新建文件时加载
blink_cmp.event = 'VimEnter'
blink_cmp.version = '1.*'


-- 构建方式
-- blink_cmp.build = 'cargo build --release'


-- 增加命令补全菜单栏的语法高亮插件
blink_cmp.dependencies = {
    'xzbdmw/colorful-menu.nvim',
    dependencies = { 'L3blink_cmpON4D3/LuaSnip', version = 'v2.*' },
    opts = {},
}


local opts = {}

-- 禁用指定文件类型的补全
opts.enabled = function() return
    not vim.tbl_contains({
        -- 'lua',
        -- 'markdown',
    }, vim.bo.filetype)
end

-- 代码提示时自动显示文档
opts.completion = {
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
}

-- 引入 LSP 快捷键设置
local get_key = require('settings.variables.lsp').get_key

-- 重定义默认快捷键
opts.keymap = {
    preset = 'none',
    -- 开启/关闭补全文档
    [get_key('open-hint')] = { 'show', 'show_documentation', 'hide_documentation' },

    -- 上下滚动文档
    ['<C-p>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-n>'] = { 'scroll_documentation_down', 'fallback' },

    -- 关闭补全菜单
    [get_key('close-hint')] = { 'hide', },

    -- 接受补全
    ['<Tab>'] = { 'accept', 'fallback' },

    -- 选择补全菜单项
    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-j>'] = { 'select_next', 'fallback' },

    -- snippet 跳转键
    ['<C-.>'] = { 'snippet_forward', 'fallback' },
    ['<C-,>'] = { 'snippet_backward', 'fallback' },
}

-- 自动给出函数签名提示
opts.signature = {
    enabled = true,
}

-- neovim 命令行模式自动补全
opts.cmdline = {
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
        -- ['<Tab>'] = false,

        ['<Tab>'] = { 'accept', 'fallback' },
    },
}

-- 配置 luasnip 为默认代码片段补全引擎
opts.snippets = { preset = 'luasnip' }

-- 提高自定义 snippet 的权重
opts.sources = {
    -- 默认补全源
    default = { 'lsp', 'snippets', 'path', 'buffer' },
    -- 配置 snippets 的权重
    providers = {
        snippets = {
            -- 控制 snippet 的优先级
            -- score_offset = 1000,
        },
    },
}

blink_cmp.opts = opts


return M

