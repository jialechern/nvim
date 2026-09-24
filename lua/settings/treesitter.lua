--- treesitter.lua
--- Neovim 0.12+ 的原生 treesitter 能力, 不依赖 nvim-treesitter 插件:
---   高亮      vim.treesitter.start()
---   折叠      vim.treesitter.foldexpr()(没有 folds.scm 的语言自动退化为不折叠)
---   增量选择  Visual 模式内置命令 an / in / [n / ]n / [N / ]N(见 :h v_an)
--- parser(grammar)由 nix 的 grammar 包提供(pack/hm/start/nvim-treesitter-grammars, 只有 parser);
--- queries 来自 ~/.local/share/nvim/site/queries(旧 ts.install 遗留, 不随 nix 更新, 不要清理)
--- 与 Neovim 自带(c / lua / markdown / markdown_inline / query / vim / vimdoc)。
--- 缩进: 0.12 原生没有 treesitter 缩进, 交给 $VIMRUNTIME/indent/<ft>.vim
--- (base.lua 已 `filetype plugin indent on`; nix / toml / haskell 没有缩进脚本, c/cpp 走内置 cindent)。
--- 注意: FileType 自动命令的 pattern 不按点拆分子类型, 所以 scheme.guile 要显式列出
--- (与 ftplugin 的规则不同); tex 的 ft 与 parser 名不同, 用 register 映射到 latex。

-- .tex 的文件类型叫 tex, 而 parser/queries 叫 latex
vim.treesitter.language.register('latex', 'tex')

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
    'tex',
    'haskell',
    'scheme',
    'scheme.guile', -- 带点子类型必须显式列出, pattern 'scheme' 匹配不到它
}

local group = vim.api.nvim_create_augroup('UserTreesitter', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = filetypes,
    callback = function(args)
        local ft = vim.bo[args.buf].filetype
        -- get_lang 会把 scheme.guile 这类带点子类型归到主类型(scheme)
        local lang = vim.treesitter.language.get_lang(ft) or ft
        -- nix 侧缺某个 grammar 时 start() 会 assert 报错, 先探一下再静默跳过
        if not vim.treesitter.language.add(lang) then
            return
        end

        vim.treesitter.start(args.buf, lang)

        vim.opt_local.foldmethod = 'expr'
        vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.opt_local.foldenable = false
    end,
})
