--- tex
--- tex 的 base snipets

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

--- 数学环境
-- 行内数学公式
module[#module+1] = s({
    trig = 'math',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'math',
    desc = '行内数学环境',
}, {
        t('$'), i(0, 'inline-math'), t('$'),
})

-- 行间数学公式
module[#module+1] = s({
    trig = 'Math',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Math',
    desc = '行间数学环境',
}, {
        t({'$$', ''}), i(0, 'block-math'), t({'', '$$'}),
})

--- 基本控制命令
-- 左右符号匹配
module[#module+1] = s({
    trig = 'left-right',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'left-right',
    desc = '左右符号匹配',
}, {
        t('\\left'), i(1), t('\\right)'), i(0),
})

-- 下标
module[#module+1] = s({
    trig = 'sub',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'sub',
    desc = '下标',
}, {
        t('_{'), i(1, 'sub'), t('}'), i(0),
})

-- 上标
module[#module+1] = s({
    trig = 'sup',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'sup',
    desc = '上标',
}, {
        t('^{'), i(1, 'sup'), t('}'), i(0),
})

--- 文本控制
-- 章
module[#module+1] = s({
    trig = 'chapter',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'chapter',
    desc = '章',
}, {
    t('\\chapter{'), i(1), t('}'), i(0),
})

-- 节
module[#module+1] = s({
    trig = 'section',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'section',
    desc = '节',
}, {
    t('\\section{'), i(1), t('}'), i(0),
})

-- 小节
module[#module+1] = s({
    trig = 'subsection',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'subsection',
    desc = '小节',
}, {
    t('\\subsection{'), i(1), t('}'), i(0),
})

-- 小小节
module[#module+1] = s({
    trig = 'subsubsection',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'subsubsection',
    desc = '小小节',
}, {
    t('\\subsubsection{'), i(1), t('}'), i(0),
})

-- 小小小节
module[#module+1] = s({
    trig = 'subsubsubsection',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'subsubsubsection',
    desc = '小小小节',
}, {
    t('\\subsubsubsection{'), i(1), t('}'), i(0),
})

--- 常用环境
-- 居中环境
module[#module+1] = s({
    trig = 'center',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'center',
    desc = '居中环境',
}, {
        t({'\\begin{center}', ''}),
        t('\t'), i(0),
        t({'', '\\end{center}'}),
})

-- 等式环境
module[#module+1] = s({
    trig = 'equation',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'equation',
    desc = '有标号等式环境',
}, {
        t({'\\begin{equation}', ''}),
        t('\t'), i(0),
        t({'', '\\end{equation}'}),
})

-- 无标号等式环境
module[#module+1] = s({
    trig = 'nolable-equation',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'nolable-equation',
    desc = '无标号等式环境',
}, {
        t({'\\begin{equation*}', ''}),
        t('\t'), i(0),
        t({'', '\\end{equation*}'}),
})

-- 枚举环境(有序列表)
module[#module+1] = s({
    trig = 'enumerate',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'enumerate',
    desc = '有序列表',
}, {
        t({'\\begin{enumerate}', ''}),
        t('\t\\item '), i(0),
        t({'', '\\end{enumerate}'}),
})

-- 枚举环境(无序列表)
module[#module+1] = s({
    trig = 'itemize',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'itemize',
    desc = '无序列表',
}, {
        t({'\\begin{itemize}', ''}),
        t('\t\\item '), i(0),
        t({'', '\\end{itemize}'}),
})

-- 模块返回
return module

