-- luasnip.lua

return {
    'L3MON4D3/LuaSnip',
    -- 使用 v2 后的最新版本
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
    config = function()
        -- 基本引入
        local luasnip = require('luasnip')
        local types   = require('luasnip.util.types')

        -- 可视化提示(可选)
        -- 在插入模式下, 给当前可跳转的 snippet 占位符加上下划线
        luasnip.config.set_config({
            history = true,              -- 允许跳出后再跳回
            updateevents = 'TextChanged,TextChangedI',
            enable_autosnippets = true,  -- 启用自动触发类型 snippet
            ext_opts = {
                [types.choiceNode] = {
                    active = { virt_text = { { '●', 'Comment' } } },
                },
                [types.insertNode] = {
                    active = { virt_text = { { '●', 'Comment' } } },
                },
            },
        })

        -- 加载 VSCode 社区 snippets
        require('luasnip.loaders.from_vscode').lazy_load()

        -- 加载 LuaSnip 自定义 snippets
        require("luasnip.loaders.from_lua").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
        })

        -- 你也可以指定路径
        -- require("luasnip.loaders.from_vscode").lazy_load({
        --      paths = { "./my-snippets" },
        -- })

        -- 配置按键: 展开、跳转、回跳
        local map = vim.keymap.set
        map({ 'i', 's' }, '<C-l>', function()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-l>', true, false, true), 'n', true)
            end
        end, { silent = true, desc = "LuaSnip Expand or Jump" })

        map({ 'i', 's' }, '<A-l>', function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { silent = true, desc = "LuaSnip Jump Back" })

        -- 选择节点内的选项(choiceNode)时用 <C-E> 切换
        map('i', '<C-\\>', function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end, { silent = true, desc = "LuaSnip Change Choice" })

      -- 可选: 清理历史, 以免内存占用过大
        vim.cmd([[autocmd InsertLeave * silent! lua require("luasnip").cleanup()]])
    end,
}
