-- lualine.lua
return {
    'nvim-lualine/lualine.nvim',
    -- 进入 neovim 时加载 lualine
    event = 'VimEnter',
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,          -- 启用图标（需要安装 nerd 字体）
                theme = 'auto',                -- 自动匹配当前 colorscheme
                component_separators = { left = '', right = ''},  -- 组件分隔符
                section_separators = { left = '', right = ''},    -- 区域分隔符
                disabled_filetypes = {         -- 禁用状态栏的文件类型
                    'NvimTree',
                    'packer',
                    'toggleterm'
                },
                always_divide_middle = true,   -- 总是分割中间区域
                globalstatus = true,           -- 全局状态栏（Neovim 0.7+）
            },
        sections = {
            lualine_a = {'mode'},          -- 左侧区域 A：模式指示器
            lualine_b = {'branch', 'diff', 'diagnostics'}, -- 左侧区域 B：Git分支、差异、诊断
            lualine_c = {'filename'},      -- 左侧区域 C：文件名
            lualine_x = {'encoding', 'fileformat', 'filetype'}, -- 右侧区域 X：编码、文件格式、文件类型
            lualine_y = {'progress'},      -- 右侧区域 Y：进度百分比
            lualine_z = {'location'}       -- 右侧区域 Z：行号列号
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},      -- 非活动窗口显示文件名
            lualine_x = {'location'},      -- 非活动窗口显示位置
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},                    -- 标签栏配置
        extensions = {'nvim-tree', 'fugitive'} -- 扩展支持
        })
    end
}
