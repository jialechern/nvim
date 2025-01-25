-- keymaps.lua

-- 导入基本快捷键设置
-- vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-base.vim')        
vim.cmd('source $NVIMCONFIGP/lua/keymaps/kemaps-base.lua')        

-- 设置注释
vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-for-code-comment.lua')

-- 设置成对符号的自动配对
-- vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-symbols.vim')
vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-symbols.lua')

-- 设置代码折叠快捷键
vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-for-code-fold.lua')

-- 设置自动根据文件名导入对应的键盘映射
vim.cmd('source $NVIMCONFIGP/lua/keymaps/kemaps-auto-load-by-filetype.lua')

