--- @module 'colorscheme'
--- 配置 neovim 的配色方案

return {
    "folke/tokyonight.nvim",
    event = 'VimEnter',
    priority = 1000,
    opts = {},
    config = function(_, opts)
        -- 设置配色方案
        require('tokyonight').setup({
            style = 'night',  -- 可选 'storm', 'day', 'night', 'moon'
            transparent = true,  -- 是否透明背景
            terminal_colors = true,  -- 是否启用终端颜色
            styles = {
                comments = { italic = true },  -- 注释样式
                keywords = { italic = true },  -- 关键字样式
                functions = { bold = true },  -- 函数样式
            },
        })

        -- 应用配色方案
        vim.cmd('colorscheme tokyonight')
    end,
}
