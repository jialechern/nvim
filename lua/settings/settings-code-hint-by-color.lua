-- - settings-code-hint-by-color.lua

if vim.fn.has("termguicolors") == 1 then            -- 启用终端色彩
  vim.opt.termguicolors = true
end
   
-- 启用代码提示
vim.g.ycm_global_ycm_extra_conf = vim.fn.stdpath("config") .. '/.ycm_extra_conf.py'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

