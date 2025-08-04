-- keymaps.lua

-- 导入基本快捷键设置
require('keymaps.base')

-- 设置成对符号的自动配对
require('keymaps.symbols')

-- 设置代码折叠快捷键
require('keymaps.code-fold')

-- 设置分屏相关的快捷键
require('keymaps.windows')

-- 缓冲区操作快捷键
require('keymaps.buffers')

-- 设置标签页操作快捷键
require('keymaps.tabs')

-- 设置自动根据文件名导入对应的键盘映射
require('keymaps.autoload-by-filetype')

