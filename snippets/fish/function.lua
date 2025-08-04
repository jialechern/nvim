--- fish
--- fish 的 function snipets

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

--- 分支型语句
local func_key = require('settings.variables.functions').func_key

module[#module+1] = s({
    trig = func_key,
    -- snippetType = 'autosnippet',
    }, {
    t('function '), i(1, 'name'), t({'', ''}),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

-- 模块返回
return module

