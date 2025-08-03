--- c.lua
--- c 的 snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
-- local c = luasnip.choice_node

-- 模块定义
local module = {}

--- 基本映射
-- 导入头文件
module[#module+1] = s('include', {
    t('# include <'), i(0, 'header'), t('>'),
    })

-- 导入标准输入输出头文件
module[#module+1] = s('stdio', {
    t('# include <stdio.h>'),
    })

-- 打印函数
module[#module+1] = s('printf', {
    t('printf('), i(0, 'format'), t(');'),
    })

--- 程序入口点
local entry_point = require('settings.variables.entry-points').entry_point
module[#module+1] = s(entry_point, {
    t({'int main (int argc, char *argv[]) {', ''}),
    t('\t'), i(0), t({'', ''}),
    t({'\treturn 0;', ''}),
    t('}'),
    })

--- 函数模板
local func_key = require('settings.variables.functions').func_key
module[#module+1] = s(func_key, {
    i(1, 'ret-type'), t(' '), i(2, 'func-name'), t('('), i(3, 'args'), t({') {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

--- 宏命令
-- 宏定义
module[#module+1] = s('define', {
    t('#define '), i(0, 'macro-name')
    })

-- 注销宏定义
module[#module+1] = s('undef', {
    t('#undef '), i(0, 'macro-name')
    })

-- 宏 if 判断
module[#module+1] = s('macro-if', {
    t('# if '), i(1, 'condition'), t({'', ''}),
    t('\t'), i(0),
    t({'', '# endif'})
    })

-- 宏 if-else 判断
module[#module+1] = s('macro-if-else', {
    t('# if '), i(1, 'condition'), t({'', ''}),
    t('\t'), i(2),
    t({'', '# else', ''}),
    t('\t'), i(0),
    t({'', '# endif'})
    })

-- 宏 if-else_if 判断
module[#module+1] = s('macro-if-else_if', {
    t('# if '), i(1, 'condition'), t({'', ''}),
    t('\t'), i(2),
    t({'', '# elif '}), i(3, 'condition2'), t({'', ''}),
    t('\t'), i(0),
    t({'', '# endif'})
    })

-- 宏 if-else_if-else 判断
module[#module+1] = s('macro-if-else_if-else', {
    t('# if '), i(1, 'condition'), t({'', ''}),
    t('\t'), i(2),
    t({'', '# elif '}), i(3, 'condition2'), t({'', ''}),
    t('\t'), i(4),
    t({'', '# else', ''}),
    t('\t'), i(0),
    t({'', '# endif'})
    })

-- 宏 ifndef 判断
module[#module+1] = s('ifndef', {
    t('# ifndef '), i(1, 'macro-name'), t({'', ''}),
    t('# define '), i(2, 'macro-name'), t({'', ''}),
    t('\t'), i(0),
    t({'', '# endif'})
    })

-- 宏 ifdef 判断
module[#module+1] = s('ifdef', {
    t('# ifdef '), i(0, 'macro-name'),
    })

--- 循环型语句
local loop_keys = require('settings.variables.loops').loop_keys

module[#module+1] = s(loop_keys['for'], {
    t('for (int '), i(1, 'loop-var'), t('; '), i(2, 'loop-flag'), t('; '), i(3, 'loop-expr'), t(') {'),
    t({'', '\t'}), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(loop_keys['loop'], {
    t({'while (1) {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(loop_keys['while'], {
    t('while ('), i(1, 'condition'), t({') {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(loop_keys['do-while'], {
    t({'do {', ''}),
    t('\t'), i(0),
    t({'', '} while ('}), i(1, 'condition'), t({');', ''}),
    })

--- 分支型语句
local branch_keys = require('settings.variables.branchs').branch_keys

module[#module+1] = s(branch_keys['if'], {
    t('if ('), i(1, 'condition'), t(') '), i(0), t(';')
    })

module[#module+1] = s(branch_keys['if-else'], {
    t('if ('), i(1, 'condition'), t(') {'),
    t({'', '\t'}), i(2),
    t({'', '} else {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(branch_keys['if-else_if'], {
    t('if ('), i(1, 'condition1'), t(') {'),
    t({'', '\t'}), i(2),
    t({'', '} else if ('}), i(3, 'condition2'), t({') {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(branch_keys['if-else_if-else'], {
    t('if ('), i(1, 'condition1'), t(') {'),
    t({'', '\t'}), i(2),
    t({'', '} else if ('}), i(3, 'condition2'), t({') {', ''}),
    t('\t'), i(4),
    t({'', '} else {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s(branch_keys['switch'], {
    t('switch ('), i(1, 'expr'), t({') {', ''}),
    t('\tcase '), i(2, 'case-value'), t({':', ''}),
    t('\t\t'), i(3),
    t({'', '\t\tbreak;', ''}),
    t({'\tdefault:', ''}),
    t('\t\t'), i(0),
    t({'', '}'})
    })

-- 模块返回
return module

