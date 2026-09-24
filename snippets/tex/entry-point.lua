--- tex
--- tex 的 entry_point snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
local fmt = require('luasnip.extras.fmt').fmt
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
    }, fmt([[
    \documentclass{{{1}}}

    \title{{{2}}}
    \author{{{3}}}
    \institute{{{4}}}
    \version{{{5}}}
    \date{{\zhtoday}}

    \usepackage{{array}}
    \usepackage{{amssymb}}
    \usepackage{{float}}
    \usepackage{{mathrsfs}}
    \usepackage{{{6}}}

    \begin{{document}}
    \maketitle
    {7}
    \end{{document}}
    ]], {
        c(1, { t('article'), t('book'), t('report') }),
        i(2, 'Title'),
        i(3, 'Author'),
        i(4, 'Institute'),
        i(5, 'Version'),
        i(6, 'Package'),
        i(0, '% Content'),
    }))

--- 模块返回
return module
