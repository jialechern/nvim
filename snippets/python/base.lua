--- python.lua
--- python 的 base snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

-- 模块定义
local module = {}

--- 魔法变量
module[#module+1] = s({
    trig = '__',
    -- snippetType = 'autosnippet',
}, {
    t('__'), i(1, 'magic'), t('__'), i(0),
})

--- 脚本初始化
module[#module+1] = s('script', {
    t('#!/usr/bin/env python3'),
})

--- 打印
module[#module+1] = s('print', {
    t('print('), i(1, 'message'), t(')'), i(0),
})

--- 长字符串
module[#module+1] = s('str', {
    t('\'\'\''), i(1, 'message'), t('\'\'\''), i(0),
})

module[#module+1] = s('string', {
    t('\"\"\"'), i(1, 'message'), t('\"\"\"'), i(0),
})

-- 模块返回
return module

