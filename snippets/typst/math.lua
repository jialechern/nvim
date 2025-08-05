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
    name = 'ge.eq',
    desc = '大于等于',
}, {
        t('gt.eq'),
})

-- 小于等于
module[#module+1] = s({
    trig = 'le',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'lt.eq',
    desc = '小于等于',
}, {
        t('lt.eq'),
})

-- 不等于
module[#module+1] = s({
    trig = 'ne',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'eq.not',
    desc = '不等于',
}, {
        t('eq.not'),
})

-- 等价
module[#module+1] = s({
    trig = 'sim',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'tilde',
    desc = '等价',
}, {
        t('tilde'),
})

-- 全等于1
module[#module+1] = s({
    trig = 'cong',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'tilde.eq',
    desc = '全等于1',
}, {
        t('tilde.eq'),
})

-- 全等于2
module[#module+1] = s({
    trig = '==',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'equiv',
    desc = '全等于2',
}, {
        t('equiv'),
})

-- 属于(反向)
module[#module+1] = s({
    trig = 'ni',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'in.rev',
    desc = '属于(反向)',
}, {
        t('in.rev'),
})

-- 不属于
module[#module+1] = s({
    trig = 'nin',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'in.not',
    desc = '不属于',
}, {
        t('in.not'),
})

-- 平行
module[#module+1] = s({
    trig = 'pl',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'parallel',
    desc = '平行',
}, {
        t('parallel'),
})

-- 整除
module[#module+1] = s({
    trig = '|',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'divides',
    desc = '整除',
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
    name = 'plus.minus',
    desc = '正负',
}, {
        t('plus.minus'),
})

-- 正负
module[#module+1] = s({
    trig = 'mp',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'minus.plus',
    desc = '负正',
}, {
        t('minus.plus'),
})

-- 复合
module[#module+1] = s({
    trig = 'circ',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'circ',
    desc = '复合',
}, {
        t('compose'),
})

-- 异或/直和
module[#module+1] = s({
    trig = 'op',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'xor',
    desc = '异或/直和',
}, {
        t('xor'),
})

-- 圈乘
module[#module+1] = s({
    trig = 'ot',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'times.circle',
    desc = '圈乘',
}, {
        t('times.circle'),
})

-- 分式
module[#module+1] = s({
    trig = 'frac',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'frac',
    desc = '分式',
}, {
        t('frac('), i(1), t(', '), i(2), t(')'), i(0),
})

-- 组合数
module[#module+1] = s({
    trig = 'C',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'binom',
    desc = '组合数',
}, {
        t('binom('), i(1), t(', '), i(2), t(')'), i(0),
})

--- 积分

module[#module+1] = s({
    trig = 'integral',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'integral',
    desc = '积分1',
}, {
        t('integral'),
})

module[#module+1] = s({
    trig = 'iintegral',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'integral.double',
    desc = '积分2',
}, {
        t('integral.double'),
})

module[#module+1] = s({
    trig = 'iiintegral',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'integral.triple',
    desc = '积分3',
}, {
        t('integral.triple'),
})

-- 围道积分
module[#module+1] = s({
    trig = 'ointegral',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'integral.cont',
    desc = '围道积分',
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
    name = 'forall',
    desc = '全称量词',
}, {
        t('forall'),
})

-- 存在量词
module[#module+1] = s({
    trig = 'exists',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'exists',
    desc = '存在量词',
}, {
        t('exists'),
})

-- 无穷
module[#module+1] = s({
    trig = 'infty',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'infinity',
    desc = '无穷',
}, {
        t('infinity'),
})

-- 像
module[#module+1] = s({
    trig = 'im',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'im',
    desc = '像',
}, {
        t('im'),
})

-- 核
module[#module+1] = s({
    trig = 'ker',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'ker',
    desc = '核',
}, {
        t('ker'),
})

-- 同态
module[#module+1] = s({
    trig = 'hom',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'hom',
    desc = '同态',
}, {
        t('hom'),
})

-- 绝对值
module[#module+1] = s({
    trig = 'abs',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'abs',
    desc = '绝对值',
}, {
        t('abs('), i(1), t(')'), i(0),
})

-- 根式
module[#module+1] = s({
    trig = 'sqrt',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'sqrt',
    desc = '根式',
}, {
        t('sqrt('), i(1), t(')'), i(0),
})

-- 范数
module[#module+1] = s({
    trig = 'norm',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'norm',
    desc = '范数',
}, {
        t('norm('), i(1), t(')'), i(0),
})

-- 内积
module[#module+1] = s({
    trig = 'inner',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'inner',
    desc = '内积',
}, {
        t('lr(angle.l '), i(1), t(' angle.r)'), i(0),
})

-- 矩阵
module[#module+1] = s({
    trig = 'mat',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'mat',
    desc = '矩阵',
}, {
        t('mat('), i(1), t(')'), i(0),
})

-- 分段函数/线性方程组
module[#module+1] = s({
    trig = 'cases',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'cases',
    desc = '分段函数/线性方程组',
}, {
        t('cases('), i(1), t(')'), i(0),
})

-- 模块返回
return module

