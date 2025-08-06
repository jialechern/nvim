--- tex
--- tex 的 entry_point snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

--- 模块定义
local module = {}

--- 程序入口点
local entry_point = require('settings.variables.entry-points').entry_point
module[#module+1] = s({
    trig = entry_point,
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'entry-point',
    desc = '程序入口点',
    }, {
        t('\\documentclass{'), c(1, { t('article'), t('book'), t('report') }), t({'}', '', ''}),

        t('\\title{'), i(2, 'Title'), t({'}', ''}),
        t('\\author{'), i(3, 'Author'), t({'}', ''}),
        t('\\institute{'), i(4, 'Institute'), t({'}', ''}),
        t('\\version{'), i(5, 'Version'), t({'}', '', ''}),

        t({'\\date{\\zhtoday}', ''}),

        t({'\\usepackage{array}', ''}),
        t({'\\usepackage{amssymb}', ''}),
        t({'\\usepackage{float}', ''}),
        t({'\\usepackage{mathrsfs}', ''}),
        t('\\usepackage{'), i(6, 'Package'), t({ '}', '', '' }),

        t({'\\begin{document}', ''}),
        t({'\\maketitle', ''}),
        i(0),
        t({'', '\\end{document}'}),
    })

--- 模块返回
return module
