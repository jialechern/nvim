--- javascript
--- javascript 的 base snipets

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

--- 严格模式
module[#module+1] = s({
    trig = 'use-strict',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'use-strict',
    desc = '启用严格模式',
}, {
    t('\'use strict\';'),
})

--- 模板字符串
module[#module+1] = s({
    trig = 'fmt-string',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'fmt-string',
    desc = '模板字符串',
}, {
    t('${'), i(1, 'content'), t('}'), i(0),
})


-- 模块返回
return module

