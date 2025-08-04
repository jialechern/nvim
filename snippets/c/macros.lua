--- c.lua
--- c 的 macros snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
-- local c = luasnip.choice_node
-- local d  = ls.dynamic_node

-- 模块定义
local module = {}

--- 宏命令

-- 宏定义
module[#module+1] = s('define', {
    t('#define '), i(0, 'macro-name')
    })

-- 注销宏定义
module[#module+1] = s('undef', {
    t('#undef '), i(0, 'macro-name')
    })

-- 宏 if 判断
module[#module+1] = s('macro-if', {
    t('# if '), i(1, 'condition'), t({'', ''}),
    t('\t'), i(0),
    t({'', '# endif'})
    })

-- 宏 if-else 判断
module[#module+1] = s('macro-if-else', {
    t('# if '), i(1, 'condition'), t({'', ''}),
    t('\t'), i(2),
    t({'', '# else', ''}),
    t('\t'), i(0),
    t({'', '# endif'})
    })

-- 宏 if-else_if 判断
module[#module+1] = s('macro-if-else_if', {
    t('# if '), i(1, 'condition'), t({'', ''}),
    t('\t'), i(2),
    t({'', '# elif '}), i(3, 'condition2'), t({'', ''}),
    t('\t'), i(0),
    t({'', '# endif'})
    })

-- 宏 if-else_if-else 判断
module[#module+1] = s('macro-if-else_if-else', {
    t('# if '), i(1, 'condition'), t({'', ''}),
    t('\t'), i(2),
    t({'', '# elif '}), i(3, 'condition2'), t({'', ''}),
    t('\t'), i(4),
    t({'', '# else', ''}),
    t('\t'), i(0),
    t({'', '# endif'})
    })

-- 宏 ifndef 判断
module[#module+1] = s('ifndef', {
    t('# ifndef '), i(1, 'macro-name'), t({'', ''}),
    t('# define '), i(2, 'macro-name'), t({'', ''}),
    t('\t'), i(0),
    t({'', '# endif'})
    })

-- 宏 ifdef 判断
module[#module+1] = s('ifdef', {
    t('# ifdef '), i(0, 'macro-name'),
    })

-- 模块返回
return module

