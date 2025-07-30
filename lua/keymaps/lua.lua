-- lua.lua

---------------------------------- 基本映射 ----------------------------------

require('settings.functions').functions['lua'] = function () return
'local function ' .. _G.CoLeader .. ' (' .. _G.Next .. ')'  .. '<CR>' ..
        _G.Next                                             .. '<CR>' ..
'end'
                                                .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

---------------------------------- 分支语句 ----------------------------------

local branchs = {}

branchs['if'] = function () return
'if ' .. _G.CoLeader .. ' then'                 .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'end'                                           .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

branchs['if-else'] = function () return
'if ' .. _G.CoLeader .. ' then'                 .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'else'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'end'                                           .. '<Esc>4k0f' .. _G.CoLeader .. 's'
end

branchs['if-else_if'] = function () return
'if ' .. _G.CoLeader .. ' then'                 .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'elseif ' .. _G.Next .. ' then'                 .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'end'                                           .. '<Esc>4k0f' .. _G.CoLeader .. 's'
end

branchs['if-else_if-else'] = function () return
'if ' .. _G.CoLeader .. ' then'                 .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'elseif ' .. _G.Next .. ' then'                 .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'else'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'end'                                           .. '<Esc>6k0f' .. _G.CoLeader .. 's'
end

require('settings.branchs').branchs['lua'] = branchs

---------------------------------- 循环语句 ----------------------------------

local loops = {}

loops['for'] = function () return
'for ' .. _G.CoLeader .. ' in ' .. _G.Next .. ' do'     .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
'end'
                                                .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

loops['while'] = function () return
'while ' .. _G.CoLeader .. ' do'                        .. '<CR>' ..
        _G.Next                                         .. '<CR>' ..
'end'
                                                .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

loops['loop'] = function () return
'while true do'                                         .. '<CR>' ..
'end'                                                   .. '<Esc>O'
end

loops['do-while'] = function () return
'repeat'                                                .. '<CR>' ..
'until '
end

require('settings.loops').loops['lua'] = loops

