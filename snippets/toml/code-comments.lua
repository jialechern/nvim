--- toml
--- toml 的 comment snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
-- local i = luasnip.insert_node
-- local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

-- 模块定义
local module = {}

--- 一般注释
local comment_key = require('settings.variables.code-comments').comment_key
module[#module+1] = s({
    trig = comment_key,
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '一般注释',
    desc = '一般注释',
    }, {
        t('# ')
    })

-- 模块返回
return module

