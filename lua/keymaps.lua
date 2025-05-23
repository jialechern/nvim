-- keymaps.lua

-- 导入基本快捷键设置
_G.LoadNvimConfigFile("/lua/keymaps/keymaps-base.lua")

-- 设置注释
_G.LoadNvimConfigFile("/lua/keymaps/keymaps-for-code-comment.lua")

-- 设置成对符号的自动配对
_G.LoadNvimConfigFile("/lua/keymaps/keymaps-symbols.lua")

-- 设置代码折叠快捷键
_G.LoadNvimConfigFile("/lua/keymaps/keymaps-for-code-fold.lua")

-- 设置自动根据文件名导入对应的键盘映射
_G.LoadNvimConfigFile("/lua/keymaps/keymaps-auto-load-by-filetype.lua")

