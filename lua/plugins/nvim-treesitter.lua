local filetypes = {
    'bash',
    'c',
    'cpp',
    'css',
    'go',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'nix',
    'python',
    'rust',
    'toml',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
    'zsh',
    'typst',
    'latex',
    'haskell',
    'scheme',
}

vim.cmd.packadd('nvim-treesitter')

-- 让插件本体初始化
local ok, ts = pcall(require, 'nvim-treesitter')
if ok and ts.setup then
    ts.setup({})
end


-- parser(grammar)与 queries 由 nix 提供(参见 plugins.lua 的对照表),
-- 因此不再运行时下载/编译: 原先的 install_dir + ts.install(parsers) 已移除

local group = vim.api.nvim_create_augroup('UserTreesitter', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = filetypes,
    callback = function()
        -- 语法高亮: 由 Neovim 自己启动 treesitter
        vim.treesitter.start()

        -- 缩进: 交给 nvim-treesitter
        vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        -- 折叠: 交给 Neovim 的 treesitter foldexpr
        vim.opt_local.foldmethod = 'expr'
        vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.opt_local.foldenable = false
    end,
})
