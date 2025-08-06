--- bash
--- bash 的 loops snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
-- local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

--- 模块定义
local module = {}

--- 循环型语句
local loop_keys = require('settings.variables.loops').loop_keys

module[#module+1] = s({
    trig = loop_keys['for'],
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'for',
    desc = 'for 循环',
    }, {
    t('for $'), i(1, 'elem'), t(' in '), i(2, 'iterable'), t({ '', '' }),
    t({'do', ''}),
    t('\t'), i(0),
    t({ '', 'done' }),
    })

module[#module+1] = s({
    trig = loop_keys['loop'],
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'loop',
    desc = 'loop 循环',
    }, {
    t({'while true', ''}),
    t({'do', ''}),
    t('\t'), i(0),
    t({ '', 'done' }),
    })

module[#module+1] = s({
    trig = loop_keys['while'],
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'while',
    desc = 'while 循环',
    }, {
    t('while test '), i(1, 'condition'), t({ '', '' }),
    t({'do', ''}),
    t('\t'), i(0),
    t({ '', 'done' }),
    })

--- 模块返回
return module

