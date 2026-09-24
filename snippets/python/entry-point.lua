--- python.lua
--- python 的 entry_point snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
-- local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

--- 模块定义
local module = {}

--- 程序入口点
local entry_point = require('settings.consts').entry_point
module[#module+1] = s({
    trig = entry_point,
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'entry-point',
    desc = '程序入口点',
    }, {
    t({'def main() -> None:', ''}),
    t('\t'), i(0),
    t({'', '', 'if __name__ == \'__main__\':', ''}),
    t('\tmain()'),
    })

--- 模块返回
return module

