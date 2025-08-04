--- c.lua
--- c 的 loops snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
-- local c = luasnip.choice_node
-- local d  = ls.dynamic_node

-- 模块定义
local module = {}

--- 循环型语句
local loop_keys = require('settings.variables.loops').loop_keys

module[#module+1] = s({
    trig = loop_keys['for'],
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
    t('for (int '), i(1, 'loop-var'), t('; '), i(2, 'loop-flag'), t('; '), i(3, 'loop-expr'), t(') {'),
    t({'', '\t'}), i(0),
    t({'', '}'}),
    })

module[#module+1] = s({
    trig = loop_keys['loop'],
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
    t({'while (1) {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s({
    trig = loop_keys['while'],
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
    t('while ('), i(1, 'condition'), t({') {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

module[#module+1] = s({
    trig = loop_keys['do-while'],
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
    t({'do {', ''}),
    t('\t'), i(0),
    t({'', '} while ('}), i(1, 'condition'), t({');', ''}),
    })

-- 模块返回
return module

