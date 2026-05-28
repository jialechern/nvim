-- transparency.lua
-- 给出一个设置透明背景的配置函数

local module = {}

local function apply_transparency()
    -- 透明背景覆盖列表 (当前所用的主题无法覆盖所有高亮组)
    local transparent_groups = {
        'Normal',
        'StatusLine',
        'NormalFloat',
        'FloatBorder',
        'LspInlayHint',
        'DiagnosticFloatingNormal',
        'DiagnosticVirtualTextError',
        'DiagnosticVirtualTextWarn',
        'DiagnosticVirtualTextInfo',
        'DiagnosticVirtualTextHint',
    }

    for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = 'NONE' })
    end
end

module.apply_transparency = apply_transparency

return module
