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
    -- snippetType = 'autosnippet',
    }, {
    t('# include <'), i(0, 'header'), t('>'),
    })

--- 导入标准输入输出头文件
module[#module+1] = s({
    trig = 'stdio',
    -- snippetType = 'autosnippet',
    }, {
    t('# include <stdio.h>'),
    })

--- 打印函数
module[#module+1] = s({
    trig = 'printf',
    -- snippetType = 'autosnippet',
    }, {
    t('printf('), i(0, 'format'), t(');'),
    })

-- 模块返回
return module

