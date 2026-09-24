vim.cmd.packadd('vim-easy-align')

local map = require('utils.map').map
local keys = require('keys.align')

-- Visual 模式: 选中文本后, 直接对齐
map(keys.visual, '<Plug>(EasyAlign)')

-- Normal 模式: 配合 motion 对齐
map(keys.motion, '<Plug>(EasyAlign)')
