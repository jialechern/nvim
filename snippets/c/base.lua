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
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'include',
    desc = '导入头文件',
    }, {
    t('# include <'), i(0, 'header'), t('>'),
    })

--- 导入标准输入输出头文件
module[#module+1] = s({
    trig = 'stdio',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'include <stdio.h>',
    desc = '导入标准输入输出头文件',
    }, {
    t('# include <stdio.h>'),
    })

--- 打印函数
local print_key = require('settings.variables.print').print_key
module[#module+1] = s({
    trig = print_key,
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'printf',
    desc = '打印函数',
    }, {
    t('printf('), i(0, 'format'), t(');'),
    })

-- 模块返回
return module

