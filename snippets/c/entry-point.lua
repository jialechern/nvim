--- c.lua
--- c 的 entry-point snipets

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

--- 程序入口点
local entry_point = require('settings.variables.entry-points').entry_point

module[#module+1] = s({
    trig = entry_point,
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    }, {
    t({'int main (int argc, char *argv[]) {', ''}),
    t('\t'), i(0), t({'', ''}),
    t({'\treturn 0;', ''}),
    t('}'),
    })

-- 模块返回
return module

