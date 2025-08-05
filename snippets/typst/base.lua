--- typst
--- typst 的 base snipets

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

--- 字词修饰
-- 加粗
module[#module+1] = s({
    trig = 'bold',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'bold',
    desc = '加粗',
}, {
        t('*'), i(0, 'bold text'), t('*'),
})

-- 强调
module[#module+1] = s({
    trig = 'emph',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'emph',
    desc = '强调',
}, {
        t('__'), i(0, 'emph text'), t('__'),
})

-- 删除线
module[#module+1] = s({
    trig = 'strike',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'strike',
    desc = '删除线',
}, {
        t('#strike['), i(0, 'strike text'), t(']'),
})

--- 文本控制
-- 一级标题
module[#module+1] = s({
    trig = 'head1',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'head1',
    desc = '一级标题',
}, {
        t('= ')
})

-- 二级标题
module[#module+1] = s({
    trig = 'head2',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'head2',
    desc = '二级标题',
}, {
        t('== ')
})

-- 三级标题
module[#module+1] = s({
    trig = 'head3',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'head3',
    desc = '三级标题',
}, {
        t('=== ')
})

-- 四级标题
module[#module+1] = s({
    trig = 'head4',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'head4',
    desc = '四级标题',
}, {
        t('==== ')
})

--- 表格
module[#module+1] = s({
    trig = 'table',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'table',
    desc = '表格',
}, {
        t('#table(columns: '), i(1, 'columns'), t(', align: '), c(2, {
            t('center'),
            t('left'),
            t('right'),
            t('bottom'),
            t('top'),
            t('horizon'),
        }), t({', ', ''}),
        i(0, 'table content'),
        t({'', ')'}),
})

--- 设置默认值
module[#module+1] = s({
    trig = 'set',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'set',
    desc = '设置默认值',
}, {
        t('#set ')
})

--- 行内代码块
module[#module+1] = s({
    trig = 'code',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'code',
    desc = '行内代码块',
}, {
        t('`'), i(0, 'code content'), t('`'),
})

--- 行间代码块
module[#module+1] = s({
    trig = 'code-block',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'code-block',
    desc = '行间代码块',
}, {
        t('```'), i(1, 'language'), t({ '', '' }),
        i(0, 'code content'),
        t({ '', '```' }),
})

--- 脚本模式
module[#module+1] = s({
    trig = '#(',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'script1',
    desc = '脚本模式1',
}, {
        t('#('), i(0, 'script content'), t(')'),
})

module[#module+1] = s({
    trig = '#[',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'script2',
    desc = '脚本模式2',
}, {
        t('#['), i(0, 'script content'), t(']'),
})

--- 数学模式
-- 行内
module[#module+1] = s({
    trig = 'math',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'math',
    desc = '行内数学模式',
}, {
        t('$'), i(0), t('$'),
})
-- 行间
module[#module+1] = s({
    trig = 'Math',
    wordTrig  = true,
    regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'Math',
    desc = '行间数学模式',
}, {
        t('$ '), i(0), t(' $'),
})


-- 模块返回
return module

