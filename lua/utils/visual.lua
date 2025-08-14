--- visual.lua
--- 存放 visual 模式下的自定义工具函数

local module = {}

-- 引入 luasnip 中的基本对象
local luasnip = require('luasnip')
-- local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node
-- local i = luasnip.insert_node
-- local d = luasnip.dynamic_node

---@function get_visual(_, snip)
---这是一个能够返回被 store_selection_keys 选中的文本的函数
local function get_visual(args, snip, old_state)
    local selected = ''

    -- 优先从 snip.env 取（当 expand 时通常存在）
    if snip and snip.env and snip.env.LS_SELECT_RAW then
        selected = snip.env.LS_SELECT_RAW
    end

    return sn(nil, t(selected))
end

module.get_visual = get_visual

return module


