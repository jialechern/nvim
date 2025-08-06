--- toml
--- rust-workspace.lua

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

--- Rust 工作空间初始化
module[#module+1] = s({
    trig = 'rust-workspace-init',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'rust-workspace-init',
    desc = 'Rust 工作空间初始化',
}, {
        t({'[workspace]', ''}),
        t({'\tmembers = [', ''}),
        t('\t\t'), i(0, 'member'), t({',', ''}),
        t('\t]'),
})

-- 模块返回
return module

