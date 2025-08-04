--- rust.lua
--- rust 的 loops snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
-- local d  = ls.dynamic_node

--- 模块定义
local module = {}

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

