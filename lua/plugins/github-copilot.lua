-- github-copilot.lua

return {
    'github/copilot.vim',            -- 插件仓库地址
    -- 设置为 lazy 加载, 只有在文件类型完成加载后才加载
    event = 'FileType',
    config = function()
    -- 禁用 Copilot 默认把 <Tab> 映射为“接受建议”
    vim.g.copilot_no_tab_map = true

    -- 禁用 Copilot 的预览窗口（如果你不喜欢浮窗干扰）
    vim.g.copilot_enable_preview = false

    -- 引入自定义映射函数
    local map = require('utils.map').map
    local map_by_modes = require('utils.map').map_by_modes

    -- 插入模式：Ctrl+e 接受建议
    map_by_modes({ 'i', 'n' }, '<C-e>', function ()
        return vim.fn["copilot#Accept"]('<CR>')
    end, {
        expr = true,
        silent = true,
        script = true,
        replace_keycodes = false
    })

    -- 插入模式：Ctrl+n 跳到下一条建议
    map('i', '<C-n>', function ()
        return vim.fn["copilot#Next"]()
    end, {
        expr = true,
        silent = true,
        script = true,
        replace_keycodes = false
    })

    -- 插入模式：Ctrl+p 跳到上一条建议
    map('i', '<C-p>', function ()
        return vim.fn["copilot#Previous"]()
    end, {
        expr = true,
        silent = true,
        script = true,
        replace_keycodes = false
    })

    end,  -- 注意这里的逗号
}





