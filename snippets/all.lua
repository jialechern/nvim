--- all.lua
--- 适用于所有文件的 snippets

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

-- module[#module+1] = s({
--     trig = 'map_key',
--     wordTrig  = true,
--     regTrig   = false,
--     snippetType = 'autosnippet',
--     name = 'name',
--     desc = 'desc',
-- }, {
-- })

-- 模块返回
return module

