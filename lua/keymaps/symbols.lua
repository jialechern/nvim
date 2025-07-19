-- symbols.lua
-- 这是一个存放一些基本符号的快捷键的文件

-- 导入自定义工具函数
local map = require('utils.map').map

-- 小括号匹配
map('i', '<LEADER>(', function () return
'(' .. _G.CoLeader .. ')' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的小括号' })

map('i', '<LEADER><LEADER>(', function () return
'( ' .. _G.CoLeader .. ' )' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的宽松小括号' })

map('i', _G.CoLeader .. '(', function () return
'((' .. _G.CoLeader .. '))' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的双小括号' })

map('i', _G.CoLeader .. _G.CoLeader .. '(', function () return
'(( ' .. _G.CoLeader .. ' ))' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的宽松双小括号' })

-- 中括号匹配
map('i', '<LEADER>[', function () return
'[' .. _G.CoLeader .. ']' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的中括号' })

map('i', '<LEADER><LEADER>[', function () return
'[ ' .. _G.CoLeader .. ' ]' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的宽松中括号' })

map('i', _G.CoLeader .. '[', function () return
'[[' .. _G.CoLeader .. ']]' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的双中括号' })

map('i', _G.CoLeader .. _G.CoLeader .. '[', function () return
'[[ ' .. _G.CoLeader .. ' ]]' .. _G.Next .. '<Esc>F' ..  _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的宽松双中括号' })

-- 大括号匹配
map('i', '<LEADER>{', function () return
'{' .. _G.CoLeader .. '}' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的大括号' })

map('i', '<LEADER><LEADER>{', function () return
'{ ' .. _G.CoLeader .. ' }' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的宽松大括号' })

map('i', _G.CoLeader .. '{', function () return
'{{' .. _G.CoLeader .. '}}' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的双大括号' })

map('i', _G.CoLeader .. _G.CoLeader .. '{', function () return
'{{ ' .. _G.CoLeader .. ' }}' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的宽松双大括号' })

-- 尖括号匹配
map('i', '<LEADER><', function () return
'<' .. _G.CoLeader .. '>' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的尖括号' })

map('i', '<LEADER><LEADER><', function () return
'< ' .. _G.CoLeader .. ' >' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的宽松尖括号' })

map('i', _G.CoLeader .. '<', function () return
'<<' .. _G.CoLeader .. '>>' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的双尖括号' })

map('i', _G.CoLeader .. _G.CoLeader .. '<', function () return
'<< ' .. _G.CoLeader .. ' >>' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的宽松双尖括号' })

-- 单引号匹配
map('i', "<LEADER>'", function () return
"'" .. _G.CoLeader .. "'" .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的单引号' })

map('i', "<LEADER><LEADER>'", function () return
"' " .. _G.CoLeader .. " '" .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的宽松单引号' })

-- 双引号匹配
map('i', '<LEADER>"', function () return
'"' .. _G.CoLeader .. '"' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的双引号' })

map('i', '<LEADER><LEADER>"', function () return
'" ' .. _G.CoLeader .. ' "' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = '插入成对的宽松双引号' })


