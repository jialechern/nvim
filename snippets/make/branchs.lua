--- make
--- make 的 branchs snipets

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

--- 分支型语句

module[#module+1] = s({
    trig = 'ifeq',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
        t('ifeq ('), i(1, 'var1'), t(', '), i(2, 'var2'), t({ ')', '' }),
        t('\t'), i(0),
        t({ '', 'endif' }),
    })

module[#module+1] = s({
    trig = 'ifneq',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
        t('ifneq ('), i(1, 'var1'), t(', '), i(2, 'var2'), t({ ')', '' }),
        t('\t'), i(0),
        t({ '', 'endif' }),
    })

module[#module+1] = s({
    trig = 'ifeq-else',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
        t('ifeq ('), i(1, 'var1'), t(', '), i(2, 'var2'), t({ ')', '' }),
        t('\t'), i(3),
        t({ '', 'else', '' }),
        t('\t'), i(0),
        t({ '', 'endif' }),
    })

module[#module+1] = s({
    trig = 'ifneq-else',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
        t('ifneq ('), i(1, 'var1'), t(', '), i(2, 'var2'), t({ ')', '' }),
        t('\t'), i(3),
        t({ '', 'else', '' }),
        t('\t'), i(0),
        t({ '', 'endif' }),
    })

module[#module+1] = s({
    trig = 'ifdef',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
        t('ifdef '), i(1, 'var'), t({ '', '' }),
        t('\t'), i(0),
        t({ '', 'endif' }),
    })

module[#module+1] = s({
    trig = 'ifdef-else',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
        t('ifdef '), i(1, 'var'), t({ '', '' }),
        t('\t'), i(2),
        t({'', 'else', ''}),
        t('\t'), i(0),
        t({ '', 'endif' }),
    })

module[#module+1] = s({
    trig = 'ifndef',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
        t('ifndef '), i(1, 'var'), t({ '', '' }),
        t('\t'), i(0),
        t({ '', 'endif' }),
    })

module[#module+1] = s({
    trig = 'ifndef-else',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
        t('ifndef '), i(1, 'var'), t({ '', '' }),
        t('\t'), i(2),
        t({'', 'else', ''}),
        t('\t'), i(0),
        t({ '', 'endif' }),
    })

--- 模块返回
return module

