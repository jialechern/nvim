--- typst
--- typst 的 symbols snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

-- 模块定义
local module = {}

--- 双线体字母
module[#module+1] = s({
    trig = 'bb',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('bb('), i(1), t(')'), i(0),
})

--- 花字母
module[#module+1] = s({
    trig = 'cal',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('cal('), i(1), t(')'), i(0),
})

--- 希腊字母
module[#module+1] = s({
    trig = 'alpha',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('alpha'),
})

module[#module+1] = s({
    trig = 'beta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('beta'),
})

module[#module+1] = s({
    trig = 'gamma',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('gamma'),
})

module[#module+1] = s({
    trig = 'Gamma',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('Gamma'),
})

module[#module+1] = s({
    trig = 'phi',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('phi.alt'),
})

module[#module+1] = s({
    trig = 'var-phi',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('phi'),
})

module[#module+1] = s({
    trig = 'Phi',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('Phi'),
})

module[#module+1] = s({
    trig = 'delta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('delta'),
})

module[#module+1] = s({
    trig = 'Delta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('Delta'),
})

module[#module+1] = s({
    trig = 'epsilon',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('epsilon.alt'),
})

module[#module+1] = s({
    trig = 'var-epsilon',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('epsilon'),
})

module[#module+1] = s({
    trig = 'lambda',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('lambda'),
})

module[#module+1] = s({
    trig = 'Lambda',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('Lambda'),
})

module[#module+1] = s({
    trig = 'omega',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('omega'),
})

module[#module+1] = s({
    trig = 'Omega',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('Omega'),
})

module[#module+1] = s({
    trig = 'sigma',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('sigma'),
})

module[#module+1] = s({
    trig = 'Sigma',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('Sigma'),
})

module[#module+1] = s({
    trig = 'tau',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('tau'),
})

module[#module+1] = s({
    trig = 'theta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('theta'),
})

module[#module+1] = s({
    trig = 'Theta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('Theta'),
})

module[#module+1] = s({
    trig = 'var-theta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('theta.alt'),
})

--- 上/下 标

-- 一般性上下标
module[#module+1] = s({
    trig = '^',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('^('), i(1), t(')'), i(0),
})

module[#module+1] = s({
    trig = '_',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('_('), i(1), t(')'), i(0),
})

-- 上横线
module[#module+1] = s({
    trig = 'overline',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('overline('), i(1), t(')'), i(0),
})

-- 下横线
module[#module+1] = s({
    trig = 'underline',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('underline('), i(1), t(')'), i(0),
})

-- 上括号
module[#module+1] = s({
    trig = 'overbrace',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('overbrace('), i(1), t(')'), i(0),
})

-- 下括号
module[#module+1] = s({
    trig = 'underbrace',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('underbrace('), i(1), t(')'), i(0),
})

-- 上尖括号
module[#module+1] = s({
    trig = 'hat',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('hat('), i(1), t(')'), i(0),
})

-- 上倒尖括号
module[#module+1] = s({
    trig = 'cohat',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('caron('), i(1), t(')'), i(0),
})

-- 上波浪号
module[#module+1] = s({
    trig = 'tilde',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('tilde('), i(1), t(')'), i(0),
})

-- 上标向右箭头
module[#module+1] = s({
    trig = 'arrow',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow('), i(1), t(')'), i(0),
})

--- 各种箭头

-- 充要条件1
module[#module+1] = s({
    trig = 'Iff',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.l.r.double.long'),
})

-- 充要条件2
module[#module+1] = s({
    trig = 'sIff',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.l.r.double'),
})

-- 充要条件3
module[#module+1] = s({
    trig = 'iff',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.l.r.long'),
})

-- 充要条件4
module[#module+1] = s({
    trig = 'siff',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.l.r'),
})

-- 元素对应
module[#module+1] = s({
    trig = 'mapsto',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.r.bar'),
})

-- 元素对应(加长)
module[#module+1] = s({
    trig = 'lmapsto',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.r.long.bar'),
})

-- 必要条件1
module[#module+1] = s({
    trig = 'Lla',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.l.double.long'),
})

-- 必要条件2
module[#module+1] = s({
    trig = 'La',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.l.double'),
})

-- 必要条件3
module[#module+1] = s({
    trig = 'lla',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.l.long'),
})

-- 必要条件4
module[#module+1] = s({
    trig = 'la',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.l'),
})

-- 充分条件1
module[#module+1] = s({
    trig = 'Lra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.r.double.long'),
})

-- 充分条件2
module[#module+1] = s({
    trig = 'Ra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.r.double'),
})

-- 充分条件3
module[#module+1] = s({
    trig = 'lra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.r.long'),
})

-- 充分条件4
module[#module+1] = s({
    trig = 'ra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('arrow.r'),
})

-- 模块返回
return module

