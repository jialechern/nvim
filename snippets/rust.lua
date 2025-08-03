--- rust.lua
--- rust 的 snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node

--- 模块定义
local module = {}

--- 基本代码片段

-- 匿名函数
module[#module+1] = s('|', {
    t('|'), i(1, 'args'), t('|'), i(0),
    })

-- 打印函数
module[#module+1] = s('println', {
    t('println!('), i(0, 'fmt'), t(');'),
    })

-- 测试模块
module[#module+1] = s('test', {
    t({'#[cfg(test)]', ''}),
    t({'mod tests {', ''}),
    t({'\tuse super::*;', '', ''}),

    t({'\t#[test]', ''}),
    t('\tfn '), i(1, 'test_func'), t({'() {', ''}),
    t('\t\t'), i(0),
    t({'', '\t}'}),
    t({'', '}'}),
    })

--- 函数模板
local func_key = require('settings.variables.functions').func_key
module[#module+1] = s(func_key, {
    t('fn '), i(1, 'func-name'), t('('), i(2, 'args'), t(') -> '), i(3, 'ret-type'), t(' {'),
    t({'', '\t'}), i(0),
    t({'', '}'})
    })

--- 程序入口点
local entry_point = require('settings.variables.entry-points').entry_point
module[#module+1] = s(entry_point, {
    t({'fn main () -> Result<(), Box<dyn std::error::Error>> {', ''}),
    t('\t'), i(0),
    t({'', '\tOk(())'}),
    t({'', '}'})
    })

--- 分支型语句
local branch_keys = require('settings.variables.branchs').branch_keys

module[#module+1] = s(branch_keys['if'], {
    t('if '), i(1, 'condition'), t(' {'),
    t({'', '\t'}), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(branch_keys['if-else'], {
    t('if '), i(1, 'condition'), t(' {'),
    t({'', '\t'}), i(2),
    t({'', '} else {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(branch_keys['if-else_if'], {
    t('if '), i(1, 'condition1'), t(' {'),
    t({'', '\t'}), i(2),
    t({'', '} else if '}), i(3, 'condition2'), t({' {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(branch_keys['if-else_if-else'], {
    t('if '), i(1, 'condition1'), t(' {'),
    t({'', '\t'}), i(2),
    t({'', '} else if '}), i(3, 'condition2'), t({' {', ''}),
    t('\t'), i(4),
    t({'', '} else {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(branch_keys['match'], {
    t('match '), i(1, 'expr'), t({' {', ''}),
    t('\t'), i(2, 'pattern'), t(' => '), i(3), t({',', ''}),
    t('\t_ => '), i(0), t(','),
    t({'', '}'})
    })

--- 循环型语句
local loop_keys = require('settings.variables.loops').loop_keys

module[#module+1] = s(loop_keys['for'], {
    t('for '), i(1, 'elem'), t(' in '), i(2, 'iterable'), t({ ' {', '' }),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(loop_keys['while'], {
    t('while '), i(1, 'condition'), t({ ' {', '' }),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(loop_keys['loop'], {
    t({'loop {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

--- 模块返回
return module

