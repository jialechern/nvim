--- rust.lua
--- rust 的 test snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
-- local d  = ls.dynamic_node

--- 模块定义
local module = {}

--- 测试模块
module[#module+1] = s({
    trig = 'test',
    -- snippetType = 'autosnippet',
    }, {
    t({'#[cfg(test)]', ''}),
    t({'mod tests {', ''}),
    t({'\tuse super::*;', '', ''}),

    t({'\t#[test]', ''}),
    t('\tfn '), i(1, 'test_func'), t({'() {', ''}),
    t('\t\t'), i(0),
    t({'', '\t}'}),
    t({'', '}'}),
    })

-- 模块返回
return module

