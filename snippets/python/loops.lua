--- python.lua
--- python 的 loops snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

--- 模块定义
local module = {}

--- 循环型语句
local loop_keys = require('settings.variables.loops').loop_keys

module[#module+1] = s({
    trig = loop_keys['for'],
    -- snippetType = 'autosnippet',
    }, {
    t('for '), i(1, 'elem'), t(' in '), i(2, 'iterable'), t({ ' :', '' }),
    t('\t'), i(0),
    t({ '', '# end if' }),
    })

module[#module+1] = s({
    trig = loop_keys['loop'],
    -- snippetType = 'autosnippet',
    }, {
    t({'while True:', ''}),
    t('\t'), i(0),
    t({ '', '# end while' }),
    })

module[#module+1] = s({
    trig = loop_keys['while'],
    -- snippetType = 'autosnippet',
    }, {
    t('while '), i(1, 'condition'), t({ ' :', '' }),
    t('\t'), i(0),
    t({ '', '# end while' }),
    })

--- 模块返回
return module

