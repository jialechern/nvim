-- makefile.lua

-- 引入自定义工具函数
local map = require('utils.map').map

---------------------------------- 分支语句 ----------------------------------

map('i', '<LEADER>ifeq', function () return
'ifeq (' .. _G.CoLeader .. ', ' .. _G.Next .. ')'   .. '<CR>' ..
        _G.Next                                     .. '<CR>' ..
'endif'                                             .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end, { expr = true, desc = "特殊分支语句, 用于判断是否相等" })

map('i', '<LEADER>ifneq', function () return
'ifneq (' .. _G.CoLeader .. ', ' .. _G.Next .. ')'  .. '<CR>' ..
        _G.Next                                     .. '<CR>' ..
'endif'                                             .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end, { expr = true, desc = "特殊分支语句, 用于判断是否不相等" })

map('i', '<LEADER>eifeq', function () return
'ifeq (' .. _G.CoLeader .. ', ' .. _G.Next .. ')'   .. '<CR>' ..
        _G.Next                                     .. '<CR>' ..
'else'                                              .. '<CR>' ..
        _G.Next                                     .. '<CR>' ..
'endif'                                             .. '<Esc>4k0f' .. _G.CoLeader .. 's'
end, { expr = true, desc = "特殊分支语句, 用于判断是否不相等" })

map('i', '<LEADER>eifneq', function () return
'ifneq (' .. _G.CoLeader .. ', ' .. _G.Next .. ')'  .. '<CR>' ..
        _G.Next                                     .. '<CR>' ..
'else'                                              .. '<CR>' ..
        _G.Next                                     .. '<CR>' ..
'endif'                                             .. '<Esc>4k0f' .. _G.CoLeader .. 's'
end, { expr = true, desc = "特殊分支语句, 用于判断是否不相等" })

map('i', '<LEADER>ifdef', function () return
'ifdef '                                        .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'endif'                                         .. '<Esc>2kA'
end, { expr = true, desc = "特殊分支语句, 用于判断某个变量是否定义" })

map('i', '<LEADER>eifdef', function () return
'ifdef '                                        .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'else'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'endif'                                         .. '<Esc>4kA'
end, { expr = true, desc = "特殊分支语句, 用于判断某个变量是否定义" })

map('i', '<LEADER>ifndef', function () return
'ifndef '                                       .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'endif'                                         .. '<Esc>2kA'
end, { expr = true, desc = "特殊分支语句, 用于判断某个变量是否未定义" })

map('i', '<LEADER>eifndef', function () return
'ifndef '                                       .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'else'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'endif'                                         .. '<Esc>4kA'
end, { expr = true, desc = "特殊分支语句, 用于判断某个变量是否未定义" })

