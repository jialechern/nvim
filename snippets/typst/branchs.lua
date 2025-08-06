--- typst
--- typst 的 branchs snipets

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
    desc = 'if 判断',
    }, {
    t('if '), i(1, 'condition'), t({ ' {', '' }),
    t('\t'), i(0),
    t({ '', '}' }),
    })

module[#module+1] = s({
    trig = branch_keys['if-else'],
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'if-else',
    desc = 'if-else 判断',
    }, {
    t('if '), i(1, 'condition'), t({ ' {', '' }),
    t('\t'), i(2),
    t({ '', '} else {', '' }),
    t('\t'), i(0),
    t({ '', '}' }),
    })

module[#module+1] = s({
    trig = branch_keys['if-else_if'],
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'if-elif',
    desc = 'if-elif 判断',
    }, {
    t('if '), i(1, 'condition1'), t({ ' {', '' }),
    t('\t'), i(2),
    t({ '', '} else if '}), i(3, 'condition2'), t({ ' {', '' }),
    t('\t'), i(0),
    t({ '', '}' }),
    })

module[#module+1] = s({
    trig = branch_keys['if-else_if-else'],
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'if-elif-else',
    desc = 'if-elif-else 判断',
    }, {
    t('if '), i(1, 'condition1'), t({ ' {', '' }),
    t('\t'), i(2),
    t({ '', '} else if '}), i(3, 'condition2'), t({ ' {', '' }),
    t('\t'), i(4),
    t({ '', '} else {', '' }),
    t('\t'), i(0),
    t({ '', '}' }),
    })

--- 模块返回
return module

