-- code-fold.lua
-- 此处设置代码折叠的快捷键

-- 引入自定义工具函数
local map_by_modes = require('utils.map').map_by_modes
local fold_key = require('settings.variables').fold_key

-- close fold
map_by_modes({ 'n', 'x' }, '<' .. fold_key ..'-c>', 'zc', {  desc = "关闭当前光标所在的代码折叠" })
-- open fold
map_by_modes({ 'n', 'x' }, '<' .. fold_key .. '-o>', 'zo', {  desc = "打开当前光标所在的代码折叠" })
-- delect fold
map_by_modes({ 'n', 'x' }, '<' .. fold_key .. '-d>', 'zd', {  desc = "删除当前光标所在的代码折叠" })
-- fold
map_by_modes({ 'n', 'x' }, '<' .. fold_key .. '-f>', 'zf', {  desc = "折叠当前光标所在的代码" })
-- expansion 展开所有折叠
map_by_modes({ 'n', 'x' }, '<' .. fold_key .. '-e>', 'zR', {  desc = "展开所有折叠" })
-- close all 关闭所有折叠
map_by_modes({ 'n', 'x' }, '<' .. fold_key .. '-a>', 'zM', {  desc = "关闭所有折叠" })

