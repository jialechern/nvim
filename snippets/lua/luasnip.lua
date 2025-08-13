--- lua.lua
--- lua 的 luasnip snippets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt
local rep = extras.rep
-- local d  = ls.dynamic_node

-- 模块定义
local module = {}

module[#module+1] = s({
    trig = 'luasnip-init',
    -- wordTrig = true,
    -- regTrig  = false,
    -- snippetType = 'autosnippet',
    name = 'luasnip-init',
    desc = 'luasnip 初始化',
    }, fmt([[
        --- {1}

        -- 基本引入
        local luasnip = require('luasnip')

        local s = luasnip.snippet
        local sn = luasnip.snippet_node
        local isn = luasnip.indent_snippet_node
        local t = luasnip.text_node
        local i = luasnip.insert_node
        local f = luasnip.function_node
        local c = luasnip.choice_node
        local d = luasnip.dynamic_node
        local r = luasnip.restore_node
        local events = require('luasnip.util.events')
        local ai = require('luasnip.nodes.absolute_indexer')

        local extras = require('luasnip.extras')

        local l = extras.lambda
        local rep = extras.rep
        local p = extras.partial
        local m = extras.match
        local n = extras.nonempty
        local dl = extras.dynamic_lambda

        local fmt = require('luasnip.extras.fmt').fmt
        local fmta = require('luasnip.extras.fmt').fmta
        local conds = require('luasnip.extras.expand_conditions')
        local postfix = require('luasnip.extras.postfix').postfix
        local types = require('luasnip.util.types')
        local parse = require('luasnip.util.parser').parse_snippet
        local ms = luasnip.multi_snippet
        local k = require('luasnip.nodes.key_indexer').new_key


        --- 模块定义
        local module = {{}}

        {2}

        -- 模块返回
        return module
    ]], { i(1, 'description'), i(0, '-- snippets') }))

-- snippet 定义
module[#module+1] = s({
    trig = 'snippet',
    -- wordTrig = true,
    -- regTrig  = false,
    -- snippetType = 'autosnippet',
    name = 'snippet',
    desc = '定义一个 snippet',
    }, fmt([[
        module[#module+1] = s({{
            trig = {1},
            wordTrig = {2},
            regTrig = {3},
            snippetType = {4},
            name = '{5}',
            desc = '{6}',
        }}, fmt({7}))
    ]], { i(1, 'trigger'),
            c(2, {t('false'), t('true')}),
            c(3, {t('false'), t('true')}),
            c(4, {t('\'snippet\''), t('\'autosnippet\'')}),
            i(5, 'name'),
            i(6, 'description'),
            i(0),
        }))

-- 函数节点
module[#module+1] = s({
    trig = 'func-node',
    -- wordTrig = false,
    -- regTrig = false,
    -- snippetType = 'snippet',
    name = 'func-node',
    desc = 'luasnip 的函数节点',
}, fmt([[
        f( function(args, parent, {1}) return {2} end,
            {3}, {{ {4} = '{5}', }})
            ]], {
            i(1, 'opt'),
            i(0, 'return-value'),
            i(2, 'ref-node'),
            rep(1),
            i(3),
    }))

-- 模块返回
return module

