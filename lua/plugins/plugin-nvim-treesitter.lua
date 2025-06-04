return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
          require'nvim-treesitter.configs'.setup {
                ensure_installed = { 
                    "bash",
                    "python",
                    "javascript",
                    "typescript",
                    "rust", 
                    "lua",
                    "html",
                    "css",
                    "c", 
                    "haskell", 
                    "typst", 
                }, -- 你所需要的语言
            highlight = {
              enable = true,  -- 启用高亮
            },
          }
        end
      }
}
