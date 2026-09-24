-- lsp.lua

---@class Settings.Lsp
---@type Settings.Lsp
local module = {}

-- 诊断默认配置: 只设置一次, 不要每次 attach 都重复设置(与默认值相同的项不写)
local function setup_diagnostics()
    vim.diagnostic.config({
        virtual_text = {
            prefix = '', -- 诊断前缀图标
            spacing = 4,  -- 图标与文字间距
        },
        signs = true,         -- 左侧符号栏显示诊断标记
        underline = true,     -- 用下划线标出问题位置
        update_in_insert = false, -- 插入模式下不刷诊断，减少干扰
        float = {
            border = 'rounded', -- 诊断浮窗圆角边框
        },
    })
end

setup_diagnostics()

-- LSP Attach: 只在真正 attach 到 buffer 后, 再设置 buffer-local 的快捷键和行为
local lsp_group = vim.api.nvim_create_augroup('lsp-attach', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
    group = lsp_group,
    ---@param event vim.api.keyset.create_autocmd.callback_args
    callback = function(event)
        -- 映射统一走 utils.map, 键位与描述见 keys/lsp.lua
        local map = require('utils.map').map
        local keys = require('keys.lsp')

        -- 当前 buffer 与 attach 的 LSP 客户端
        local bufnr = event.buf
        ---@type vim.lsp.Client?
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        ---@type MapOpts
        local opts = { buffer = bufnr }

        -- --- --- --- LSP 核心功能 --- --- ---
        map(keys.format, function()
            -- 手动格式化
            vim.lsp.buf.format({ async = true })
            vim.notify('代码已格式化', vim.log.levels.INFO, { title = 'LSP' })
        end, opts)

        map(keys.goto_def, vim.lsp.buf.definition, opts)
        map(keys.goto_dec, vim.lsp.buf.declaration, opts)
        map(keys.goto_ref, vim.lsp.buf.references, opts)
        map(keys.goto_impl, vim.lsp.buf.implementation, opts)
        map(keys.show_doc, vim.lsp.buf.hover, opts)
        map(keys.rename, vim.lsp.buf.rename, opts)
        map(keys.code_action, vim.lsp.buf.code_action, opts)

        -- 诊断跳转: 0.11 起 goto_next/goto_prev 已废弃(0.13 移除), 用 jump 的 count 方向
        map(keys.goto_next_diag, function()
            vim.diagnostic.jump({ count = 1 })
        end, opts)
        map(keys.goto_prev_diag, function()
            vim.diagnostic.jump({ count = -1 })
        end, opts)

        -- 打开诊断浮窗: 0.12 里浮窗会显示更完整的诊断相关信息
        map(keys.doc_in_new_window, function()
            vim.diagnostic.open_float({
                source = true,   -- 显示来源
                border = 'rounded',
            })
        end, opts)

        -- 推送当前 buffer 诊断到 location list
        map(keys.setloclist, vim.diagnostic.setloclist, opts)

        -- --- --- --- 原生补全(取代 blink.cmp) --- --- ---
        -- Neovim 0.12 内置: 由 LSP 提供候选, <C-y> 确认, <C-e> 取消菜单;
        -- 接受候选时会自动展开片段(LSP snippet 语法)并应用 text edits(例如补 import)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            -- autotrigger 默认只在服务器声明的触发字符(如 Python 的 . [ " ')上弹菜单, 敲普通字母不弹。
            -- 这里把字母/数字/下划线也加进触发字符, 使边打边弹(≈ blink.cmp 的逐键触发);
            -- 必须在 enable() 之前修改 —— 它会在这时读取 triggerCharacters 建触发表
            ---@type lsp.CompletionOptions?
            local provider = client.server_capabilities.completionProvider
            if provider then
                ---@type string[]
                local triggers = provider.triggerCharacters or {}
                ---@type table<string, boolean>
                local existing = {}
                for _, ch in ipairs(triggers) do
                    existing[ch] = true
                end
                for ch in ('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_'):gmatch('.') do
                    if not existing[ch] then
                        triggers[#triggers + 1] = ch
                    end
                end
                provider.triggerCharacters = triggers
            end

            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
            map(keys.open_hint, vim.lsp.completion.get, { buffer = bufnr, modes = 'i' })
            map(keys.close_hint, '<C-e>', { buffer = bufnr, modes = 'i' })
        end

        -- --- --- --- 诊断开关 --- --- ---
        -- 使用官方诊断开关，而不是反复改 config
        local diagnostics_enabled = true
        map(keys.doc, function()
            diagnostics_enabled = not diagnostics_enabled
            vim.diagnostic.enable(diagnostics_enabled)
            if diagnostics_enabled then
                vim.notify('诊断信息已开启', vim.log.levels.INFO, { title = 'LSP' })
            else
                vim.notify('诊断信息已关闭', vim.log.levels.INFO, { title = 'LSP' })
            end
        end, opts)

        -- --- --- --- 折叠 --- --- ---
        -- 如果 LSP 支持 foldingRange, 就优先用 LSP 折叠
        -- 否则可以继续由 treesitter 或别的方式接管
        if client and client:supports_method('textDocument/foldingRange') then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win].foldmethod = 'expr'
            vim.wo[win].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end

        -- --- --- --- 参数提示(inlay hints) --- --- ---
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map(keys.type_hint, function()
                local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
                vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
            end, opts)
        end

        -- --- --- --- 文档高亮 --- --- ---
        -- 0.12 的 LspAttach 很适合做这种 buffer-local 行为
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_group = vim.api.nvim_create_augroup('lsp-highlight-' .. bufnr, { clear = true })

            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = bufnr,
                group = highlight_group,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = bufnr,
                group = highlight_group,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                buffer = bufnr,
                group = highlight_group,
                ---@param ev vim.api.keyset.create_autocmd.callback_args
                callback = function(ev)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({
                        group = highlight_group,
                        buffer = ev.buf,
                    })
                end,
            })
        end
    end,
})

return module
