-- lsp.lua

local module = {}

-- 诊断默认配置: 只设置一次, 不要每次 attach 都重复设置
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
    callback = function(event)
        -- 映射统一走 utils.map, 键位与描述见 keys/lsp.lua
        local map = require('utils.map').map
        local keys = require('keys.lsp')

        -- 当前 buffer 与 attach 的 LSP 客户端
        local bufnr = event.buf
        local client = vim.lsp.get_client_by_id(event.data.client_id)
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

        -- 诊断跳转
        map(keys.goto_next_diag, vim.diagnostic.goto_next, opts)
        map(keys.goto_prev_diag, vim.diagnostic.goto_prev, opts)

        -- 打开诊断浮窗: 0.12 里浮窗会显示更完整的诊断相关信息
        map(keys.doc_in_new_window, function()
            vim.diagnostic.open_float({
                source = true,   -- 显示来源
                border = 'rounded',
            })
        end, opts)

        -- 推送当前 buffer 诊断到 location list
        map(keys.setloclist, vim.diagnostic.setloclist, opts)

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