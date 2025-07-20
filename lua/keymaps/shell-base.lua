-- shell-base.lua

-- 支持的 shell 语言
local langs = {
    'sh',
    'zsh',
    'bash',
}

--------------------------------- 分支语句 ----------------------------------

local branchs = {}

branchs['if'] = function () return
'if test '                                      .. '<CR>' ..
'then'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'fi'                                            .. '<Esc>3kA'
end

branchs['if-else'] = function () return
'if test '                                      .. '<CR>' ..
'then'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'else'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'fi'                                            .. '<Esc>5kA'
end

branchs['if-else_if'] = function () return
'if test '                                      .. '<CR>' ..
'then'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'elif test ' .. _G.Next                         .. '<CR>' ..
'then'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'fi'                                            .. '<Esc>6kA'
end

branchs['if-else_if-else'] = function () return
'if test '                                      .. '<CR>' ..
'then'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'elif test ' .. _G.Next                         .. '<CR>' ..
'then'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'else'                                          .. '<CR>' ..
        _G.Next                                 .. '<CR>' ..
'fi'                                            .. '<Esc>8kA'
end

branchs['case'] = function () return
'case ' .. _G.CoLeader .. ' in'                 .. '<CR><BS>' ..
_G.Next .. ')'                                  .. '<CR>' ..
        _G.Next                                 .. '<CR><BS>' ..
'*)'                                            .. '<CR>\t' ..
        _G.Next                                 .. '<CR>' ..
'esac'                                          .. '<Esc>5k0f' .. _G.CoLeader .. 's'
end

for _, key in ipairs(langs) do
    require('settings.branchs').branchs[key] = branchs
end

--------------------------------- 循环语句 ----------------------------------

local loops = {}

loops['for'] = function () return
'for $' .. _G.CoLeader .. ' in ' .. _G.Next     .. '<CR>' ..
'do'                                            .. '<CR>' ..
    _G.Next                                     .. '<CR>' ..
'done'                                          .. '<Esc>3k0f' .. _G.CoLeader .. 's'
end

loops['while'] = function () return
'while test '                                   .. '<CR>' ..
'do'                                            .. '<CR>' ..
    _G.Next                                     .. '<CR>' ..
'done'                                          .. '<Esc>3kA'
end

loops['loop'] = function () return
'while true'                                    .. '<CR>' ..
'do'                                            .. '<CR>' ..
'done'                                          .. '<Esc>O'
end

for _, key in ipairs(langs) do
    require('settings.loops').loops[key] = loops
end

