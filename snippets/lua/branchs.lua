--- lua.lua
--- lua 的 branchs snipets

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

--- 分支型语句
local branch_keys = require('settings.variables.branchs').branch_keys

module[#module+1] = s(branch_keys['if'], {
    t('if '), i(1, 'condition'), t({ ' then', '' }),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

module[#module+1] = s(branch_keys['if-else'], {
    t('if '), i(1, 'condition1'), t({ ' then', '' }),
    t('\t'), i(2),
    t({ '', 'else', '' }),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

module[#module+1] = s(branch_keys['if-else_if'], {
    t('if '), i(1, 'condition1'), t({ ' then', '' }),
    t('\t'), i(2),
    t({ '', 'elseif '}), i(3, 'condition2'), t({ ' then', '' }),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

module[#module+1] = s(branch_keys['if-else_if-else'], {
    t('if '), i(1, 'condition1'), t({ ' then', '' }),
    t('\t'), i(2),
    t({ '', 'elseif '}), i(3, 'condition2'), t({ ' then', '' }),
    t('\t'), i(4),
    t({ '', 'else', '' }),
    t('\t'), i(0),
    t({ '', 'end' }),
    })

-- 模块返回
return module

