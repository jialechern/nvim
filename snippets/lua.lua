-- lua.lua
-- lua 的 snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node

-- 模块定义
local module = {}

-- 函数模板
module[#module+1] = s('fn', {
        t('function '), i(1, 'name'), t('('), i(2), t({ ')', '  ' }),
        i(0),     -- 光标最终落在这里
        t({ '', 'end' }),
    })

return module

