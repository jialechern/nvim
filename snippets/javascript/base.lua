--- javascript
--- javascript 的 base snipets

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

--- 严格模式
module[#module+1] = s({
    trig = 'use-strict',
    -- snippetType = 'autosnippet',
}, {
    t('\'use strict\';'),
})

--- 打印至终端
module[#module+1] = s({
    trig = 'print',
    -- snippetType = 'autosnippet',
}, {
        t('console.log('), i(0, 'message'), t(');'),
})

--- 模板字符串
module[#module+1] = s({
    trig = 'fmt-string',
    -- snippetType = 'autosnippet',
}, {
    t('${'), i(1, 'content'), t('}'), i(0),
})


-- 模块返回
return module

