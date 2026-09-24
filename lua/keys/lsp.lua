--- lsp.lua
--- LSP / 补全 / snippet 相关按键 (lsp_leader 命名空间)
---
--- 说明: 前 13 个键由 settings/lsp.lua 在 LspAttach 时注册(buffer-local),
---       open_hint/close_hint 由 blink-cmp 的补全菜单消费,
---       snippet_* 由 luasnip 与 blink-cmp 共同消费。

local lsp_leader = '<C-' .. (vim.g.maplocalleader or '\\') .. '>'

--- snippet 跳转类按键在多个模式下可用
---@param lhs string
---@param desc string
---@return KeySpec
local function snippet_key(lhs, desc)
    return { lhs = lhs, desc = desc, modes = { 'i', 'n', 'x', 's', 'v', 'o' } }
end

---@class Keys.Lsp
---@field lsp_leader string          -- 命名空间前缀
---@field format KeySpec             -- 格式化
---@field goto_def KeySpec           -- 跳转定义
---@field goto_dec KeySpec           -- 跳转声明
---@field goto_ref KeySpec           -- 查找引用
---@field goto_impl KeySpec          -- 跳转实现
---@field show_doc KeySpec           -- 悬停文档
---@field rename KeySpec             -- 重命名
---@field code_action KeySpec        -- 代码操作
---@field goto_next_diag KeySpec     -- 下一个诊断
---@field goto_prev_diag KeySpec     -- 上一个诊断
---@field doc_in_new_window KeySpec  -- 浮窗显示完整诊断
---@field setloclist KeySpec         -- 诊断推送到 location list
---@field type_hint KeySpec          -- 参数提示开关
---@field doc KeySpec                -- 诊断显示开关
---@field open_hint KeySpec          -- 打开补全菜单
---@field close_hint KeySpec         -- 关闭补全菜单
---@field snippet_forward KeySpec    -- 展开/下一节点
---@field snippet_backward KeySpec   -- 上一节点
---@field snippet_clear KeySpec      -- 清除 snippet
---@field snippet_choice KeySpec     -- 切换可选项

---@type Keys.Lsp
local module = {
    lsp_leader = lsp_leader,

    format = { lhs = lsp_leader .. 'f', desc = '格式化当前缓冲区' },
    goto_def = { lhs = lsp_leader .. 'gd', desc = '跳转到定义' },
    goto_dec = { lhs = lsp_leader .. 'gD', desc = '跳转到声明' },
    goto_ref = { lhs = lsp_leader .. 'gr', desc = '查找引用' },
    goto_impl = { lhs = lsp_leader .. 'gi', desc = '跳转到实现' },
    show_doc = { lhs = lsp_leader .. 'd', desc = '浮窗显示符号文档' },
    rename = { lhs = lsp_leader .. 'r', desc = '重命名符号' },
    code_action = { lhs = lsp_leader .. 'ca', desc = '代码操作' },
    goto_next_diag = { lhs = lsp_leader .. 'n', desc = '跳转到下一个诊断' },
    goto_prev_diag = { lhs = lsp_leader .. 'p', desc = '跳转到上一个诊断' },
    doc_in_new_window = { lhs = lsp_leader .. 'w', desc = '浮窗显示完整诊断信息' },
    setloclist = { lhs = lsp_leader .. 'q', desc = '把当前缓冲区诊断推送到 location list' },
    type_hint = { lhs = lsp_leader .. 't', desc = '开/关参数提示(inlay hints)' },
    doc = { lhs = lsp_leader .. 'D', desc = '开/关诊断显示' },
    open_hint = { lhs = lsp_leader .. 'o', desc = '打开补全菜单' },
    close_hint = { lhs = lsp_leader .. 'x', desc = '关闭补全菜单' },

    snippet_forward = snippet_key('<C-.>', '展开 snippet 或跳转到下一个节点'),
    snippet_backward = snippet_key('<C-,>', '跳转到上一个 snippet 节点'),
    snippet_clear = snippet_key('<C-c>', '清除当前 snippet'),
    snippet_choice = snippet_key("<C-'>", '切换 snippet 的可选项'),
}

return module