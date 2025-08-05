--- rust.lua
--- rust 的 base snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
-- local d  = ls.dynamic_node

--- 模块定义
local module = {}

--- 基本代码片段

--- 匿名函数
module[#module+1] = s({
    trig = '|',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'lambda-function',
    desc = '匿名函数/闭包',
    }, {
    t('|'), i(1, 'args'), t('|'), i(0),
    })

--- 打印函数
local print_key = require('settings.variables.print').print_key
module[#module+1] = s({
    trig = print_key,
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'println',
    desc = '打印函数',
    }, {
    t('println!('), i(0, 'fmt'), t(');'),
    })

--- 模块返回
return module

