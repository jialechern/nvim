return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
          require('nvim-treesitter.configs').setup {
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

        if vim.fn.has("termguicolors") == 1 then            -- 启用终端色彩
            vim.opt.termguicolors = true
        end
   
        vim.g.ycm_global_ycm_extra_conf = vim.fn.stdpath("config") .. '/.ycm_extra_conf.py'
        vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
        end
      }
}
