-- plugins.lua
local M = {}

-- 统一生成 vim.pack 规格
local function spec(src, name, version, data)
    local item = {
        src = src,
        name = name,
    }
    if version ~= nil then
        item.version = version
    end

    if data ~= nil then
        item.data = data
    end

    return item
end

-- 插件的 安装/同步
M.specs = {
    -- 主题插件 (v2.x)
    spec('https://github.com/catppuccin/nvim', 'catppuccin', vim.version.range('2')),

    -- nvim-treesitter (无 semver 标签, 由 lock 文件锁定 rev)
    spec('https://github.com/nvim-treesitter/nvim-treesitter', 'nvim-treesitter'),

    -- Latex 插件 (v2.x, 标签格式为 v2.17 等双组件版本)
    spec('https://github.com/lervag/vimtex', 'vimtex', vim.version.range('2')),

    -- fzf 插件
    spec('https://github.com/junegunn/fzf', 'fzf', nil, { build_fzf = true }),
    spec('https://github.com/junegunn/fzf.vim', 'fzf.vim'),

    -- snip 插件
    spec('https://github.com/L3MON4D3/LuaSnip', 'LuaSnip', vim.version.range('2'), { build_jsregexp = true }),

    -- 补全插件
    spec('https://github.com/saghen/blink.cmp', 'blink.cmp', vim.version.range('1')),
    spec('https://github.com/xzbdmw/colorful-menu.nvim', 'colorful-menu.nvim'),

    -- 通知插件
    spec('https://github.com/nvim-lualine/lualine.nvim', 'lualine.nvim'),
    spec('https://github.com/folke/noice.nvim', 'noice.nvim', vim.version.range('4')),
    spec('https://github.com/MunifTanjim/nui.nvim', 'nui.nvim'),
    spec('https://github.com/rcarriga/nvim-notify', 'nvim-notify', vim.version.range('3')),

    -- markview 渲染插件 (v28.x)
    spec('https://github.com/OXY2DEV/markview.nvim', 'markview.nvim', vim.version.range('28')),
    spec('https://github.com/nvim-tree/nvim-web-devicons', 'nvim-web-devicons'),

    -- 对齐插件
    spec('https://github.com/junegunn/vim-easy-align', 'vim-easy-align'),
}

local function packadd(name)
    pcall(vim.cmd.packadd, name)
end

-- 处理插件的 build 钩子
local function setup_pack_hooks()
    vim.api.nvim_create_autocmd('PackChanged', {
        callback = function(ev)
            local d = ev.data
            local spec = d.spec or {}
            local meta = spec.data or {}
            local kind = d.kind
            local path = d.path

            if kind ~= 'install' and kind ~= 'update' then
                return
            end

            -- LuaSnip 的可选 jsregexp 构建
            if meta.build_jsregexp and not (jit and jit.os and jit.os:find('Windows')) then
                vim.system({ 'make', 'install_jsregexp' }, { cwd = path, text = true }):wait()
            end

            -- fzf 的安装脚本
            if meta.build_fzf then
                packadd(spec.name or 'fzf')
                pcall(vim.fn['fzf#install'])
            end
        end,
    })
end

function M.setup()
    setup_pack_hooks()

    -- 先安装/同步, 但不自动加载
    vim.pack.add(M.specs, { load = false })

    -- 按原始依赖顺序加载
    require('plugins.colorscheme').setup()
    require('plugins.nvim-treesitter').setup()
    require('plugins.vimtex').setup()
    require('plugins.fzf').setup()
    require('plugins.luasnip').setup()
    require('plugins.blink-cmp').setup()
    require('plugins.lualine').setup()
    require('plugins.noice').setup()
    require('plugins.markview').setup()
    require('plugins.vim-easy-align').setup()
end

return M
