--- plugins.lua
--- 插件的"来源"由 Nix 负责(home-manager 的 programs.neovim.plugins): 插件被挂在 'packpath'
--- 的 site/pack/hm/{start,opt} 下。本文件只负责"何时加载"与"按什么顺序配置"。
---
--- 懒加载: nix 里声明成 optional = true 的插件进 opt 目录, 由各 plugins/<name>.lua 内部的
--- vim.cmd.packadd('<目录名>') 按需加载。packadd 认的是 **目录名**(通常是插件仓库名),
--- 与 nixpkgs 属性名不一定相同:
---   目录名(packadd)              nixpkgs 属性名
---   catppuccin-nvim              catppuccin-nvim
---   lualine.nvim                 lualine-nvim
---   mini.snippets                mini-snippets
---   noice.nvim / nui.nvim        noice-nvim / nui-nvim
---   nvim-lspconfig               nvim-lspconfig
---   nvim-treesitter              nvim-treesitter
---   plenary.nvim                 plenary-nvim
---   telescope.nvim               telescope-nvim
---   telescope-fzf-native.nvim    telescope-fzf-native-nvim
--- 核对方法: ls ~/.local/share/nvim/site/pack/hm/opt

local M = {}

function M.setup()
    -- 调用顺序即加载顺序, 不要随手挪动
    require('plugins.colorscheme').setup() -- 主题最先, 否则高亮会被后加载的插件覆盖
    require('plugins.nvim-treesitter').setup()
    require('plugins.telescope').setup()
    require('plugins.snippets').setup()
    require('plugins.lualine').setup()
    require('plugins.noice').setup()
    require('plugins.vim-easy-align').setup()
end

return M
