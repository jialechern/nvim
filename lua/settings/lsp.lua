-- lsp.lua
-- 这里是 LSP 相关的配置

vim.lsp.enable 'lua_ls'

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        -- 导入自定义工具函数
        local map = require('utils.map').map

        -- 获取当前缓冲区的 LSP 客户端
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- 设置 LSP 相关的快捷键
        map('n', 'gd', vim.lsp.buf.definition,    { desc = "跳转到定义", })
        map('n', 'gD', vim.lsp.buf.declaration,   { desc = "跳转到声明", })
        map('n', 'gr', vim.lsp.buf.references,    { desc = "查找引用", })
        map('n', 'gi', vim.lsp.buf.implementation,{ desc = "跳转到实现", })
        map('n', '<LEADER>?',  vim.lsp.buf.hover,         { desc = "悬停文档", })
        map('n', '<LEADER>rn', vim.lsp.buf.rename,       { desc = "重命名符号", })
        map('n', '<LEADER>ca', vim.lsp.buf.code_action,  { desc = "代码操作", })
        map('n', '[d', vim.diagnostic.goto_prev,         { desc = "上一个诊断", })

        map('n', '<LEADER>ld', function()
            vim.diagnostic.open_float { source = true }
        end,            { buffer = event.buf, desc = "使用新窗口打开诊断信息(Long Documents)", })

        map('n', ']d', vim.diagnostic.goto_next,         { desc = "下一个诊断", })
        map('n', '<LEADER>q', vim.diagnostic.setloclist, { desc = "推送诊断到列表", })

        -- 启用诊断信息
        vim.diagnostic.config {
            virtual_text = {
                prefix = '', -- 使用图标作为前缀
                spacing = 4,  -- 前缀和文本之间的间距
            },
            signs = true, -- 启用诊断标志
            underline = true, -- 启用下划线
--             update_in_insert = false, -- 在插入模式下不更新诊断信息
        }

        map('n', '<LEADER>td', (function()
            -- 1 打开 0 关闭
            local diag_status = 1
            return function()
                if diag_status == 1 then
                    diag_status = 0
                    vim.diagnostic.config {
                        virtual_text = false, -- 关闭虚拟文本
                        signs = false,        -- 关闭诊断标志
                        underline = false,    -- 关闭下划线
                        -- update_in_insert = false, -- 在插入模式下不更新诊断信息
                    }
                else
                    diag_status = 1
                    vim.diagnostic.config {
                        virtual_text = {
                            prefix = '', -- 使用图标作为前缀
                            spacing = 4,  -- 前缀和文本之间的间距
                        },
                        signs = true, -- 启用诊断标志
                        underline = true, -- 启用下划线
                        -- update_in_insert = false, -- 在插入模式下不更新诊断信息
                    }
                end
            end
        end)(), { buffer = event.buf, desc = "开/关 诊断信息", })

        -- 配置代码折叠
        if client and client:supports_method 'textDocument/foldingRange' then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('n', '<LEADER>th', function()
                vim.lsp.inlay_hint.enable( not vim.lsp.inlay_hint.is_enabled() { buffnr = event.buf } )
            end, { buffer = event.buf, desc = "开/关 参数提示", })
        end

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd(
                { 'CursorHold','CursorHoldI' },
                {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.document_highlight,
                }
            )

            vim.api.nvim_create_autocmd(
                { 'CursorMoved', 'CursorMoved' },
                {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.clear_references
                }
            )
        end

        -- 当 lsp 断开连接时，清除高亮
        vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = false }),
            callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { 
                    group = 'kickstart-lsp-highlight',
                    buffer = event2.buf,
                }
            end,
        })

    end,
})

