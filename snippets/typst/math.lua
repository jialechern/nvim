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

--- 二元关系

-- 大于等于
module[#module+1] = s({
    trig = 'ge',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('gt.eq'),
})

-- 小于等于
module[#module+1] = s({
    trig = 'le',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('lt.eq'),
})

-- 不等于
module[#module+1] = s({
    trig = 'ne',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('eq.not'),
})

-- 等价
module[#module+1] = s({
    trig = 'sim',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('tilde'),
})

-- 全等于1
module[#module+1] = s({
    trig = 'cong',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('tilde.eq'),
})

-- 全等于2
module[#module+1] = s({
    trig = '==',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('equiv'),
})

-- 属于(反向)
module[#module+1] = s({
    trig = 'ni',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('in.rev'),
})

-- 不属于
module[#module+1] = s({
    trig = 'nin',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('in.not'),
})

-- 平行
module[#module+1] = s({
    trig = 'pl',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('parallel'),
})

-- 整除
module[#module+1] = s({
    trig = '|',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('divides'),
})

--- 二元运算

-- 正负
module[#module+1] = s({
    trig = 'pm',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('plus.minus'),
})

-- 正负
module[#module+1] = s({
    trig = 'mp',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('minus.plus'),
})

-- 复合
module[#module+1] = s({
    trig = 'circ',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('compose'),
})

-- 异或/直和
module[#module+1] = s({
    trig = 'op',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('xor'),
})

-- 圈乘
module[#module+1] = s({
    trig = 'ot',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('times.circle'),
})

-- 分式
module[#module+1] = s({
    trig = 'frac',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('frac('), i(1), t(', '), i(2), t(')'), i(0),
})

-- 组合数
module[#module+1] = s({
    trig = 'C',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('binom('), i(1), t(', '), i(2), t(')'), i(0),
})

--- 积分

module[#module+1] = s({
    trig = 'integral',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('integral'),
})

module[#module+1] = s({
    trig = 'iintegral',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('integral.double'),
})

module[#module+1] = s({
    trig = 'iiintegral',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('integral.triple'),
})

-- 围道积分
module[#module+1] = s({
    trig = 'ointegral',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('integral.cont'),
})

--- 其它符号
-- 全称量词
module[#module+1] = s({
    trig = 'forall',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('forall'),
})

-- 存在量词
module[#module+1] = s({
    trig = 'exists',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('exists'),
})

-- 无穷
module[#module+1] = s({
    trig = 'infty',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('infinity'),
})

-- 像
module[#module+1] = s({
    trig = 'im',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('im'),
})

-- 核
module[#module+1] = s({
    trig = 'ker',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('ker'),
})

-- 同态
module[#module+1] = s({
    trig = 'hom',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('hom'),
})

-- 绝对值
module[#module+1] = s({
    trig = 'abs',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('abs('), i(1), t(')'), i(0),
})

-- 根式
module[#module+1] = s({
    trig = 'sqrt',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('sqrt('), i(1), t(')'), i(0),
})

-- 范数
module[#module+1] = s({
    trig = 'norm',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('norm('), i(1), t(')'), i(0),
})

-- 内积
module[#module+1] = s({
    trig = 'inner',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('lr(angle.l '), i(1), t(' angle.r)'), i(0),
})

-- 矩阵
module[#module+1] = s({
    trig = 'mat',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('mat('), i(1), t(')'), i(0),
})

-- 分段函数/线性方程组
module[#module+1] = s({
    trig = 'cases',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('cases('), i(1), t(')'), i(0),
})

-- 模块返回
return module

