--- python.lua
--- python 的 branchs snipets

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
local branch_keys = require('settings.variables.branchs').branch_keys

module[#module+1] = s({
    trig = branch_keys['if'],
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
    t('if '), i(1, 'condition'), t({ ' :', '' }),
    t('\t'), i(0),
    t({ '', '# end if' }),
    })

module[#module+1] = s({
    trig = branch_keys['if-else'],
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
    t('if '), i(1, 'condition1'), t({ ' :', '' }),
    t('\t'), i(2),
    t({ '', 'else:', '' }),
    t('\t'), i(0),
    t({ '', '# end if' }),
    })

module[#module+1] = s({
    trig = branch_keys['if-else_if'],
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
    t('if '), i(1, 'condition1'), t({ ' :', '' }),
    t('\t'), i(2),
    t({ '', 'elif '}), i(3, 'condition2'), t({ ' :', '' }),
    t('\t'), i(0),
    t({ '', '# end if' }),
    })

module[#module+1] = s({
    trig = branch_keys['if-else_if-else'],
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
    t('if '), i(1, 'condition1'), t({ ' :', '' }),
    t('\t'), i(2),
    t({ '', 'elif '}), i(3, 'condition2'), t({ ' :', '' }),
    t('\t'), i(4),
    t({ '', 'else:', '' }),
    t('\t'), i(0),
    t({ '', '# end if' }),
    })

module[#module+1] = s({
    trig = branch_keys['match'],
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
    t('match '), i(1, 'expr'), t({ ' :', '' }),
    t('\tcase '), i(2, 'pattern1'), t({ ' :', '' }),
    t('\t\t'), i(3),
    t({'', '\tcase _:', ''}),
    t('\t\t'), i(0),
    t({ '', '# end match' }),
    })

--- 模块返回
return module

