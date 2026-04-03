local M = {}

function M.setup()
    vim.cmd.packadd('LuaSnip')

    local luasnip = require('luasnip')
    local types = require('luasnip.util.types')
    local map = vim.keymap.set

    -- 基本配置
    luasnip.config.set_config({
        history = true,             -- 允许跳出后再跳回
        updateevents = 'TextChanged,TextChangedI',
        enable_autosnippets = true, -- 启用自动 snippet
        store_selection_keys = '<C-s>', -- 保存选择内容
        ext_opts = {
            [types.choiceNode] = {
                active = { virt_text = { { '●', 'Comment' } } },
            },
            [types.insertNode] = {
                active = { virt_text = { { '●', 'Comment' } } },
            },
        },
    })

    -- undo 处理方式
    local auto_expand = luasnip.auto_expand
    luasnip.auto_expand = function(...)
        vim.o.undolevels = vim.o.undolevels
        auto_expand(...)
    end

    -- 加载自定义 snippets
    require('luasnip.loaders.from_lua').lazy_load({
        paths = { vim.fn.stdpath('config') .. '/snippets' },
    })

    -- 获取快捷键配置
    local get_key = require('settings.variables.lsp').get_key
    -- 按键: 展开、回跳、切换 choice、清除 snippet
    map({ 'i', 'n', 'x', 's', 'v', 'o' }, get_key('snippet_forward'), function()
        if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<A-.>', true, false, true), 'n', true)
        end
    end, { silent = true, desc = 'LuaSnip 展开/跳转' })

    map({ 'i', 'n', 'x', 's', 'v', 'o' }, get_key('snippet_backward'), function()
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        end
    end, { silent = true, desc = 'LuaSnip 向后跳转' })

    map({ 'i', 'n', 'x', 's', 'v', 'o' }, get_key('snippet_choice'), function()
        if luasnip.choice_active() then
            luasnip.change_choice(1)
        end
    end, { silent = true, desc = 'LuaSnip 切换 choice' })

    map({ 'i', 'n', 'x', 's', 'v', 'o' }, get_key('snippet_clear'), function()
        luasnip.unlink_current()
    end, { desc = '清除当前 snippet' })
end

return M
