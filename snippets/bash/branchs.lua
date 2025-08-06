--- python.lua
--- python 的 branchs snipets

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

--- 分支型语句
local branch_keys = require('settings.variables.branchs').branch_keys

module[#module+1] = s({
    trig = branch_keys['if'],
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'if',
    desc = 'if 语句',
    }, {
    t('if test '), i(1, 'condition'), t({ '', '' }),
    t({'then', ''}),
    t('\t'), i(0),
    t({ '', 'fi' }),
    })

module[#module+1] = s({
    trig = branch_keys['if-else'],
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'if-else',
    desc = 'if-else 语句',
    }, {
    t('if test '), i(1, 'condition1'), t({ '', '' }),
    t({'then', ''}),
    t('\t'), i(2),
    t({ '', 'else', '' }),
    t('\t'), i(0),
    t({ '', 'fi' }),
    })

module[#module+1] = s({
    trig = branch_keys['if-else_if'],
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'if-elif',
    desc = 'if-elif 语句',
    }, {
    t('if test '), i(1, 'condition1'), t({ '', '' }),
    t({'then', ''}),
    t('\t'), i(2),
    t({ '', 'elif test '}), i(3, 'condition2'), t({ '', '' }),
    t({'then', ''}),
    t('\t'), i(0),
    t({ '', 'fi' }),
    })

module[#module+1] = s({
    trig = branch_keys['if-else_if-else'],
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'if-elif-else',
    desc = 'if-elif-else 语句',
    }, {
    t('if test '), i(1, 'condition1'), t({ '', '' }),
    t({'then', ''}),
    t('\t'), i(2),
    t({ '', 'elif test '}), i(3, 'condition2'), t({ '', '' }),
    t({'then', ''}),
    t('\t'), i(4),
    t({ '', 'else', '' }),
    t('\t'), i(0),
    t({ '', 'fi' }),
    })

module[#module+1] = s({
    trig = branch_keys['case'],
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'case',
    desc = 'case 语句',
    }, {
        t('case '), i(1, 'expr'), t({ ' in', '' }),
        t('\t'), i(2, 'pattern1'), t({ ')', '' }),
        t('\t\t'), i(3),
        t({'', '\t*)', ''}),
        t('\t\t'), i(0),
        t({ '', 'esac' }),
    })

--- 模块返回
return module

