--- markdown
--- markdown 的 base snipets

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

--- 字体控制
-- 加粗
module[#module+1] = s({
    trig = 'bold',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '加粗',
    desc = '加粗文本',
}, {
        t('*'), i(0, 'bold-text'), t('*'),
})

module[#module+1] = s({
    trig = _G.Leader .. '*',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '加粗',
    desc = '加粗文本',
}, {
        t('*'), i(0, 'bold-text'), t('*'),
})

-- 删除线
module[#module+1] = s({
    trig = 'strike',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '删除线',
    desc = '删除线文本',
}, {
        t('~~'), i(0, 'strike-text'), t('~~'),
})

module[#module+1] = s({
    trig = _G.Leader .. 'd',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '删除线',
    desc = '删除线文本',
}, {
        t('~~'), i(0, 'strike-text'), t('~~'),
})

-- 斜体
module[#module+1] = s({
    trig = 'italic',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '斜体',
    desc = '斜体文本',
}, {
        t('__'), i(0, 'italic-text'), t('__'),
})

module[#module+1] = s({
    trig = _G.Leader .. '_',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '斜体',
    desc = '斜体文本',
}, {
        t('__'), i(0, 'italic-text'), t('__'),
})

-- 加粗斜体
module[#module+1] = s({
    trig = 'bold-italic',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '加粗斜体',
    desc = '加粗斜体文本',
}, {
        t('***'), i(0, 'bold-italic-text'), t('***'),
})

--- 文本控制

-- 加粗斜体
module[#module+1] = s({
    trig = 'new-line',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '新行',
    desc = '新行',
}, {
        t({'', ''}), t('<br>'), t({'', ''}),
})

-- 段落
module[#module+1] = s({
    trig = 'new-paragraph',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '新段落',
    desc = '新段落',
}, {
        t('<p>'), i(0, 'paragraph-text'), t('</p>'),
})

-- 引用
module[#module+1] = s({
    trig = 'reference',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '引用',
    desc = '引用文本',
}, {
        t('> '), i(0, 'ref-text')
})

-- 链接1
module[#module+1] = s({
    trig = 'link',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '链接',
    desc = '链接',
}, {
        t('['), i(1, 'link-text'), t(']('), i(0, 'link-url'), t(')'),
})

module[#module+1] = s({
    trig = _G.Leader .. 'l',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '链接',
    desc = '链接',
}, {
        t('['), i(1, 'link-text'), t(']('), i(0, 'link-url'), t(')'),
})

-- 链接1
module[#module+1] = s({
    trig = '@',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '链接',
    desc = '链接',
}, {
        t('<'), i(0, 'link-text'), t('>'),
})

module[#module+1] = s({
    trig = _G.Leader .. '@',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '链接',
    desc = '链接',
}, {
        t('<'), i(0, 'link-text'), t('>'),
})

-- 图片
module[#module+1] = s({
    trig = 'img',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '图片',
    desc = '图片',
}, {
        t('!['), i(1, 'image-text'), t(']('), i(0, 'image-url'), t(')'),
})

module[#module+1] = s({
    trig = _G.Leader .. 'img',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '图片',
    desc = '图片',
}, {
        t('!['), i(1, 'image-text'), t(']('), i(0, 'image-url'), t(')'),
})

-- 页面分隔线
module[#module+1] = s({
    trig = 'page-split-line',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '页面分隔线',
    desc = '页面分隔线',
}, {
        t({'---', ''}),
        i(0),
})

--- 标题
-- 一级标题
module[#module+1] = s({
    trig = 'head1',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '一级标题',
    desc = '一级标题',
}, {
        t('# '),
})

module[#module+1] = s({
    trig = _G.LocalLeader .. '1',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '一级标题',
    desc = '一级标题',
}, {
        t('# '),
})

-- 二级标题
module[#module+1] = s({
    trig = 'head2',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '二级标题',
    desc = '二级标题',
}, {
        t('## '),
})

module[#module+1] = s({
    trig = _G.LocalLeader .. '2',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '二级标题',
    desc = '二级标题',
}, {
        t('## '),
})

-- 三级标题
module[#module+1] = s({
    trig = 'head3',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '三级标题',
    desc = '三级标题',
}, {
        t('### '),
})

module[#module+1] = s({
    trig = _G.LocalLeader .. '3',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '三级标题',
    desc = '三级标题',
}, {
        t('### '),
})

-- 四级标题
module[#module+1] = s({
    trig = 'head4',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '四级标题',
    desc = '四级标题',
}, {
        t('#### '),
})

module[#module+1] = s({
    trig = _G.LocalLeader .. '4',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '四级标题',
    desc = '四级标题',
}, {
        t('#### '),
})

--- 代码块
-- 行内代码块
module[#module+1] = s({
    trig = 'code',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '行内代码块',
    desc = '行内代码块',
}, {
        t('`'), i(0, 'inline-code'), t('`'),
})

module[#module+1] = s({
    trig = _G.Leader .. 'c',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '行内代码块',
    desc = '行内代码块',
}, {
        t('`'), i(0, 'inline-code'), t('`'),
})

-- 行间代码块
module[#module+1] = s({
    trig = 'code-block',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '行间代码块',
    desc = '行间代码块',
}, {
        t('```'), i(1, 'language'), t({'', ''}),
        i(0, 'code-block-text'), t({'', '```'}),
})

module[#module+1] = s({
    trig = _G.Leader .. 'C',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '行间代码块',
    desc = '行间代码块',
}, {
        t('```'), i(1, 'language'), t({'', ''}),
        i(0, 'code-block-text'), t({'', '```'}),
})

--- 数学环境
-- 行内数学公式
module[#module+1] = s({
    trig = 'math',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '行内数学公式',
    desc = '行内数学公式',
}, {
        t('$'), i(0, 'inline-math'), t('$'),
})

module[#module+1] = s({
    trig = _G.Leader .. '$',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '行内数学公式',
    desc = '行内数学公式',
}, {
        t('$'), i(0, 'inline-math'), t('$'),
})

-- 行间数学公式
module[#module+1] = s({
    trig = 'Math',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = '行间数学公式',
    desc = '行间数学公式',
}, {
        t({'$$', ''}), i(0, 'block-math'), t({'', '$$'}),
})

module[#module+1] = s({
    trig = _G.LocalLeader .. '$',
    -- wordTrig  = true,
    -- regTrig   = false,
    snippetType = 'autosnippet',
    name = '行间数学公式',
    desc = '行间数学公式',
}, {
        t({'$$', ''}), i(0, 'block-math'), t({'', '$$'}),
})

-- 模块返回
return module

