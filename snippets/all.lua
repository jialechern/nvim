--- all.lua
--- 适用于所有文件的 snippets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
-- local f = luasnip.function_node
-- local c = luasnip.choice_node
local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

-- 模块定义
local module = {}

--- 括号匹配
for from, to in pairs({
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['<'] = '>',
    ['\''] = '\'',
    ['\"'] = '\"',
}) do
    module[#module+1] = s({
        trig = _G.Leader .. from,
        -- wordTrig  = false,
        -- regTrig   = false,
        snippetType = 'autosnippet',
        name = string.sub(from, -1) .. '匹配',
        desc = string.sub(from, -1) .. '匹配',
    }, {
            t(string.sub(from, -1) .. ' '), i(0), t(' ' .. to),
    })

    module[#module+1] = s({
        trig = _G.LocalLeader .. from,
        -- wordTrig  = false,
        -- regTrig   = false,
        snippetType = 'autosnippet',
        name = string.sub(from, -1) .. '匹配',
        desc = string.sub(from, -1) .. '匹配',
    }, {
            t(string.sub(from, -1)), i(0), t(to),
    })
end

-- 模块返回
return module

