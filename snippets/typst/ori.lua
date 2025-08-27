--- ori.lua

-- 基本引入
local luasnip = require('luasnip')

local s = luasnip.snippet
-- local t = luasnip.text_node
local i = luasnip.insert_node
-- local c = luasnip.choice_node

-- local extras = require('luasnip.extras')

-- local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt


--- 模块定义
local module = {}

module[#module+1] = s({
    trig = 'ori-init',
    -- wordTrig = false,
    -- regTrig = false,
    -- snippetType = 'snippet',
    name = 'ori-init',
    desc = 'ori-init',
}, fmt([[
#import "@preview/ori:{1}": *

#set heading(numbering: numbly("{{1:一}}、", default: "1.1  "))
#set math.equation(numbering: "(1)")

#show: ori.with(
    title: "{2}",
    author: "{3}",
    subject: "{4}",
    semester: "{5}",
    date: datetime.today(),
    // 是否生成标题页
    maketitle: false,
    // 是否生成目录
    makeoutline: false,
    // theme: "dark",
    // 文档类型 media: screen | print
    // media: "screen",
    // 目录深度(默认 2)
    outline-depth: 2,
    // 首行缩进(设置为 auto 则为 2em)
    first-line-indent: auto,
    // size: 字体大小(默认 11pt)
    size: 11pt,
    lang: "zh",
    region: "cn",
){6}
]], {
    i(1, "0.2.3"),
    i(2, "标题"),
    i(3, "作者"),
    i(4, "科目"),
    i(5, "学期"),
    i(0),
}))

-- 模块返回
return module

