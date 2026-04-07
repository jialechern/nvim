---@brief
---
--- guile-lsp-server LSP 配置
--- 文档: https://codeberg.org/rgherdt/scheme-lsp-server
---
--- 用法示例:
--- ```lua
--- vim.lsp.config('guile_ls', {
---   settings = {
---     guile = {
---       ['log-level'] = 'error',
---     }
---   }
--- })
--- ```

--- --- --- --- 工具函数 --- --- ---

--- 判断 guile-lsp-server 是否可用
local function find_server()
    local server = vim.fn.trim(vim.fn.system 'which guile-lsp-server 2>/dev/null')
    if server == '' then
        vim.notify(
            '[guile_ls] guile-lsp-server 未找到\n'
            .. '请在 NixOS 上安装: environment.systemPackages = [ pkgs.guile-lsp-server ]',
            vim.log.levels.ERROR
        )
        return nil
    end
    return server
end

--- 解析 Guile 项目的 root_dir
--- 优先级: .guile → guix.scm → .git → 文件所在目录
local function find_root(fname)
    return vim.fs.root(fname, { '.guile', 'guix.scm', '.git' })
        or vim.fs.dirname(fname)
end

--- --- --- --- guile-lsp-server 可执行文件解析 --- --- ---

local server = find_server()
if server == nil then
    return
end

--- --- --- --- LSP 配置主体 --- --- ---

return {
    cmd       = { server },
    filetypes = { 'scheme' },

    root_dir  = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        on_dir(find_root(fname))
    end,

    settings  = {
        guile = {
            --- 可选: 'error' | 'warning' | 'info' | 'debug'
            ['log-level'] = 'error',
        },
    },

    on_attach = function(_, bufnr)
        --- .scm 文件有时会被 Neovim 识别为 query 而非 scheme
        --- 强制修正 filetype
        local ft = vim.bo[bufnr].filetype
        if ft ~= 'scheme' and ft ~= 'guile' then
            vim.bo[bufnr].filetype = 'scheme'
        end
    end,
}
