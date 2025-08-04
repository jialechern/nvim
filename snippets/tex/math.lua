--- tex
--- tex 的 math snipets

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

--- 常见的符号配对
-- 绝对值
module[#module+1] = s({
    trig = 'abs',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\left|'), i(1), t('\\right|'), i(0),
})

-- 核
module[#module+1] = s({
    trig = 'ker',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\mathrm{ker}'),
})

-- 像
module[#module+1] = s({
    trig = 'im',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\mathrm{im}'),
})

-- 恒等映射
module[#module+1] = s({
    trig = 'id',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\mathrm{id}'),
})

-- 同态
module[#module+1] = s({
    trig = 'hom',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\mathrm{hom}'),
})

-- 维数
module[#module+1] = s({
    trig = 'dim',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\mathrm{dim}'),
})

-- 相对尺度分式
module[#module+1] = s({
    trig = 'frac',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\frac{'), i(1), t('}{'), i(2), t('}'), i(0),
})

-- 绝对尺度分式
module[#module+1] = s({
    trig = 'dfrac',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\dfrac{'), i(1), t('}{'), i(2), t('}'), i(0),
})

-- 求和
module[#module+1] = s({
    trig = 'sum',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\sum_{'), i(1), t('}'), i(0),
})

-- 极限
module[#module+1] = s({
    trig = 'lim',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\lim_{'), i(1), t('}'), i(0),
})

-- 极限
module[#module+1] = s({
    trig = 'lim',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\lim_{'), i(1), t('}'), i(0),
})

-- 必要条件1
module[#module+1] = s({
    trig = 'Lra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\Longrightarrow'),
})

-- 必要条件2
module[#module+1] = s({
    trig = 'Ra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\Rightarrow'),
})

-- 必要条件3
module[#module+1] = s({
    trig = 'lra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\longrightarrow'),
})

-- 必要条件4
module[#module+1] = s({
    trig = 'ra',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\rightarrow'),
})

-- 充分条件1
module[#module+1] = s({
    trig = 'Lla',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\Longleftarrow'),
})

-- 充分条件2
module[#module+1] = s({
    trig = 'La',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\Leftarrow'),
})

-- 充分条件3
module[#module+1] = s({
    trig = 'lla',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\longleftarrow'),
})

-- 充分条件4
module[#module+1] = s({
    trig = 'la',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\leftarrow'),
})

-- 充要条件1
module[#module+1] = s({
    trig = 'Iff',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\Longleftrightarrow'),
})

-- 充要条件2
module[#module+1] = s({
    trig = 'sIff',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\Leftrightarrow'),
})

-- 充要条件3
module[#module+1] = s({
    trig = 'iff',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\longleftrightarrow'),
})

-- 充要条件4
module[#module+1] = s({
    trig = 'siff',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\leftrightarrow'),
})

-- 上方向右箭头
module[#module+1] = s({
    trig = 'ora',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\overrightarrow{'), i(1), t('}'), i(0),
})

-- 下方向右箭头
module[#module+1] = s({
    trig = 'ura',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\underrightarrow{'), i(1), t('}'), i(0),
})

-- 上方向左箭头
module[#module+1] = s({
    trig = 'ora',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\overleftarrow{'), i(1), t('}'), i(0),
})

-- 下方向左箭头
module[#module+1] = s({
    trig = 'ura',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\underleftarrow{'), i(1), t('}'), i(0),
})

-- 上方向双箭头
module[#module+1] = s({
    trig = 'oia',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\overleftrightarrow{'), i(1), t('}'), i(0),
})

-- 下方向双箭头
module[#module+1] = s({
    trig = 'uia',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\underleftrightarrow{'), i(1), t('}'), i(0),
})

-- 平行
module[#module+1] = s({
    trig = 'pl',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\parallel'),
})

--- 希腊字母
module[#module+1] = s({
    trig = 'alpha',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\alpha'),
})

module[#module+1] = s({
    trig = 'beta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\beta'),
})

module[#module+1] = s({
    trig = 'gamma',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\gamma'),
})

module[#module+1] = s({
    trig = 'Gamma',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\Gamma'),
})

module[#module+1] = s({
    trig = 'var-phi',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\varphi'),
})

module[#module+1] = s({
    trig = 'phi',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\phi'),
})

module[#module+1] = s({
    trig = 'var-epsilon',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\varepsilon'),
})

module[#module+1] = s({
    trig = 'epsilon',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\epsilon'),
})

module[#module+1] = s({
    trig = 'delta',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\delta'),
})

module[#module+1] = s({
    trig = 'lambda',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\lambda'),
})

module[#module+1] = s({
    trig = 'Lambda',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\Lambda'),
})

--- 标准环境
-- 分段函数/线性方程组
module[#module+1] = s({
    trig = 'cases',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t({'\\left\\{', ''}),
        t({'\t\\begin{array}{c}', ''}),
        t('\t\t'), i(0),
        t({'', '\t\\end{array}', ''}),
        t('\\right.'),
})

-- 向量
module[#module+1] = s({
    trig = 'vector',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\left(\\begin{array}{c}'), i(0), t('\\end{array}\\right)'),
})

-- 矩阵
module[#module+1] = s({
    trig = 'mat',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\left(\\begin{array}{'), i(1), t({'}', ''}),
        t('\t'), i(0),
        t({'', '\\end{array}\\right)'}),
})

-- 等式排版
module[#module+1] = s({
    trig = 'aligned',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t({'\\begin{aligned}', ''}),
        t('\t'), i(0),
        t({'', '\\end{aligned}'}),
})

-- 模块返回
return module

