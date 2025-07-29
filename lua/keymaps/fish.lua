-- fish.lua

--------------------------------- 基本映射 ---------------------------------

require('settings.functions').functions['fish'] = function () return
'function ' .. _G.CoLeader .. ' end'                    .. '<Esc>F' .. _G.CoLeader .. 's'
end

--------------------------------- 分支语句 ---------------------------------

local branchs = {}

branchs['if'] = function () return
'if test '                                          .. '<CR>' ..
    _G.Next                                         .. '<CR>' ..
'end'                                               .. '<Esc>2kA'
end

branchs['if-else'] = function () return
'if test '                                          .. '<CR>' ..
    _G.Next                                         .. '<CR>' ..
'else'                                              .. '<CR>' ..
    _G.Next                                         .. '<CR>' ..
'end'                                               .. '<Esc>4kA'
end

branchs['if-else_if'] = function () return
'if test '                                          .. '<CR>' ..
    _G.Next                                         .. '<CR>' ..
'else if test ' .. _G.Next                          .. '<CR>' ..
    _G.Next                                         .. '<CR>' ..
'end'                                               .. '<Esc>4kA'
end

branchs['if-else_if-else'] = function () return
'if test '                                          .. '<CR>' ..
    _G.Next                                         .. '<CR>' ..
'else if test ' .. _G.Next                          .. '<CR>' ..
    _G.Next                                         .. '<CR>' ..
'else'                                              .. '<CR>' ..
    _G.Next                                         .. '<CR>' ..
'end'                                               .. '<Esc>6kA'
end

branchs['switch'] = function () return
'switch "' .. _G.CoLeader .. '"'                    .. '<CR>' ..
    'case "' .. _G.Next .. '"'                      .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
    'case "*"'                                      .. '<CR>' ..
            _G.Next                                 .. '<CR>' ..
'end'                                               .. '<Esc>5k0f' .. _G.CoLeader .. 's'
end

require('settings.branchs').branchs['fish'] = branchs

--------------------------------- 循环语句 ---------------------------------

local loops = {}

loops['for'] = function () return
'for ' .. _G.CoLeader .. ' in ' .. _G.Next          .. '<CR>' ..
    _G.Next                                         .. '<CR>' ..
'end'                                               .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

loops['while'] = function () return
'while test '                                       .. '<CR>' ..
    _G.Next                                         .. '<CR>' ..
'end'                                               .. '<Esc>2kA'
end

require('settings.loops').loops['fish'] = loops

-------------------------------- 自动运行 ---------------------------------

require('settings.autocmd-by-filetype').cmds['fish'] = function ()
    vim.bo.makeprg = 'fish %:p'
    vim.cmd('silent write')
    vim.cmd('make')
end

