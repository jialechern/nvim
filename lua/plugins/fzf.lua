--- fzf.lua

return {
	-- 1) fzf core(包含安装脚本): 仅在系统未安装 fzf 时尝试自动安装
	{
		'junegunn/fzf',
		build = function()
			local fn = vim.fn
			-- 只有在系统找不到 fzf 可执行文件时, 才调用 fzf#install()
			if fn.executable('fzf') == 0 and fn.executable('fzf.exe') == 0 then
				-- 使用 pcall 防止安装脚本报错中断 lazy 的安装流程
				pcall(fn['fzf#install'])
			end
		end,
	},

	-- 2) fzf.vim 封装(提供 :Files / :Rg / :Buffers 等命令)
	{
		'junegunn/fzf.vim',
		dependencies = { 'junegunn/fzf' }, -- 确保 fzf 核心先安装
        event = 'VimEnter',
		config = function()
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
            local fzf_key = '<C-q>'

            map('n', fzf_key .. 'f', function()
                vim.cmd('Files')
            end, { desc = 'FZF: Files' })

			if has_rg then
                map('n', fzf_key .. 'g', function()
                    vim.cmd('Rg')
                end, { desc = 'FZF: Rg (live grep)' })
			else
				-- 没有 rg 时回退到 Files
                map('n', fzf_key .. 'g', function()
                    vim.cmd('Files')
                end, { desc = 'FZF: Files (fg fallback)' })
			end

            map('n', fzf_key .. 'b', function()
                vim.cmd('Buffers')
            end, { desc = 'FZF: Buffers' })

            map('n', fzf_key .. 'h', function()
                vim.cmd('History')
            end, { desc = 'FZF: History' })

            map('n', fzf_key .. 'c', function()
                vim.cmd('Commands')
            end, { desc = 'FZF: Commands' })

            map('n', fzf_key .. 'l', function()
                vim.cmd('Lines')
            end, { desc = 'FZF: Lines in buffer' })

			-- 如果仓库内有 GFiles 命令(fzf.vim 中的 git 文件), 映射到 <leader>fgf
			if fn.exists(':GFiles') == 2 then
                map('n', fzf_key .. 'gf', function()
                    vim.cmd('GFiles')
                end, { desc = 'FZF: Git files' })
			end

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
		end,
	},
}

