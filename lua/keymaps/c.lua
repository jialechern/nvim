-- c.lua
-- 用于配置 C 语言的快捷键映射

-- 导入自定义工具函数
local map = require('utils.map').map

-------------------------------- 基本映射 --------------------------------

map('i', '<LEADER>i' .. _G.End, function () return
'#include <' .. _G.CoLeader .. '>' .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "include 导入头文件" })

map('i', '<LEADER>sio' .. _G.End, function () return
'#include <stdio.h>'
end, { expr = true, desc = "导入标准输入输出头文件" })

map('i', '<LEADER>p' .. _G.End, function () return
'printf(' .. _G.CoLeader .. ');' .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "打印函数" })

require('settings.entry-points').entry_points['c'] = function () return
'int main (int argc, char *argv[]) {'               .. '<CR><Esc>0i\t' ..
        'return 0;'                                 .. '<CR><Esc>0i' ..
'}'                                                 .. '<Esc>kO'
end

-------------------------------- 函数定义 ------------------------------

require('settings.functions').functions['c'] = function () return
_G.CoLeader ..  ' ( ' .. _G.Next .. ' ) {'                  ..
        _G.Next                                             ..
'}'                                                         .. '<Esc>F' .. _G.CoLeader .. 's'
end

-------------------------------- 宏命令 --------------------------------

map('i', _G.CoLeader .. 'd' .. _G.End, function () return
'#define '
end, { expr = true, desc = "宏定义" })

map('i', _G.CoLeader .. 'ud' .. _G.End, function () return
'#undef '
end, { expr = true, desc = "注销宏定义" })

map('i', _G.CoLeader .. 'if' .. _G.End, function () return
'#if '                                              .. '<CR>\t' ..
    _G.Next                                         .. '<CR>' ..
'#endif'                                            .. '<Esc>2kA'
end, { expr = true, desc = "宏 if 判断" })

map('i', _G.CoLeader .. 'eif' .. _G.End, function () return
'#if '                                              .. '<CR>\t' ..
    _G.Next                                         .. '<CR>' ..
'#else'                                             .. '<CR>\t' ..
    _G.Next                                         .. '<CR>' ..
'#endif'                                            .. '<Esc>4kA'
end, { expr = true, desc = "宏 if-else 判断" })

map('i', _G.CoLeader .. 'elif' .. _G.End, function () return
'#if '                                              .. '<CR>\t' ..
    _G.Next                                         .. '<CR>' ..
'#elif ' .. _G.Next                                 .. '<CR>\t' ..
    _G.Next                                         .. '<CR>' ..
'#endif'                                            .. '<Esc>4kA'
end, { expr = true, desc = "宏 if-elif 判断" })

map('i', _G.CoLeader .. 'eelif' .. _G.End, function () return
'#if '                                              .. '<CR>\t' ..
    _G.Next                                         .. '<CR>' ..
'#elif ' .. _G.Next                                 .. '<CR>\t' ..
    _G.Next                                         .. '<CR>' ..
'#else'                                             .. '<CR>\t' ..
    _G.Next                                         .. '<CR>' ..
'#endif'                                            .. '<Esc>6kA'
end, { expr = true, desc = "宏 if-elif-else 判断" })

map('i', _G.CoLeader .. 'ifndef' .. _G.End, function () return
'#ifndef '                                          .. '<CR>' ..
'#define ' .. _G.Next                               .. '<CR>\t' ..
    _G.Next                                         .. '<CR>' ..
'#endif'                                            .. '<Esc>3kA'
end, { expr = true, desc = "判断是否已经具有某个宏变量" })

map('i', _G.CoLeader .. 'ifdef' .. _G.End, function () return
'#ifdef '
end, { expr = true, desc = "判断是否已经具有某个宏变量" })

---------------------------------------- 循环结构 --------------------------------

local loops = {}

loops['loop'] = function () return
'while (1) {'                                   .. '<CR>' ..
'}'                                             .. '<Esc>O'
end

loops['for'] = function () return
'for (' .. _G.CoLeader .. ') ' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end

loops['while'] = function () return
'while (' .. _G.CoLeader .. ') ' .. _G.Next .. '<Esc>F' .. _G.CoLeader .. 's'
end

loops['do-while'] = function () return
'do {'                                      .. '<CR>' ..
'} while (' .. _G.CoLeader .. ');'          .. '<Esc>F' .. _G.CoLeader .. 's'
end

require('settings.loops').loops['c'] = loops

--------------------------------- 分支结构 --------------------------------

local branchs = {}

branchs['if'] = function () return
    'if (' .. _G.CoLeader .. ') ' .. _G.Next    .. '<Esc>F' .. _G.CoLeader .. 's'
end

branchs['if-else'] = function () return
'if (' .. _G.CoLeader .. ') {'              .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'} else {'                                  .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'}'                                         .. '<Esc>4k0f' .. _G.CoLeader .. 's'
end

branchs['if-else_if'] = function () return
'if (' .. _G.CoLeader .. ') {'              .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'} else if (' .. _G.Next .. ') {'           .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'}'                                         .. '<Esc>4k0f' .. _G.CoLeader .. 's'
end

branchs['if-else_if-else'] = function () return
'if (' .. _G.CoLeader .. ') {'              .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'} else if (' .. _G.Next .. ') {'           .. '<CR>' ..
    _G.Next                                 .. '<CR><BS>' ..
'} else {'                                  .. '<CR>' ..
    _G.Next                                 .. '<CR>' ..
'}'                                         .. '<Esc>6k0f' .. _G.CoLeader .. 's'
end

branchs['switch'] = function () return
'switch (' .. _G.CoLeader .. ') {'          .. '<CR>' ..
    'case ' .. _G.Next .. ' :'              .. '<CR>' ..
            _G.Next                         .. '<CR><BS>' ..
            'break;'                        .. '<CR>' ..
    'default:'                              .. '<CR>' ..
            _G.Next                         .. '<CR><BS>' ..
            'break;'                        .. '<CR>' ..
'}'                                         .. '<Esc>7k0f' .. _G.CoLeader .. 's'
end

require('settings.branchs').branchs['c'] = branchs

--------------------------------- 其他配置 --------------------------------

