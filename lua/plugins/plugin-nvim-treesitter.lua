return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
          require'nvim-treesitter.configs'.setup {
            highlight = {
              enable = true,  -- 启用高亮
            },
          }
        end
      }
}