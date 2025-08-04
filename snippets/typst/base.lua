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
    snippetType = 'autosnippet',
}, {
        t('*'), i(0, 'bold text'), t('*'),
})

-- 强调
module[#module+1] = s({
    trig = 'emph',
    snippetType = 'autosnippet',
}, {
        t('__'), i(0, 'emph text'), t('__'),
})

-- 删除线
module[#module+1] = s({
    trig = 'strike',
    snippetType = 'autosnippet',
}, {
        t('#strike['), i(0, 'strike text'), t(']'),
})

--- 文本控制
-- 一级标题
module[#module+1] = s({
    trig = 'head1',
    snippetType = 'autosnippet',
}, {
        t('= ')
})

-- 二级标题
module[#module+1] = s({
    trig = 'head2',
    snippetType = 'autosnippet',
}, {
        t('== ')
})

-- 三级标题
module[#module+1] = s({
    trig = 'head3',
    snippetType = 'autosnippet',
}, {
        t('=== ')
})

-- 四级标题
module[#module+1] = s({
    trig = 'head4',
    snippetType = 'autosnippet',
}, {
        t('==== ')
})

--- 表格
module[#module+1] = s({
    trig = 'table',
    snippetType = 'autosnippet',
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
    snippetType = 'autosnippet',
}, {
        t('#set ')
})

--- 行内代码块
module[#module+1] = s({
    trig = 'code',
    snippetType = 'autosnippet',
}, {
        t('`'), i(0, 'code content'), t('`'),
})

--- 行间代码块
module[#module+1] = s({
    trig = 'code-block',
    snippetType = 'autosnippet',
}, {
        t('```'), i(1, 'language'), t({ '', '' }),
        i(0, 'code content'),
        t({ '', '```' }),
})

--- 脚本模式
module[#module+1] = s({
    trig = '#(',
    snippetType = 'autosnippet',
}, {
        t('#('), i(0, 'script content'), t(')'),
})

module[#module+1] = s({
    trig = '#[',
    snippetType = 'autosnippet',
}, {
        t('#['), i(0, 'script content'), t(']'),
})

--- 数学模式
-- 行内
module[#module+1] = s({
    trig = 'math',
    snippetType = 'autosnippet',
}, {
        t('$'), i(0), t('$'),
})
-- 行间
module[#module+1] = s({
    trig = 'Math',
    snippetType = 'autosnippet',
}, {
        t('$ '), i(0), t(' $'),
})


-- 模块返回
return module

