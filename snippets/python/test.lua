--- python.lua
--- python 的 test snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
-- local t = luasnip.text_node
local i = luasnip.insert_node
local fmt = require('luasnip.extras.fmt').fmt
-- local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

--- 模块定义
local module = {}

--- 单元测试测试类
local test_key = require('settings.consts').test_key
module[#module+1] = s({
    trig = test_key,
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'test',
    desc = '单元测试初始化',
    }, fmt([[
    # 单元测试初始化
    from unittest import TestCase, skip, expectedFailure, main

    class {1}(TestCase):
        def setUp(self):
            {2}

        @skip('暂时跳过测试')
        def test_example(self):
            self.assertTrue(sum(range(101)) == 5050, '计算错误!')

        def tearDown(self):
            {3}
    ]], {
        i(1, 'TestClassName'), -- 测试类名
        i(2, '# setup code'),    -- setup 代码
        i(0, '# teardown code')  -- teardown 代码
    }))

--- 模块返回
return module

