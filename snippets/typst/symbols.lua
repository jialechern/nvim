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
    name = 'bb',
    desc = '双线体字母',
}, {
    t('bb('), i(1), t(')'), i(0),
})

--- 花字母
module[#module+1] = s({
    trig = 'cal',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'cal',
    desc = '花体字母',
}, {
    t('cal('), i(1), t(')'), i(0),
})

--- 希腊字母
module[#module+1] = s({
    trig = 'alpha',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'alpha',
    desc = '希腊字母 alpha',
}, {
    t('alpha'),
})

module[#module+1] = s({
    trig = 'beta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'beta',
    desc = '希腊字母 beta',
}, {
    t('beta'),
})

module[#module+1] = s({
    trig = 'gamma',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'gamma',
    desc = '希腊字母 gamma',
}, {
    t('gamma'),
})

module[#module+1] = s({
    trig = 'Gamma',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Gamma',
    desc = '希腊字母 Gamma',
}, {
    t('Gamma'),
})

module[#module+1] = s({
    trig = 'phi',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'phi',
    desc = '希腊字母 phi',
}, {
    t('phi.alt'),
})

module[#module+1] = s({
    trig = 'var-phi',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'var-phi',
    desc = '希腊字母 phi (变量)',
}, {
    t('phi'),
})

module[#module+1] = s({
    trig = 'Phi',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Phi',
    desc = '希腊字母 Phi',
}, {
    t('Phi'),
})

module[#module+1] = s({
    trig = 'delta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'delta',
    desc = '希腊字母 delta',
}, {
    t('delta'),
})

module[#module+1] = s({
    trig = 'Delta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Delta',
    desc = '希腊字母 Delta',
}, {
    t('Delta'),
})

module[#module+1] = s({
    trig = 'epsilon',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'epsilon',
    desc = '希腊字母 epsilon',
}, {
    t('epsilon.alt'),
})

module[#module+1] = s({
    trig = 'var-epsilon',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'var-epsilon',
    desc = '希腊字母 epsilon (变量)',
}, {
    t('epsilon'),
})

module[#module+1] = s({
    trig = 'lambda',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'lambda',
    desc = '希腊字母 lambda',
}, {
    t('lambda'),
})

module[#module+1] = s({
    trig = 'Lambda',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Lambda',
    desc = '希腊字母 Lambda',
}, {
    t('Lambda'),
})

module[#module+1] = s({
    trig = 'omega',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'omega',
    desc = '希腊字母 omega',
}, {
    t('omega'),
})

module[#module+1] = s({
    trig = 'Omega',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Omega',
    desc = '希腊字母 Omega',
}, {
    t('Omega'),
})

module[#module+1] = s({
    trig = 'sigma',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'sigma',
    desc = '希腊字母 sigma',
}, {
    t('sigma'),
})

module[#module+1] = s({
    trig = 'Sigma',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Sigma',
    desc = '希腊字母 Sigma',
}, {
    t('Sigma'),
})

module[#module+1] = s({
    trig = 'tau',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'tau',
    desc = '希腊字母 tau',
}, {
    t('tau'),
})

module[#module+1] = s({
    trig = 'theta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'theta',
    desc = '希腊字母 theta',
}, {
    t('theta'),
})

module[#module+1] = s({
    trig = 'Theta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Theta',
    desc = '希腊字母 Theta',
}, {
    t('Theta'),
})

module[#module+1] = s({
    trig = 'var-theta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'var-theta',
    desc = '希腊字母 theta (变量)',
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
    name = '^',
    desc = '上标',
}, {
        t('^('), i(1), t(')'), i(0),
})

module[#module+1] = s({
    trig = '_',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '_',
    desc = '下标',
}, {
        t('_('), i(1), t(')'), i(0),
})

-- 上横线
module[#module+1] = s({
    trig = 'overline',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'overline',
    desc = '上横线',
}, {
        t('overline('), i(1), t(')'), i(0),
})

-- 下横线
module[#module+1] = s({
    trig = 'underline',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'underline',
    desc = '下横线',
}, {
        t('underline('), i(1), t(')'), i(0),
})

-- 上括号
module[#module+1] = s({
    trig = 'overbrace',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'overbrace',
    desc = '上括号',
}, {
        t('overbrace('), i(1), t(')'), i(0),
})

-- 下括号
module[#module+1] = s({
    trig = 'underbrace',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'underbrace',
    desc = '下括号',
}, {
        t('underbrace('), i(1), t(')'), i(0),
})

-- 上尖括号
module[#module+1] = s({
    trig = 'hat',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'hat',
    desc = '上尖括号',
}, {
        t('hat('), i(1), t(')'), i(0),
})

-- 上倒尖括号
module[#module+1] = s({
    trig = 'cohat',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'cohat',
    desc = '上倒尖括号',
}, {
        t('caron('), i(1), t(')'), i(0),
})

-- 上波浪号
module[#module+1] = s({
    trig = 'tilde',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'tilde',
    desc = '上波浪号',
}, {
        t('tilde('), i(1), t(')'), i(0),
})

-- 上标向右箭头
module[#module+1] = s({
    trig = 'arrow',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow',
    desc = '上标向右箭头',
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
    name = 'arrow.l.r.double.long',
    desc = '充要条件1',
}, {
        t('arrow.l.r.double.long'),
})

-- 充要条件2
module[#module+1] = s({
    trig = 'sIff',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.l.r.double',
    desc = '充要条件2',
}, {
        t('arrow.l.r.double'),
})

-- 充要条件3
module[#module+1] = s({
    trig = 'iff',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.l.r.long',
    desc = '充要条件3',
}, {
        t('arrow.l.r.long'),
})

-- 充要条件4
module[#module+1] = s({
    trig = 'siff',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.l.r',
    desc = '充要条件4',
}, {
        t('arrow.l.r'),
})

-- 元素对应
module[#module+1] = s({
    trig = 'mapsto',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.r.bar',
    desc = '元素对应',
}, {
        t('arrow.r.bar'),
})

-- 元素对应(加长)
module[#module+1] = s({
    trig = 'lmapsto',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.l.long.bar',
    desc = '元素对应(加长)',
}, {
        t('arrow.r.long.bar'),
})

-- 必要条件1
module[#module+1] = s({
    trig = 'Lla',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.l.double.long',
    desc = '必要条件1',
}, {
        t('arrow.l.double.long'),
})

-- 必要条件2
module[#module+1] = s({
    trig = 'La',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.l.double',
    desc = '必要条件2',
}, {
        t('arrow.l.double'),
})

-- 必要条件3
module[#module+1] = s({
    trig = 'lla',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.l.long',
    desc = '必要条件3',
}, {
        t('arrow.l.long'),
})

-- 必要条件4
module[#module+1] = s({
    trig = 'la',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.l',
    desc = '必要条件4',
}, {
        t('arrow.l'),
})

-- 充分条件1
module[#module+1] = s({
    trig = 'Lra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.r.double.long',
    desc = '充分条件1',
}, {
        t('arrow.r.double.long'),
})

-- 充分条件2
module[#module+1] = s({
    trig = 'Ra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.r.double',
    desc = '充分条件2',
}, {
        t('arrow.r.double'),
})

-- 充分条件3
module[#module+1] = s({
    trig = 'lra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.r.long',
    desc = '充分条件3',
}, {
        t('arrow.r.long'),
})

-- 充分条件4
module[#module+1] = s({
    trig = 'ra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'arrow.r',
    desc = '充分条件4',
}, {
        t('arrow.r'),
})

-- 模块返回
return module

