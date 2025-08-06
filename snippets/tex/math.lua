--- tex
--- tex 的 math snipets

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
-- 绝对值
module[#module+1] = s({
    trig = 'abs',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'abs',
    desc = '绝对值',
}, {
    t('\\left|'), i(1), t('\\right|'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'abs',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'abs',
    desc = '绝对值',
}, {
    t('\\left|'), i(1), t('\\right|'), i(0),
})

-- 核
module[#module+1] = s({
    trig = 'ker',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'ker',
    desc = '核',
}, {
        t('\\mathrm{ker}'),
})

-- 像
module[#module+1] = s({
    trig = 'im',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'im',
    desc = '像',
}, {
        t('\\mathrm{im}'),
})

-- 恒等映射
module[#module+1] = s({
    trig = 'id',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'id',
    desc = '恒等映射',
}, {
        t('\\mathrm{id}'),
})

-- 同态
module[#module+1] = s({
    trig = 'hom',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'hom',
    desc = '同态',
}, {
        t('\\mathrm{hom}'),
})

-- 维数
module[#module+1] = s({
    trig = 'dim',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'dim',
    desc = '维数',
}, {
        t('\\mathrm{dim}'),
})

-- 相对尺度分式
module[#module+1] = s({
    trig = 'frac',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'frac',
    desc = '相对尺度分式',
}, {
        t('\\frac{'), i(1), t('}{'), i(2), t('}'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'frac',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'frac',
    desc = '相对尺度分式',
}, {
        t('\\frac{'), i(1), t('}{'), i(2), t('}'), i(0),
})

-- 绝对尺度分式
module[#module+1] = s({
    trig = 'dfrac',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'dfrac',
    desc = '绝对尺度分式',
}, {
        t('\\dfrac{'), i(1), t('}{'), i(2), t('}'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'dfrac',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'dfrac',
    desc = '绝对尺度分式',
}, {
        t('\\dfrac{'), i(1), t('}{'), i(2), t('}'), i(0),
})

-- 求和
module[#module+1] = s({
    trig = 'sum',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'sum',
    desc = '求和',
}, {
        t('\\sum_{'), i(1), t('}'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'sum',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'sum',
    desc = '求和',
}, {
        t('\\sum_{'), i(1), t('}'), i(0),
})

-- 极限
module[#module+1] = s({
    trig = 'lim',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'lim',
    desc = '极限',
}, {
        t('\\lim_{'), i(1), t('}'), i(0),
})

module[#module+1] = s({
    trig = _G.Leader .. 'lim',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'lim',
    desc = '极限',
}, {
        t('\\lim_{'), i(1), t('}'), i(0),
})

-- 必要条件1
module[#module+1] = s({
    trig = 'Lra',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Longrightarrow',
    desc = '必要条件1',
}, {
    t('\\Longrightarrow'),
})

-- 必要条件2
module[#module+1] = s({
    trig = 'Ra',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Rightarrow',
    desc = '必要条件2',
}, {
    t('\\Rightarrow'),
})

-- 必要条件3
module[#module+1] = s({
    trig = 'lra',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'longrightarrow',
    desc = '必要条件3',
}, {
    t('\\longrightarrow'),
})

-- 必要条件4
module[#module+1] = s({
    trig = 'ra',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'rightarrow',
    desc = '必要条件4',
}, {
    t('\\rightarrow'),
})

-- 充分条件1
module[#module+1] = s({
    trig = 'Lla',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Longleftarrow',
    desc = '充分条件1',
}, {
    t('\\Longleftarrow'),
})

-- 充分条件2
module[#module+1] = s({
    trig = 'La',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Leftarrow',
    desc = '充分条件2',
}, {
    t('\\Leftarrow'),
})

-- 充分条件3
module[#module+1] = s({
    trig = 'lla',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'longleftarrow',
    desc = '充分条件3',
}, {
    t('\\longleftarrow'),
})

-- 充分条件4
module[#module+1] = s({
    trig = 'la',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'leftarrow',
    desc = '充分条件4',
}, {
    t('\\leftarrow'),
})

-- 充要条件1
module[#module+1] = s({
    trig = 'Iff',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Longleftrightarrow',
    desc = '充要条件1',
}, {
    t('\\Longleftrightarrow'),
})

-- 充要条件2
module[#module+1] = s({
    trig = 'sIff',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Leftrightarrow',
    desc = '充要条件2',
}, {
    t('\\Leftrightarrow'),
})

-- 充要条件3
module[#module+1] = s({
    trig = 'iff',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'longleftrightarrow',
    desc = '充要条件3',
}, {
    t('\\longleftrightarrow'),
})

-- 充要条件4
module[#module+1] = s({
    trig = 'siff',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'leftrightarrow',
    desc = '充要条件4',
}, {
    t('\\leftrightarrow'),
})

-- 上方向右箭头
module[#module+1] = s({
    trig = 'ora',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'overrightarrow',
    desc = '上方向右箭头',
}, {
    t('\\overrightarrow{'), i(1), t('}'), i(0),
})

-- 下方向右箭头
module[#module+1] = s({
    trig = 'ura',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'underrightarrow',
    desc = '下方向右箭头',
}, {
    t('\\underrightarrow{'), i(1), t('}'), i(0),
})

-- 上方向左箭头
module[#module+1] = s({
    trig = 'ora',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'overleftarrow',
    desc = '上方向左箭头',
}, {
    t('\\overleftarrow{'), i(1), t('}'), i(0),
})

-- 下方向左箭头
module[#module+1] = s({
    trig = 'ura',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'underleftarrow',
    desc = '下方向左箭头',
}, {
    t('\\underleftarrow{'), i(1), t('}'), i(0),
})

-- 上方向双箭头
module[#module+1] = s({
    trig = 'oia',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'overleftrightarrow',
    desc = '上方向双箭头',
}, {
    t('\\overleftrightarrow{'), i(1), t('}'), i(0),
})

-- 下方向双箭头
module[#module+1] = s({
    trig = 'uia',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'underleftrightarrow',
    desc = '下方向双箭头',
}, {
    t('\\underleftrightarrow{'), i(1), t('}'), i(0),
})

-- 平行
module[#module+1] = s({
    trig = 'pl',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'parallel',
    desc = '平行',
}, {
    t('\\parallel'),
})

module[#module+1] = s({
    trig = _G.Leader .. 'pl',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'parallel',
    desc = '平行',
}, {
    t('\\parallel'),
})


--- 希腊字母
module[#module+1] = s({
    trig = 'alpha',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'alpha',
    desc = '希腊字母 alpha',
}, {
    t('\\alpha'),
})

module[#module+1] = s({
    trig = 'beta',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'beta',
    desc = '希腊字母 beta',
}, {
    t('\\beta'),
})

module[#module+1] = s({
    trig = 'gamma',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'gamma',
    desc = '希腊字母 gamma',
}, {
    t('\\gamma'),
})

module[#module+1] = s({
    trig = 'Gamma',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Gamma',
    desc = '希腊字母 Gamma',
}, {
    t('\\Gamma'),
})

module[#module+1] = s({
    trig = 'var-phi',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'var-phi',
    desc = '希腊字母 phi (变量)',
}, {
    t('\\varphi'),
})

module[#module+1] = s({
    trig = 'phi',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'phi',
    desc = '希腊字母 phi',
}, {
    t('\\phi'),
})

module[#module+1] = s({
    trig = 'var-epsilon',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'var-epsilon',
    desc = '希腊字母 epsilon (变量)',
}, {
    t('\\varepsilon'),
})

module[#module+1] = s({
    trig = 'epsilon',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'epsilon',
    desc = '希腊字母 epsilon',
}, {
    t('\\epsilon'),
})

module[#module+1] = s({
    trig = 'delta',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'delta',
    desc = '希腊字母 delta',
}, {
    t('\\delta'),
})

module[#module+1] = s({
    trig = 'lambda',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'lambda',
    desc = '希腊字母 lambda',
}, {
    t('\\lambda'),
})

module[#module+1] = s({
    trig = 'Lambda',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Lambda',
    desc = '希腊字母 Lambda',
}, {
    t('\\Lambda'),
})

--- 标准环境
-- 分段函数/线性方程组
module[#module+1] = s({
    trig = 'cases',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'cases',
    desc = '分段函数/线性方程组',
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
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'vector',
    desc = '向量',
}, {
        t('\\left(\\begin{array}{c}'), i(0), t('\\end{array}\\right)'),
})

module[#module+1] = s({
    trig = _G.Leader .. 'vec',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'vector',
    desc = '向量',
}, {
        t('\\left(\\begin{array}{c}'), i(0), t('\\end{array}\\right)'),
})

-- 矩阵
module[#module+1] = s({
    trig = 'mat',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'matrix',
    desc = '矩阵',
}, {
        t('\\left(\\begin{array}{'), i(1), t({'}', ''}),
        t('\t'), i(0),
        t({'', '\\end{array}\\right)'}),
})

module[#module+1] = s({
    trig = _G.Leader .. 'mat',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = 'matrix',
    desc = '矩阵',
}, {
        t('\\left(\\begin{array}{'), i(1), t({'}', ''}),
        t('\t'), i(0),
        t({'', '\\end{array}\\right)'}),
})

-- 等式排版
module[#module+1] = s({
    trig = 'aligned',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'aligned',
    desc = '等式排版',
}, {
        t({'\\begin{aligned}', ''}),
        t('\t'), i(0),
        t({'', '\\end{aligned}'}),
})

-- 模块返回
return module

