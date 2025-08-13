--- zebraw.lua

-- 基本引入
local luasnip = require('luasnip')

local s = luasnip.snippet
-- local t = luasnip.text_node
-- local i = luasnip.insert_node
-- local c = luasnip.choice_node

-- local extras = require('luasnip.extras')

-- local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt


--- 模块定义
local module = {}

module[#module+1] = s({
    trig = 'zebraw-init',
    -- wordTrig = false,
    -- regTrig = false,
    -- snippetType = 'snippet',
    name = 'zebraw-init',
    desc = 'zebraw-init',
}, fmt([[
    #import "@preview/zebraw:0.5.5": *
    #show: zebraw
]], {}))

-- 模块返回
return module

