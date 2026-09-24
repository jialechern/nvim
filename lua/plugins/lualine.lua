vim.cmd.packadd('lualine.nvim')

local colors = require('settings.consts').colors

-- 基于 Catppuccin Mocha 调色板的状态栏主题
-- 每一段都定义了 fg（前景/文字色）和 bg（背景/底色），gui 用于加粗
local theme = {
    normal = {
        a = { fg = colors.bg0, bg = colors.purple, gui = 'bold' }, -- 模式名: 深色底 on mauve 紫（Catppuccin 标志色）
        b = { fg = colors.fg1, bg = colors.bg2 },                  -- 主体信息: 亮文字 on 中等深色底
        c = { fg = colors.fg3, bg = 'NONE' },                       -- 左侧填充: 次要文字, 透明底
        z = { fg = colors.bg0, bg = colors.purple },                -- 位置/进度: 与 a 对称
    },
    insert = { a = { fg = colors.bg0, bg = colors.green, gui = 'bold' } },   -- 插入模式: 绿色
    visual = { a = { fg = colors.bg0, bg = colors.orange, gui = 'bold' } },  -- 可视模式: 暖橙色
    replace = { a = { fg = colors.bg0, bg = colors.red, gui = 'bold' } },    -- 替换模式: 警示红
    command = { a = { fg = colors.bg0, bg = colors.frost4, gui = 'bold' } }, -- 命令模式: 蓝色
    terminal = { a = { fg = colors.bg0, bg = colors.frost1, gui = 'bold' } },-- 终端模式: 青绿色
    inactive = {                                                            -- 非当前窗口: 整体变暗
        a = { fg = colors.fg3, bg = colors.bg1 },
        b = { fg = colors.fg3, bg = colors.bg1 },
        c = { fg = colors.fg3, bg = 'NONE' },
    },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
    self.status = ''
    self.applied_separator = ''
    self:apply_highlights(default_highlight)
    self:apply_section_separators()
    return self.status
end

local function process_sections(sections)
    for name, section in pairs(sections) do
        local left = name:sub(9, 10) < 'x'
        for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
            table.insert(section, pos * 2, { empty, color = { fg = colors.bg2, bg = colors.bg2 } })
        end
        for id, comp in ipairs(section) do
            if type(comp) ~= 'table' then
                comp = { comp }
                section[id] = comp
            end
            comp.separator = left and { right = '' } or { left = '' }
        end
    end
    return sections
end

local function search_result()
    if vim.v.hlsearch == 0 then
        return ''
    end
    local last_search = vim.fn.getreg('/')
    if not last_search or last_search == '' then
        return ''
    end
    local searchcount = vim.fn.searchcount({ maxcount = 9999 })
    return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
    if vim.bo.modified then
        return '+'
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
        return '-'
    end
    return ''
end

require('lualine').setup({
    options = {
        theme = theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
    },
    sections = process_sections({
        lualine_a = { 'mode' },
        lualine_b = {
            'branch',
            'diff',
            {
                'diagnostics',
                -- 选项名是复数 sources; 取值见 lualine 的 components/diagnostics/sources.lua:
                -- nvim_diagnostic / nvim_workspace_diagnostic / nvim_lsp / coc / ale / vim_lsp
                sources = { 'nvim_diagnostic' },
                -- 一个组件里画 error / warn 两段, 省一次取诊断的开销
                sections = { 'error', 'warn' },
                diagnostics_color = {
                    error = { bg = colors.red, fg = colors.fg1 },
                    warn = { bg = colors.orange, fg = colors.fg1 },
                },
            },
            { 'filename', file_status = false,        path = 1 },
            { modified,   color = { bg = colors.red } },
            {
                '%w',
                cond = function() return vim.wo.previewwindow end,
            },
            {
                '%r',
                cond = function() return vim.bo.readonly end,
            },
            {
                '%q',
                cond = function() return vim.bo.buftype == 'quickfix' end,
            },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { search_result, 'filetype' },
        -- 用 %v(屏幕列)而不是 %c(字节列): 中英文混排时 %c 的数会和肉眼位置对不上
        lualine_z = { '%l:%v', '%p%%/%L' },
    }),
    inactive_sections = {
        lualine_c = { '%f %y %m' },
        lualine_x = {},
    },
})
