--- tex
--- tex 的 elegant-note 模板 snipets

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

--- 定义环境
module[#module+1] = s({
    trig = 'definition',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'definition',
    desc = '定义环境',
}, {
        t('\\begin{definition}['), i(1), t({']', ''}),
        t('\t'), i(0),
        t({'', '\\end{definition}'}),
})

--- 定理环境
module[#module+1] = s({
    trig = 'theorem',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'theorem',
    desc = '定理环境',
}, {
        t('\\begin{theorem}['), i(1), t({']', ''}),
        t('\t'), i(0),
        t({'', '\\end{theorem}'}),
})

--- 证明环境
module[#module+1] = s({
    trig = 'theorem',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'proof',
    desc = '证明环境',
}, {
        t({'\\begin{proof}', ''}),
        t('\t'), i(0),
        t({'', '\\end{proof}'}),
})

--- 定理环境
module[#module+1] = s({
    trig = 'lemma',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'lemma',
    desc = '引理环境',
}, {
        t('\\begin{lemma}['), i(1), t({']', ''}),
        t('\t'), i(0),
        t({'', '\\end{lemma}'}),
})

--- 命题环境
module[#module+1] = s({
    trig = 'proposition',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'proposition',
    desc = '命题环境',
}, {
        t('\\begin{proposition}['), i(1), t({']', ''}),
        t('\t'), i(0),
        t({'', '\\end{proposition}'}),
})

--- 推论环境
module[#module+1] = s({
    trig = 'corollary',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'corollary',
    desc = '推论环境',
}, {
        t('\\begin{corollary}['), i(1), t({']', ''}),
        t('\t'), i(0),
        t({'', '\\end{corollary}'}),
})

--- 猜想环境
module[#module+1] = s({
    trig = 'conjecture',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'conjecture',
    desc = '猜想环境',
}, {
        t('\\begin{conjecture}['), i(1), t({']', ''}),
        t('\t'), i(0),
        t({'', '\\end{conjecture}'}),
})

--- 例子环境
module[#module+1] = s({
    trig = 'example',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'example',
    desc = '例子环境',
}, {
        t('\\begin{example}['), i(1), t({']', ''}),
        t('\t'), i(0),
        t({'', '\\end{example}'}),
})

--- 备注环境
module[#module+1] = s({
    trig = 'note',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'note',
    desc = '备注环境',
}, {
        t('\\begin{note}['), i(1), t({']', ''}),
        t('\t'), i(0),
        t({'', '\\end{note}'}),
})

--- 评论环境
module[#module+1] = s({
    trig = 'remark',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'remark',
    desc = '评论环境',
}, {
        t('\\begin{remark}['), i(1), t({']', ''}),
        t('\t'), i(0),
        t({'', '\\end{remark}'}),
})

--- 情形环境
module[#module+1] = s({
    trig = 'case',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'case',
    desc = '情形环境',
}, {
        t('\\begin{case}['), i(1), t({']', ''}),
        t('\t'), i(0),
        t({'', '\\end{case}'}),
})

--- 图片环境
module[#module+1] = s({
    trig = 'img',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'image',
    desc = '图片环境',
}, {
        t('\\begin{figure} ['), c(1, { t('H'), t('h'), t('b'), t('t'), t('p'), }), t({']', ''}),
        t({'\t\\centering', ''}),
        t('\t\\includegraphics[width=\\textwidth]{'), i(0, 'image-url'), t({'}', ''}),
        t('\t\\caption{'), i(2, 'caption'), t({'}', ''}),
        t('\t\\label{fig:'), i(3, 'fig-label'), t({'}', ''}),
        t('\\end{figure}'),
})

-- 模块返回
return module

