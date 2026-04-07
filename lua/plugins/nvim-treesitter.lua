local M = {}

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
    'haskell',
    'scheme',
}

local parsers = filetypes

function M.setup()
    vim.cmd.packadd('nvim-treesitter')

    -- 让插件本体初始化
    local ok, ts = pcall(require, 'nvim-treesitter')
    if ok and ts.setup then
        ts.setup({})
    end


    -- 让 parser 安装到 Neovim 自己的数据目录里
    ts.setup({
        install_dir = vim.fn.stdpath('data') .. '/site',
    })

    -- 自动安装缺失 parser
    ts.install(parsers)

    -- -- 如果希望第一次启动就等安装完成, 再把上面一行改成
    -- ts.install(parsers):wait(300000)

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
end

return M
