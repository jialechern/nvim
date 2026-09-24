--- rust.lua
--- rust 的 test snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local fmt = require('luasnip.extras.fmt').fmt
-- local c = luasnip.choice_node
-- local d  = ls.dynamic_node

--- 模块定义
local module = {}

--- 测试模块
local test_key = require('settings.consts').test_key
module[#module+1] = s({
    trig = test_key,
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'test',
    desc = '测试模块初始化',
    }, fmt([[
    #[cfg(test)]
    mod tests {{
        use super::*;

        #[test]
        fn {1}() {{
            {2}
        }}
    }}
    ]], {
        i(1, 'test-func'),
        i(0, '// test code'),
    }))

-- 模块返回
return module

