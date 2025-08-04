--- tex
--- tex 的 base snipets

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
--     trig = 'bold',
--     wordTrig  = true,
--     regTrig   = false,
--     snippetType = 'autosnippet',
-- }, {
--         t('*'), i(0, 'bold text'), t('*'),
-- })

-- 模块返回
return module

