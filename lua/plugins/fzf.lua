--- fzf.lua

local M = {}
M[1] = {}
M[2] = {}


local fzf = M[1]
local fzf_vim = M[2]


-- 配置 fzf
fzf[1] = 'junegunn/fzf'

fzf.build = function()
    local fn = vim.fn
    -- 只有在系统找不到 fzf 可执行文件时, 才调用 fzf#install()
    if fn.executable('fzf') == 0 and fn.executable('fzf.exe') == 0 then
        -- 使用 pcall 防止安装脚本报错中断 lazy 的安装流程
        pcall(fn['fzf#install'])
    end
end


-- 配置 fzf.vim
fzf_vim[1] = 'junegunn/fzf.vim'
-- 确保 fzf 核心先安装
fzf_vim.dependencies = { 'junegunn/fzf' }
-- 仅在 Vim 启动时加载 fzf.vim
fzf_vim.event = 'VimEnter'

-- 配置函数
fzf_vim.config = function()
    local fn = vim.fn
    local api = vim.api
    local map = require('utils.map').map

    -- ========= 环境检测(保留) =========
    local function has(cmd) return fn.executable(cmd) == 1 end
    local has_fzf = has('fzf') or has('fzf.exe')
    local has_rg	= has('rg') or has('ripgrep')
    local has_fd	= has('fd') or has('fdfind')
    local has_bat = has('bat')

    -- ========= FZF 列表命令优先设置(如果有 rg/fd 则使用) =========
    if has_rg then
        -- 使用 ripgrep 列出文件(包含隐藏、跟随符号链接), 并排除常见目录
		vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob \'!.git/*\' --glob \'!node_modules/*\''
	elseif has_fd then
		local fd = (fn.executable('fd') == 1) and 'fd' or 'fdfind'
		vim.env.FZF_DEFAULT_COMMAND = fd .. ' --type f --hidden --strip-cwd-prefix --exclude .git'
	else
	    -- 无 rg/fd: 不设置 FZF_DEFAULT_COMMAND, 让 fzf.vim 使用其内置策略(git ls-files / find)
		-- 这样可以在仓库和非仓库环境下都能工作(只是可能稍慢)
    end

	-- ========= 预览与默认选项(已安装 bat 的优先 prettier 预览) =========
	-- 如果系统有 bat, 则设置全局 FZF 预览选项以使用 bat(颜色与行号)
	if has_bat then
		-- preview 命令: 用 bat 显示, 保持分页关闭并显示行号
		local bat_preview = 'bat --style=numbers,changes --color=always --paging=never --wrap=never {}'
		-- 把 preview 与 preview-window 设为全局默认(fzf.vim 和 fzf 都能读取)
		vim.env.FZF_DEFAULT_OPTS = '--preview \'' .. bat_preview .. '\' --preview-window \'right:60%:wrap\''
		-- 同时也设置 fzf.vim 的右侧预览窗配置(冗余安全)
		vim.g.fzf_preview_window = { 'right:60%', 'ctrl-/', 'ctrl-_' }
    else
		-- 无 bat 时的回退预览(仍使用右侧)
		vim.g.fzf_preview_window = { 'right:60%', 'ctrl-/', 'ctrl-_' }
    end

	-- ========= 布局 & 颜色(可按需修改) =========
	-- 默认把 fzf 窗口放到底部, 40% 高度
	vim.g.fzf_layout = { down = '40%' }

	-- 一些颜色覆盖(可选)
	vim.g.fzf_colors = {
		['fg'] = { 'fg', 'CursorLine' },
		['bg'] = { 'bg', 'Normal' },
		['hl'] = { 'fg', 'Comment' },
		['fg+'] = { 'fg', 'Normal' },
		['bg+'] = { 'bg', 'Visual' },
		['hl+'] = { 'fg', 'Statement' },
		['info'] = { 'fg', 'PreProc' },
		['border'] = { 'fg', 'Ignore' },
		['prompt'] = { 'fg', 'Label' },
	}

	-- ========= 常用快捷键(Lua 映射) =========

    -- 获取键位配置
    local get_key = require('settings.variables.fuzzy-finder').get_key

    map('n', get_key('changes'), function()
        vim.cmd('Changes')
    end, { desc = 'FZF: Changes' })

    map('n', get_key('search'), function()
        vim.cmd('History/')
    end, { desc = 'FZF: Search(History/)' })

    map('n', get_key('marks'), function()
        vim.cmd('Marks')
    end, { desc = 'FZF: Marks' })

    map('n', get_key('windows'), function()
        vim.cmd('Windows')
    end, { desc = 'FZF: Windows' })

    map('n', get_key('snippets'), function()
        vim.cmd('Snippets')
    end, { desc = 'FZF: Snippets' })

    map('n', get_key('jumps'), function()
        vim.cmd('Jumps')
    end, { desc = 'FZF: Jumps' })

    map('n', get_key('marks-in-buffers'), function()
        vim.cmd('BMarks')
    end, { desc = 'FZF: Marks in buffers(BMarks)' })

    map('n', get_key('files'), function()
        vim.cmd('Files')
    end, { desc = 'FZF: Files(Open current path by fzf)' })

    map('n', get_key('files-by-path'), function()
        local path = fn.input('请输入搜寻的路径: ', fn.getcwd(), 'dir')
        vim.cmd('Files' .. ' ' .. fn.fnameescape(path))
    end, { desc = 'FZF: Files(Open current path by fzf)' })

	if has_rg then
        map('n', get_key('rg'), function()
            vim.cmd('Rg')
        end, { desc = 'FZF: Rg (live grep)' })
	else
		-- 没有 rg 时回退到 Files
        map('n', get_key('rg'), function()
            vim.cmd('Files')
        end, { desc = 'FZF: Files (fg fallback)' })
	end

    map('n', get_key('buffers'), function()
        vim.cmd('Buffers')
    end, { desc = 'FZF: Buffers' })

    map('n', get_key('history'), function()
        vim.cmd('History')
    end, { desc = 'FZF: History' })

    map('n', get_key('commands'), function()
        vim.cmd('Commands')
    end, { desc = 'FZF: Commands' })

    map('n', get_key('lines'), function()
        vim.cmd('Lines')
    end, { desc = 'FZF: Lines in buffer' })

    map('n', get_key('lines-in-buffers'), function()
        vim.cmd('BLines')
    end, { desc = 'FZF: Lines in buffers' })

    map('n', get_key('tags'), function()
        vim.cmd('Tags')
    end, { desc = 'FZF: Tags' })

    map('n', get_key('tags-in-current-buffer'), function()
        vim.cmd('BTags')
    end, { desc = 'FZF: Tags in current buffer(BTags)' })

	if fn.exists(':GFiles') == 2 then
        map('n', get_key('files-in-git-repo'), function()
            vim.cmd('GFiles')
        end, { desc = 'FZF: Git files' })
	end

    map('n', get_key('help'), function ()
        local help_text = [[
fuzzy-finder 快捷键帮助手册:
    %s : 在当前路径使用 fzf 查找文件
    %s : 在指定路径使用 fzf 查找文件
    %s : 使用 ripgrep (rg) 进行模糊搜索(若未安装 rg 则回退到 :Files)
    %s : 列出并切换缓冲区
    %s : 列出命令/搜索历史
    %s : 列出并执行命令
    %s : 在当前缓冲区内模糊查找行
    %s : 在所有缓冲区内模糊查找行
    %s : 列出当前 git 仓库内的文件(若有)
    %s : 列出并查看更改的文件(Changes)
    %s : 列出所有标记(Marks)
    %s : 列出所有缓冲区内的标记(BMarks)
    %s : 列出并搜索 命令/搜索历史 (History/)
    %s : 列出并插入代码片段(Snippets)
    %s : 列出并切换窗口s(Windows)
    %s : 列出跳转位置(Jumps)
    %s : 列出所有标签(Tags)
    %s : 列出当前缓冲区内的标签(BTags)
        ]]

    vim.notify(help_text:format(
        get_key('files'),
        get_key('files-by-path'),
        get_key('rg'),
        get_key('buffers'),
        get_key('history'),
        get_key('commands'),
        get_key('lines'),
        get_key('lines-in-buffers'),
        get_key('files-in-git-repo'),
        get_key('changes'),
        get_key('marks'),
        get_key('marks-in-buffers'),
        get_key('search'),
        get_key('snippets'),
        get_key('windows'),
        get_key('jumps'),
        get_key('tags'),
        get_key('tags-in-current-buffer')
    ), vim.log.levels.INFO, { title = 'fuzzy-finder 快捷键帮助' })
    end, { desc = 'fuzzy-finder: Help' })

	-- ========= 便捷自定义命令 =========
	-- RgVisual: 使用寄存器内容/可视选择作为 Rg 查询
	api.nvim_create_user_command('RgVisual', function()
		local txt = fn.getreg('\"') or ''
		if txt == '' then
			local ok, sel = pcall(fn.getreg, 'v')
			txt = (ok and sel) or ''
		end
		if #txt > 0 then
			api.nvim_command('Rg ' .. fn.shellescape(txt))
		else
			api.nvim_command('Rg')
		end
	end, { nargs = 0 })

	-- GrepWord: 搜索光标下单词(可传参覆盖)
	api.nvim_create_user_command('GrepWord', function(opts)
		local word = (opts.args ~= '' and opts.args) or fn.expand('<cword>')
		if has_rg then
			api.nvim_command('Rg ' .. fn.shellescape(word))
		else
			api.nvim_command('Ag ' .. fn.shellescape(word))
		end
	end, { nargs = '?' })

	-- FilesCwd: 在 git 根目录(若有)或当前目录运行 Files
	api.nvim_create_user_command('FilesCwd', function()
		local git_root = fn.systemlist('git rev-parse --show-toplevel')[1]
		if git_root and git_root ~= '' then
			local cwd = fn.getcwd()
			vim.cmd('lcd ' .. fn.fnameescape(git_root))
			vim.cmd('Files')
			vim.cmd('lcd ' .. fn.fnameescape(cwd))
		else
			vim.cmd('Files')
		end
	end, { nargs = 0 })

	-- ========= 运行时友好提示(保留检测) =========
	if not has_fzf then
		vim.notify("未检测到 fzf 可执行文件. 若希望自动安装, 可在安装时允许 lazy.nvim 运行 fzf#install(). ", vim.log.levels.WARN)
	end
	if not has_rg then
		vim.notify("未检测到 ripgrep (rg). :Rg 将不可用或变慢；建议在需要时安装 ripgrep. ", vim.log.levels.INFO)
	end
	if not has_fd then
		vim.notify("未检测到 fd/fdfind(可选). 若安装 fd 可进一步加速文件查找. ", vim.log.levels.DEBUG)
	end

	-- ========= 示例: 自定义回车 / 快捷操作(可按需启用) =========
	-- 例如, 可以设置默认的 fzf action(回车在新 tab 打开, ctrl-s 分割等)
	-- vim.g.fzf_action = { ['enter'] = 'tab split', ['ctrl-s'] = 'split', ['ctrl-v'] = 'vsplit' }
end


return M

