-- 设置字体
vim.opt.guifont = "JetBrainsMono Nerd Font:h16"

-- 配置语法高亮
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.cmd('filetype on')                  -- 文档类型自动检测


-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus'                       -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'                                     -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 8                                     -- number of visual spaces per TAB
vim.opt.softtabstop = 4                                 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4                                  -- insert 4 spaces on a tab
vim.opt.expandtab = true                                -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true                                   -- show absolute number
vim.opt.relativenumber = true                           -- add numbers to each line on the left side
-- vim.opt.cursorline = true                               -- highlight cursor line underneath the cursor horizontally
vim.o.cursorline = true                               -- highlight cursor line underneath the cursor horizontally
vim.o.cursorcolumn = true                               -- highlight cursor column underneath the cursor horizontally
vim.opt.splitbelow = true                               -- open new vertical split bottom
vim.opt.splitright = true                               -- open new horizontal splits right
-- vim.opt.termguicolors = true                         -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false                                -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true                                -- search as characters are entered
vim.opt.hlsearch = false                                -- do not highlight matches
vim.opt.ignorecase = true                               -- ignore case in searches by default
vim.opt.smartcase = true                                -- but make it case sensitive if an uppercase is entered


-- MarkDown
-- vim.g.mkdp_auto_start = 1

vim.g.mkdp_browser = 'firefox'

-- 配置代码高亮
require('nvim-treesitter.configs').setup ({
    ensure_installed = { "bash", "python", "javascript", "lua", "html", "css", "c" }, -- 你所需要的语言
    highlight = {
      enable = true,  -- 启用高亮
    },
  })
if vim.fn.has("termguicolors") == 1 then            -- 启用终端色彩
  vim.opt.termguicolors = true
end
   
-- 启用代码提示
vim.g.ycm_global_ycm_extra_conf = '$NVIMCONFIGP/.ycm_extra_conf.py'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }


-- 设置背景透明
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE', ctermbg = 'NONE' })
-- 设置光标行透明
vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'NONE' })
-- 设置状态行透明（如果使用状态栏插件）
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })

-- 设置打印机模式
vim.opt.scrolloff=10
