--- c.lua
--- c 的 base snipets

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

--- 基本映射

--- 导入头文件
module[#module+1] = s({
    trig = 'include',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'include',
    desc = '导入头文件',
    }, {
    t('# include <'), i(0, 'header'), t('>'),
    })

-- 模块返回
return module

