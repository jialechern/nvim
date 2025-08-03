-- lua.lua
-- lua 的 snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
-- local c = luasnip.choice_node

-- 模块定义
local module = {}

-- 程序入口点
local entry_point = require('settings.variables.entry-points').entry_point
module[#module+1] = s(entry_point, {
    t('#!/usr/bin/env lua'),
    })

-- 函数模板
local func_key = require('settings.variables.functions').func_key
module[#module+1] = s(func_key, {
    t('function '), i(1, 'name'), t('('), i(2), t({ ')', '' }),
    i(0),
    t({ '', 'end' }),
    })

-- 分支型语句
local branch_keys = require('settings.variables.branchs').branch_keys

module[#module+1] = s(branch_keys['if'], {
    t('if '), i(1, 'condition'), t({ ' then', '' }),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

module[#module+1] = s(branch_keys['if-else'], {
    t('if '), i(1, 'condition1'), t({ ' then', '' }),
    t('\t'), i(2),
    t({ '', 'else', '' }),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

module[#module+1] = s(branch_keys['if-else_if'], {
    t('if '), i(1, 'condition1'), t({ ' then', '' }),
    t('\t'), i(2),
    t({ '', 'elseif '}), i(3, 'condition2'), t({ ' then', '' }),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

module[#module+1] = s(branch_keys['if-else_if-else'], {
    t('if '), i(1, 'condition1'), t({ ' then', '' }),
    t('\t'), i(2),
    t({ '', 'elseif '}), i(3, 'condition2'), t({ ' then', '' }),
    t('\t'), i(4),
    t({ '', 'else', '' }),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

-- 循环型语句
local loop_keys = require('settings.variables.loops').loop_keys

module[#module+1] = s(loop_keys['for'], {
    t('for '), i(1, 'i'), t(' in '), i(2, 'iterable'), t({ ' do', '' }),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

module[#module+1] = s(loop_keys['loop'], {
    t({'while true do', ''}),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

module[#module+1] = s(loop_keys['while'], {
    t('while '), i(1, 'condition'), t({ ' do', '' }),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

module[#module+1] = s(loop_keys['do-while'], {
    t({'repeat', ''}),
    t('\t'), i(0),
    t({ '', 'until '}), i(1, 'condition'), t({''}),
    })

return module

