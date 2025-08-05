--- c.lua
--- c 的 function snipets

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

--- 函数模板
local func_key = require('settings.variables.functions').func_key

module[#module+1] = s({
    trig = func_key,
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '函数定义',
    desc = '函数定义模板',
    }, {
    i(1, 'ret-type'), t(' '), i(2, 'func-name'), t('('), i(3, 'args'), t({') {', ''}),
    t('\t'), i(0),
    t({'', '}'}),
    })

-- 模块返回
return module

