-- - settings.lua
-- 基础配置
vim.cmd('source $NVIMCONFIGP/lua/settings/settings-base.lua')

-- 配置代码提示和代码高亮
vim.cmd('source $NVIMCONFIGP/lua/settings/settings-code-hint-by-color.lua')

-- 设置根据文件扩展名配置文件类型
vim.cmd('source $NVIMCONFIGP/lua/settings/settings-auto-filetype-by-fileext.lua')

