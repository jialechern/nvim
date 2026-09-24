--- code_fold.lua
--- 代码折叠相关映射 (键位与描述见 lua/keys/code_fold.lua)

local map = require('utils.map').map
local keys = require('keys.code_fold')

map(keys.close, 'zc')
map(keys.open, 'zo')
map(keys.delete, 'zd')
map(keys.fold, 'zf')
map(keys.expand_all, 'zR')
map(keys.close_all, 'zM')
