-- - settings-base.lua

-- 设置字体
vim.opt.guifont = "JetBrainsMono Nerd Font:h16"

-- 禁用默认的启动界面
vim.opt.shortmess:append("I")   

-- 配置语法高亮
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.cmd('filetype on')                  -- 文档类型自动检测


-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus'                       -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'                                     -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4                                     -- number of visual spaces per TAB
vim.opt.softtabstop = 4                                 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4                                  -- insert 4 spaces on a tab
vim.opt.expandtab = true                                -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true                                   -- show absolute number
vim.opt.relativenumber = true                           -- add numbers to each line on the left side
vim.opt.cursorline = true                               -- highlight cursor line underneath the cursor horizontally
vim.opt.cursorcolumn = true                               -- highlight cursor column underneath the cursor horizontally
vim.opt.splitbelow = true                               -- open new vertical split bottom
vim.opt.splitright = true                               -- open new horizontal splits right
-- vim.opt.termguicolors = true                         -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false                                -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true                                -- search as characters are entered
vim.opt.hlsearch = false                                -- do not highlight matches
vim.opt.ignorecase = true                               -- ignore case in searches by default
vim.opt.smartcase = true                                -- but make it case sensitive if an uppercase is entered

-- begin 设置光标跳转逻辑
vim.opt.jumpoptions = "stack"
-- end 设置光标跳转逻辑


-- MarkDown
-- vim.g.mkdp_auto_start = 1

vim.g.mkdp_browser = 'firefox'

-- 设置背景透明
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE', ctermbg = 'NONE' })
-- 设置光标行透明
vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'NONE' })
-- 设置状态行透明（如果使用状态栏插件）
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })

-- 设置打印机模式
vim.opt.scrolloff=10

-- begin 配置折叠功能
-- 设置自动保存折叠信息
vim.api.nvim_exec([[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
  augroup END
]], false)
-- end 配置折叠功能

