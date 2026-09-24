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
---   plenary.nvim                 plenary-nvim
---   telescope.nvim               telescope-nvim
---   telescope-fzf-native.nvim    telescope-fzf-native-nvim
--- 核对方法: ls ~/.local/share/nvim/site/pack/hm/opt

-- 调用顺序即加载顺序, 不要随手挪动。
-- 每个 plugins/<name>.lua 被 require 时直接执行(先 packadd 再配置), 没有 setup() 壳
require('plugins.colorscheme') -- 主题最先, 否则高亮会被后加载的插件覆盖
require('plugins.nvim-lspconfig')
require('plugins.telescope')
require('plugins.snippets')
require('plugins.lualine')
require('plugins.noice')
require('plugins.vim-easy-align')
