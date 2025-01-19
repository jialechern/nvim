-- - settings-code-hint-by-color.lua

-- 配置代码高亮
require('nvim-treesitter.configs').setup ({
    ensure_installed = { 
        "bash",
        "python",
        "javascript",
        "lua",
        "html",
        "css",
        "c" 
    }, -- 你所需要的语言
    highlight = {
      enable = true,  -- 启用高亮
    },
  })

if vim.fn.has("termguicolors") == 1 then            -- 启用终端色彩
  vim.opt.termguicolors = true
end
   
-- 启用代码提示
vim.g.ycm_global_ycm_extra_conf = '$NVIMCONFIGP/.ycm_extra_conf.py'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

