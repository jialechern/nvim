--- python.lua
--- python 的 base snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
-- local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

-- 模块定义
local module = {}

--- 魔法变量
module[#module+1] = s({
    trig = '__',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '魔法变量',
    desc = '魔法变量',
}, {
    t('__'), i(0, 'magic'), t('__'),
})

--- 脚本初始化
module[#module+1] = s({
    trig = 'script',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '脚本入口',
    desc = '脚本入口',
    }, {
    t('#!/usr/bin/env python3'),
})

--- 长字符串
module[#module+1] = s({
    trig = 'str',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '长字符串(单引号)',
    desc = '长字符串(单引号)',
    }, {
    t('\'\'\''), i(0, 'message'), t('\'\'\''),
})

module[#module+1] = s({
    trig = 'string',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '长字符串(双引号)',
    desc = '长字符串(双引号)',
    }, {
    t('\"\"\"'), i(0, 'message'), t('\"\"\"'),
})

-- 模块返回
return module

