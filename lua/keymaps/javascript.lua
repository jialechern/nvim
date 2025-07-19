-- javascript.lua

-- 引入自定义工具函数
local map = require('utils.map').map

---------------------------------- 基本映射 ----------------------------------

require('settings.entry-points').entry_points['javascript'] = function () return
'#!/usr/bin/env node'
end

require('settings.functions').functions['javascript'] = function () return
'function ' .. _G.CoLeader .. ' {'              ..
        _G.Next                                 ..
'}'                                             .. '<Esc>F' .. _G.CoLeader .. 's'
end

map('i', '<LEADER>us', '"use strict";', { desc = "设置严格模式" })

map('i', '<LEADER>p', function () return
'console.log();'                                    .. '<Esc>F)i'
end, { expr = true, desc = "打印至终端" })

map('i', '<LEADER>$', function () return
'${ ' .. _G.CoLeader .. ' }' .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "字符串插值" })

---------------------------------- 分支语句 ----------------------------------

local branchs = {}

branchs['if'] = function () return
'if (' .. _G.CoLeader .. ') ' .. _G.Next            .. '<Esc>F' .. _G.CoLeader .. 's'
end

branchs['if-else'] = function () return
'if (' .. _G.CoLeader .. ') {'              .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'} else {'                                  .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'}'                                         .. '<Esc>4k$F' .. _G.CoLeader .. 's'
end

branchs['if-else_if'] = function () return
'if (' .. _G.CoLeader .. ') {'              .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'} else if (' .. _G.Next .. ') {'           .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'}'                                         .. '<Esc>4k$F' .. _G.CoLeader .. 's'
end

branchs['if-else_if-else'] = function () return
'if (' .. _G.CoLeader .. ') {'              .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'} else if (' .. _G.Next .. ') {'           .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'} else {'                                  .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'}'                                         .. '<Esc>6k$F' .. _G.CoLeader .. 's'
end

branchs['switch'] = function () return
'switch (' .. _G.CoLeader .. ') {'              .. '<CR>' ..
    'case ' .. _G.Next .. ' :'                  .. '<CR>' ..
            _G.Next                             .. '<CR><BS>' ..
            'break;'                            .. '<CR>' ..
    'default:'                                  .. '<CR>' ..
            _G.Next                             .. '<CR><BS>' ..
            'break;'                            .. '<CR>' ..
'}'                                             .. '<Esc>7k$F' .. _G.CoLeader .. 's'
end

require('settings.branchs').branchs['javascript'] = branchs

---------------------------------- 循环语句 ----------------------------------

-- begin while 循环
vim.api.nvim_set_keymap('i', '<LEADER>while', 
        'while () {'                                .. '<CR>' ..
                _G.Next                             .. '<CR>' ..
        '}'                                         .. '<Esc>2k$2hi'
, { noremap = true , silent = true })
-- end while 循环

-- begin do-while 循环
vim.api.nvim_set_keymap('i', '<LEADER>dowhile', 
        'do {'                                      .. '<CR>' ..
        '} while ();'                               .. '<Esc>F(a'
, { noremap = true , silent = true })
-- end do-while 循环

-- begin loop 循环
vim.api.nvim_set_keymap('i', '<LEADER>loop', 
    'while (true) {'                                .. '<CR>' ..
    '}'                                             .. '<Esc>O'
, { noremap = true , silent = true })
-- end loop 循环

-- begin for 循环
vim.api.nvim_set_keymap('i', '<LEADER>for', 
        'for () {'                                  .. '<CR>' ..
                _G.Next                             .. '<CR>' ..
        '}'                                         .. '<Esc>2k$2hi'
, { noremap = true , silent = true })
-- end for 循环

