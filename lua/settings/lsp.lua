-- lsp.lua

local module = {}

-- LSP 名称映射表
-- key 只是内部分类用, value 才是实际启用的 LSP config 名称
local require_lsps = {
    lua = { 'lua_ls', 'lua-language-server' },
    rust = { 'rust_analyzer', 'rust-analyzer' },
    python = { 'pyright', 'pyright' },
    typst = { 'tinymist', 'tinymist' },
    tex = { 'texlab', 'texlab' },
    c = { 'clangd', 'clangd' },
    cpp = { 'clangd', 'clangd' },
    typescript = { 'ts_ls', 'typescript-language-server' },
    javascript = { 'ts_ls', 'typescript-language-server' },
    markdown = { 'marksman', 'marksman' },
    toml = { 'taplo', 'taplo' },
    nix = { 'nixd', 'nixd' },
    haskell = { 'hls', 'haskell-language-server-wrapper' },
}

-- 导出, 方便别的模块复用
module.require_lsps = require_lsps

-- 把 { a = { 'x', ... }, b = { 'y', ... } } 转成 { 'x', 'y', ... }
local function get_configs(t)
    local arr = {}
    for _, v in pairs(t) do
        arr[#arr + 1] = v[1]
    end
    return arr
end

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
        -- 导入自定义工具函数与需要的符号
        local map = require('utils.map').map
        local get_key = require('settings.variables.lsp').get_key
        local lsp_leader = require('settings.variables.lsp').lsp_leader

        -- 当前 buffer
        local bufnr = event.buf

        -- 当前缓冲区绑定的 LSP 客户端
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- 统一封装 buffer-local 映射
        local function bufmap(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = bufnr,
                silent = true,
                desc = desc,
            })
        end

        -- --- --- --- LSP 核心功能 --- --- ---
        bufmap('n', get_key('format'), function()
            -- 手动格式化
            vim.lsp.buf.format({ async = true })
            vim.notify('代码已格式化', vim.log.levels.INFO, { title = 'LSP' })
        end, '手动触发格式化')

        bufmap('n', get_key('goto-def'), vim.lsp.buf.definition, '跳转到定义')
        bufmap('n', get_key('goto-dec'), vim.lsp.buf.declaration, '跳转到声明')
        bufmap('n', get_key('goto-ref'), vim.lsp.buf.references, '查找引用')
        bufmap('n', get_key('goto-impl'), vim.lsp.buf.implementation, '跳转到实现')
        bufmap('n', get_key('show-doc'), vim.lsp.buf.hover, '悬停文档')
        bufmap('n', get_key('rename'), vim.lsp.buf.rename, '重命名符号')
        bufmap('n', get_key('code-action'), vim.lsp.buf.code_action, '代码操作')

        -- 诊断跳转
        bufmap('n', get_key('goto-next-diag'), vim.diagnostic.goto_next, '下一个诊断')
        bufmap('n', get_key('goto-prev-diag'), vim.diagnostic.goto_prev, '上一个诊断')

        -- 打开诊断浮窗: 0.12 里浮窗会显示更完整的诊断相关信息
        bufmap('n', get_key('doc-in-new-window'), function()
            vim.diagnostic.open_float({
                source = true,   -- 显示来源
                border = 'rounded',
            })
        end, '使用新窗口打开诊断信息(Long Documents)')

        -- 推送当前 buffer 诊断到 location list
        bufmap('n', get_key('setloclist'), vim.diagnostic.setloclist, '推送诊断到列表')

        -- --- --- --- 诊断开关 --- --- ---
        -- 使用官方诊断开关，而不是反复改 config
        local diagnostics_enabled = true
        bufmap('n', get_key('doc'), function()
            diagnostics_enabled = not diagnostics_enabled
            vim.diagnostic.enable(diagnostics_enabled)
            if diagnostics_enabled then
                vim.notify('诊断信息已开启', vim.log.levels.INFO, { title = 'LSP' })
            else
                vim.notify('诊断信息已关闭', vim.log.levels.INFO, { title = 'LSP' })
            end
        end, '开/关 诊断信息')

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
            bufmap('n', get_key('type-hint'), function()
                local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
                vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
            end, '开/关 参数提示')
        end

        -- --- --- --- LSP 帮助 --- --- ---
        bufmap('n', get_key('help'), function()
            local help_text = [[
LSP 快捷键帮助手册:
    %s : 跳转到定义
    %s : 跳转到声明
    %s : 查找引用
    %s : 跳转到实现
    %s : 悬停文档
    %s : 重命名符号
    %s : 代码操作
    %s : 下一个诊断
    %s : 上一个诊断
    %s : 使用新窗口打开诊断信息(Long Documents)
    %s : 推送诊断到列表
    %s : 开/关 参数提示
    %s : 开/关 诊断信息
    %s : 打开补全菜单
    %s : 关闭补全菜单
            ]]
            vim.notify(help_text:format(
                get_key('goto-def'),
                get_key('goto-dec'),
                get_key('goto-ref'),
                get_key('goto-impl'),
                get_key('show-doc'),
                get_key('rename'),
                get_key('code-action'),
                get_key('goto-next-diag'),
                get_key('goto-prev-diag'),
                get_key('doc-in-new-window'),
                get_key('setloclist'),
                get_key('type-hint'),
                get_key('doc'),
                get_key('open-hint'),
                get_key('close-hint')
            ), vim.log.levels.INFO, { title = lsp_leader .. ' LSP 帮助' })
        end, 'LSP 帮助')

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

-- 启用你列出的 LSP 配置
-- 0.12 推荐用 vim.lsp.enable() 统一管理启用/停用
if vim.fn.has('nvim-0.11') == 1 then
    vim.lsp.enable(get_configs(require_lsps))
end

return module
