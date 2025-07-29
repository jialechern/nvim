-- rust.lua

-- 导入自定义工具函数
local map = require('utils.map').map

---------------------------- 基本映射 ----------------------------

require('settings.entry-points').entry_points['rust'] = function () return
'fn main () -> Result<(), Box<dyn std::error::Error>> {'            .. '<CR><Esc>0i\t' ..
    'Ok(())'                                                        .. '<CR>' ..
'}'                                                                 .. '<Esc>kO'
end

require('settings.functions').functions['rust'] = function () return
'fn ' .. _G.CoLeader .. '( ' .. _G.Next .. ' )' .. _G.Next .. '{'   ..
    _G.Next                                                         ..
'}'                                                                 .. '<Esc>F' .. _G.CoLeader .. 's'
end

map('i', '<LEADER>tinit', function () return
'#[cfg(test)]'                          .. '<CR>' ..
'mod tests {'                           .. '<CR>' ..
    'use super::*;'                     .. '<CR><CR>' ..

    '#[test]'                           .. '<CR>' ..
    'fn ' .. _G.CoLeader .. ' () {'     .. '<CR>\t\t' ..
        _G.Next                         .. '<CR>\t' ..
    '}'                                 .. '<CR>' ..
'}'                                     .. '<Esc>3k0f' .. _G.CoLeader .. 's'
end, { expr = true, desc = "初始化测试模块" })

map('i', '<LEADER><Bar>', function () return
'<Bar>' .. _G.CoLeader .. '<Bar>' .. _G.Next    .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "匿名函数" })

map('i', '<LEADER>p', function () return
'println!(' .. _G.CoLeader .. ');' .. _G.Next   .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "打印" })

----------------------------- 循环语句 ----------------------------

local loops = {}

loops['for'] = function () return
'for ' .. _G.CoLeader .. ' {'           .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

loops['while'] = function () return
'while ' .. _G.CoLeader .. ' {'         .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

loops['loop'] = function () return
'loop {'                                .. '<CR>' ..
'}'                                     .. '<Esc>O'
end

require('settings.loops').loops['rust'] = loops

----------------------------- 分支语句 ----------------------------

local branchs = {}

branchs['if'] = function () return
'if ' .. _G.CoLeader .. ' {'            .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

branchs['if-else'] = function () return
'if ' .. _G.CoLeader .. ' {'            .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'} else {'                              .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>4k0f' .. _G.CoLeader .. 's'
end

branchs['if-else_if'] = function () return
'if ' .. _G.CoLeader .. ' {'            .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'} else if ' .. _G.Next .. ' {'         .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>4k0f' .. _G.CoLeader .. 's'
end

branchs['if-else_if-else'] = function () return
'if ' .. _G.CoLeader .. ' {'            .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'} else if ' .. _G.Next .. ' {'         .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'} else {'                              .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>6k0f' .. _G.CoLeader .. 's'
end

branchs['match'] = function () return
'match ' .. _G.CoLeader .. ' {'         .. '<CR>' ..
        _G.Next                         .. '<CR>' ..
'}'                                     .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

require('settings.branchs').branchs['rust'] = branchs

------------------------------ 自动编译运行 -----------------------------------

require('settings.autocmd-by-filetype').cmds['rust'] = function ()
    vim.bo.makeprg = 'cargo run'
    vim.cmd('silent write')
    vim.cmd('make')
end


