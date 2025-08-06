--- tex
--- tex 的 symbols snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
-- local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

-- 模块定义
local module = {}

--- 常见的符号配对
-- 尖括号
module[#module+1] = s({
    trig = 'inner',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'inner',
    desc = '内积',
}, {
    t('\\left\\langle'), i(1), t('\\right\\rangle'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'inner',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'inner',
    desc = '内积',
}, {
    t('\\left\\langle'), i(1), t('\\right\\rangle'), i(0),
})

-- 小括号
module[#module+1] = s({
    trig = 'tuple',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'tuple',
    desc = '元组',
}, {
    t('\\left('), i(1), t('\\right)'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'tuple',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'tuple',
    desc = '元组',
}, {
    t('\\left('), i(1), t('\\right)'), i(0),
})

-- 中括号
module[#module+1] = s({
    trig = 'list',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'list',
    desc = '列表',
}, {
    t('\\left['), i(1), t('\\right]'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'list',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'list',
    desc = '列表',
}, {
    t('\\left['), i(1), t('\\right]'), i(0),
})

-- 大括号
module[#module+1] = s({
    trig = 'set',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'set',
    desc = '集合',
}, {
    t('\\left\\{'), i(1), t('\\right\\}'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'set',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'set',
    desc = '集合',
}, {
    t('\\left\\{'), i(1), t('\\right\\}'), i(0),
})

--- 双线体大写字母
-- 一般双线体环境
module[#module+1] = s({
    trig = 'bb',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'bb',
    desc = '双线体',
}, {
    t('\\mathbb{'), i(1), t('}'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'bb',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'bb',
    desc = '双线体',
}, {
    t('\\mathbb{'), i(1), t('}'), i(0),
})

-- 双线体 N
module[#module+1] = s({
    trig = 'NN',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'bb-N',
    desc = '双线体 N',
}, {
    t('\\mathbb{N}'),
})

-- 双线体 Q
module[#module+1] = s({
    trig = 'QQ',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'bb-Q',
    desc = '双线体 Q',
}, {
    t('\\mathbb{Q}'),
})

-- 双线体 R
module[#module+1] = s({
    trig = 'RR',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'bb-R',
    desc = '双线体 R',
}, {
    t('\\mathbb{R}'),
})

-- 双线体 C
module[#module+1] = s({
    trig = 'CC',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'bb-C',
    desc = '双线体 C',
}, {
    t('\\mathbb{C}'),
})

-- 双线体 E
module[#module+1] = s({
    trig = 'EE',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'bb-E',
    desc = '双线体 E',
}, {
    t('\\mathbb{E}'),
})

--- 大写花体字母
-- 一般花体字母环境
module[#module+1] = s({
    trig = 'cal',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'cal',
    desc = '花体字母',
}, {
    t('\\mathcal{'), i(1), t('}'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'cal',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'cal',
    desc = '花体字母',
}, {
    t('\\mathcal{'), i(1), t('}'), i(0),
})

-- 花体字母 T
module[#module+1] = s({
    trig = 'cal-T',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'cal-T',
    desc = '花体字母 T',
}, {
    t('\\mathcal{T}'),
})

-- 花体字母 L
module[#module+1] = s({
    trig = 'cal-L',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'cal-L',
    desc = '花体字母 L',
}, {
    t('\\mathcal{L}'),
})

-- 花体字母 P
module[#module+1] = s({
    trig = 'cal-P',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'cal-P',
    desc = '花体字母 P',
}, {
    t('\\mathcal{P}'),
})

-- 花体字母 A
module[#module+1] = s({
    trig = 'cal-A',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'cal-A',
    desc = '花体字母 A',
}, {
    t('\\mathcal{A}'),
})

-- 花体字母 B
module[#module+1] = s({
    trig = 'cal-B',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'cal-B',
    desc = '花体字母 B',
}, {
    t('\\mathcal{B}'),
})

-- 花体字母 H
module[#module+1] = s({
    trig = 'cal-H',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'cal-H',
    desc = '花体字母 H',
}, {
    t('\\mathcal{H}'),
})

--- 罗马正体
module[#module+1] = s({
    trig = 'rm',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'rm',
    desc = '罗马正体',
}, {
    t('\\mathrm{'), i(1), t('}'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'rm',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'rm',
    desc = '罗马正体',
}, {
    t('\\mathrm{'), i(1), t('}'), i(0),
})

-- 罗马正体 d
module[#module+1] = s({
    trig = 'rm-d',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'rm-d',
    desc = '罗马正体 d',
}, {
    t('\\mathrm{d}'),
})

--- 德文 d
module[#module+1] = s({
    trig = 'partial',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'partial',
    desc = '德文偏导数符号',
}, {
    t('\\partial'),
})

-- 模块返回
return module

