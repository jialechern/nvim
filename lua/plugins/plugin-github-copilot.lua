-- - github-copilot.lua

return {
    "github/copilot.vim",            -- 插件仓库地址
    config = function()
    -- 禁用 Copilot 默认把 <Tab> 映射为“接受建议”
    vim.g.copilot_no_tab_map = true

    -- 禁用 Copilot 的预览窗口（如果你不喜欢浮窗干扰）
    vim.g.copilot_enable_preview = false

    -- 插入模式：Ctrl+e 接受建议
    vim.api.nvim_set_keymap("i", "<C-e>", 'copilot#Accept("<CR>")', {
        expr = true,
        silent = true,
        script = true,
        replace_keycodes = false
    })

    vim.api.nvim_set_keymap("n", "<C-e>", 'copilot#Accept("<CR>")', {
        expr = true,
        silent = true,
        script = true,
        replace_keycodes = false
    })

    -- 插入模式：Ctrl+n 跳到下一条建议
    vim.api.nvim_set_keymap("i", "<C-n>", 'copilot#Next()', {
        expr = true,
        silent = true,
        script = true,
        replace_keycodes = false
    })
    
    -- 插入模式：Ctrl+p 跳到上一条建议
    vim.api.nvim_set_keymap("i", "<C-p>", 'copilot#Previous()', {
        expr = true,
        silent = true,
        script = true,
        replace_keycodes = false
    })

    end,  -- 注意这里的逗号
}





