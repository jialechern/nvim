-- markdown.lua

-- 引入自定义工具函数
local map = require('utils.map').map

--------------------------------- 基本映射 ---------------------------------

-- 字体控制
map('i', _G.CoLeader .. 'b', function () return
'**' .. _G.CoLeader .. '**'     .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "加粗字体" })

map('i', _G.CoLeader .. 'd', function () return
'~~' .. _G.CoLeader .. '~~'     .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "删除线" })

map('i', _G.CoLeader .. 's', function () return
'__' .. _G.CoLeader .. '__'     .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "斜体字体" })

map('i', _G.CoLeader .. 'S', function () return
'***' .. _G.CoLeader .. '***'     .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "加粗斜体字体" })

-- 文本控制
map('i', _G.CoLeader .. 'n', function () return
'<CR><br><CR>'
end, { expr = true, desc = "换行" })

map('i', _G.CoLeader .. 'p', function () return
'<p><CR></p><CR>' .. _G.Next .. '<Esc>kO'
end, { expr = true, desc = "段落" })

map('i', _G.CoLeader .. 'r', function () return
'<Esc>mcI> <Esc>`c2la'
end, { expr = true, desc = "引用" })

map('i', _G.CoLeader .. 'link', function () return
'[' .. _G.CoLeader .. '](' .. _G.Next .. ')'    .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "链接1" })

map('i', _G.CoLeader .. '@', function () return
'<' .. _G.CoLeader ..'>' .. _G.Next             .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "链接2" })

map('i', _G.CoLeader .. 'img', function () return
'![' .. _G.CoLeader .. '](' .. _G.Next .. ')'   .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "图片" })

map('i', _G.CoLeader .. 'll', function () return
'----------------<CR>'
end, { expr = true, desc = "页面分隔线" })

-- 标题
map('i', _G.CoLeader .. '1', function () return
'# '
end, { expr = true, desc = "一级标题" })

map('i', _G.CoLeader .. '2', function () return
'## '
end, { expr = true, desc = "二级标题" })

map('i', _G.CoLeader .. '3', function () return
'### '
end, { expr = true, desc = "三级标题" })

map('i', _G.CoLeader .. '4', function () return
'#### '
end, { expr = true, desc = "四级标题" })

-- 代码块
map('i', _G.CoLeader .. 'c', function () return
'``' .. _G.Next .. '<Esc>F`i'
end, { expr = true, desc = "行内代码块" })

map('i', _G.CoLeader .. 'C', function () return
'```'                                       .. '<CR>' ..
'```'                                       .. '<Esc>kA'
end, { expr = true, desc = "行间代码块" })

