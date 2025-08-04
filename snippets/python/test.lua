--- python.lua
--- python 的 test snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

--- 模块定义
local module = {}

--- 单元测试测试类
module[#module+1] = s('test', {
    t({'# 单元测试初始化',
        'from unittest import TestCase, skip, expectedFailure, main', ''}),
    t('class '), i(1, 'TestClassName'), t({'(TestCase):', ''}),
    t({'\tdef setUp(self):', ''}),
    t('\t\t'), i(2, 'setup code'), t({ '', '' , ''}),

    t({'\t@skip(\'暂时跳过测试\')', ''}),
    t({'\tdef test_example(self):', ''}),
    t({'\t\tself.assertTrue(sum(range(101)) == 5050, \'计算错误!\')', '', ''}),

    t({'\tdef tearDown(self):', ''}),
    t('\t\t'), i(0, 'teardown code'),
    })

--- 模块返回
return module

