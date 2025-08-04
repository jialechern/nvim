--- tex
--- tex 的 base snipets

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

--- 数学环境
-- 行内数学公式
module[#module+1] = s({
    trig = 'math',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('$'), i(0, 'inline-math'), t('$'),
})

-- 行间数学公式
module[#module+1] = s({
    trig = 'Math',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t({'$$', ''}), i(0, 'block-math'), t({'', '$$'}),
})

--- 基本控制命令
-- 左右符号匹配
module[#module+1] = s({
    trig = 'left-right',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('\\left'), i(1), t('\\right)'), i(0),
})

-- 下标
module[#module+1] = s({
    trig = 'sub',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('_{'), i(1, 'sub'), t('}'), i(0),
})

-- 上标
module[#module+1] = s({
    trig = 'sup',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t('^{'), i(1, 'sup'), t('}'), i(0),
})

--- 文本控制
-- 章
module[#module+1] = s({
    trig = 'chapter',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\chapter{'), i(1), t('}'), i(0),
})

-- 节
module[#module+1] = s({
    trig = 'section',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\section{'), i(1), t('}'), i(0),
})

-- 小节
module[#module+1] = s({
    trig = 'subsection',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\subsection{'), i(1), t('}'), i(0),
})

-- 小小节
module[#module+1] = s({
    trig = 'subsubsection',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\subsubsection{'), i(1), t('}'), i(0),
})

-- 小小小节
module[#module+1] = s({
    trig = 'subsubsubsection',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
    t('\\subsubsubsection{'), i(1), t('}'), i(0),
})

--- 常用环境
-- 居中环境
module[#module+1] = s({
    trig = 'center',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t({'\\begin{center}', ''}),
        t('\t'), i(0),
        t({'', '\\end{center}'}),
})

-- 等式环境
module[#module+1] = s({
    trig = 'equation',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t({'\\begin{equation}', ''}),
        t('\t'), i(0),
        t({'', '\\end{equation}'}),
})

-- 无标号等式环境
module[#module+1] = s({
    trig = 'nolable-equation',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t({'\\begin{equation*}', ''}),
        t('\t'), i(0),
        t({'', '\\end{equation*}'}),
})

-- 枚举环境(有序列表)
module[#module+1] = s({
    trig = 'enumerate',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t({'\\begin{enumerate}', ''}),
        t('\t\\item '), i(0),
        t({'', '\\end{enumerate}'}),
})

-- 枚举环境(无序列表)
module[#module+1] = s({
    trig = 'itemize',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
}, {
        t({'\\begin{itemize}', ''}),
        t('\t\\item '), i(0),
        t({'', '\\end{itemize}'}),
})

-- 模块返回
return module

