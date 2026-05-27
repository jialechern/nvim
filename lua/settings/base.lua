--- settings-base.lua

-- 设置字体
vim.opt.guifont = 'JetBrainsMono Nerd Font:h16'

-- 字体编码
-- 自动识别文件编码优先级
vim.opt.fileencodings = { "utf-8", "gbk", "gb2312", "ucs-2le", "latin1" }
-- 修复代码文件换行符/特殊字符乱码
vim.opt.fileformats = { "unix", "dos", "mac" }

-- 禁用默认的启动界面
vim.opt.shortmess:append('I')

-- 配置语法高亮
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.cmd('filetype on') -- 文档类型自动检测


-- Hint: use `:h <option>` to figure out the meaning if needed
-- vim.opt.clipboard = 'unnamedplus'                       -- 使用系统剪贴板
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a' -- 启用鼠标支持

-- Tab
vim.opt.tabstop = 4      -- tab 的宽度为 4 个空格
vim.opt.softtabstop = 4  -- 当按下 Tab 键时，插入 4 个空格
vim.opt.shiftwidth = 4   -- 自动缩进时使用 4 个空格
vim.opt.expandtab = true -- 将 Tab 键转换为空格

-- UI config
vim.opt.number = true         -- 开启行号
vim.opt.relativenumber = true -- 开启相对行号
vim.opt.cursorline = true     -- 显示光标所在行
vim.opt.cursorcolumn = true   -- 高亮显示光标所在列

local colors = require('settings.variables.colors')
-- 设置行高亮
vim.api.nvim_set_hl(0, 'CursorLine', { bg = colors.bg1, underline = true })
-- 设置列高亮
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = colors.bg1 })

vim.opt.splitbelow = true    -- 打开新水平分割时，新的窗口在下方
vim.opt.splitright = true    -- 打开新垂直分割时，新的窗口在右侧
vim.opt.termguicolors = true -- 使用 24 bit rgb 颜色
vim.opt.showmode = false     -- 是否显示模式（insert, normal 等）
vim.opt.laststatus = 3       -- 全局状态栏

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = true   -- 开启高亮搜索匹配结果
vim.opt.ignorecase = true -- 搜索时忽略大小写
vim.opt.smartcase = true  -- 如果搜索包含大写字母，则不忽略大小写

-- 设置光标跳转逻辑
vim.opt.jumpoptions = "stack"

-- 设置打印机模式
vim.opt.scrolloff = 10

-- 设置自动保存折叠信息
local fold_group = vim.api.nvim_create_augroup('remember_folds', { clear = true })
vim.api.nvim_create_autocmd('BufWinLeave', {
    group = fold_group,
    callback = function()
        vim.cmd('silent! mkview')
    end
})
vim.api.nvim_create_autocmd('BufWinEnter', {
    group = fold_group,
    callback = function()
        vim.cmd('silent! loadview')
    end
})

-- 设置自动保存
-- vim.opt.autowrite = true

-- -- 拼写检查
-- vim.opt.spell = true
-- 设置拼写检查语言
vim.opt.spelllang = { 'en', 'cjk' }
-- 支持骆驼拼写
vim.opt.spelloptions = 'camel'

-- 开启 DiffTool
vim.cmd('packadd nvim.difftool')
