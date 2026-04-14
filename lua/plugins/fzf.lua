local M = {}

function M.setup()
    local fn = vim.fn
    local api = vim.api

    -- 先把插件放进 runtimepath
    vim.cmd.packadd('fzf')
    vim.cmd.packadd('fzf.vim')

    -- --- --- --- 环境检测 --- --- ---
    local function has(cmd)
        return fn.executable(cmd) == 1
    end

    local has_fzf = has('fzf') or has('fzf.exe')
    local has_rg = has('rg') or has('ripgrep')
    local has_fd = has('fd') or has('fdfind')
    local has_bat = has('bat')

    -- --- --- --- 默认搜索命令 --- --- ---
    if has_rg then
        vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --glob '!.git/*' --glob '!node_modules/*'"
    elseif has_fd then
        local fd = (fn.executable('fd') == 1) and 'fd' or 'fdfind'
        vim.env.FZF_DEFAULT_COMMAND = fd .. ' --type f --hidden --strip-cwd-prefix --exclude .git'
    end

    -- --- --- --- 预览窗口 --- --- ---
    if has_bat then
        local bat_preview = 'bat --style=numbers,changes --color=always --paging=never --wrap=never {}'
        vim.env.FZF_DEFAULT_OPTS = "--preview '" .. bat_preview .. "' --preview-window 'right:60%:wrap'"
        vim.g.fzf_preview_window = { 'right:60%', 'ctrl-/', 'ctrl-_' }
    else
        vim.g.fzf_preview_window = { 'right:60%', 'ctrl-/', 'ctrl-_' }
    end

    -- --- --- --- 布局 & 颜色 --- --- ---
    vim.g.fzf_layout = { down = '40%' }
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

    -- --- --- --- 键位 --- --- ---
    local get_key = require('settings.variables.fuzzy-finder').get_key

    vim.keymap.set('n', get_key('changes'), function() vim.cmd('Changes') end, { desc = 'FZF: Changes' })
    vim.keymap.set('n', get_key('search'), function() vim.cmd('History/') end, { desc = 'FZF: Search(History/)' })
    vim.keymap.set('n', get_key('marks'), function() vim.cmd('Marks') end, { desc = 'FZF: Marks' })
    vim.keymap.set('n', get_key('windows'), function() vim.cmd('Windows') end, { desc = 'FZF: Windows' })
    vim.keymap.set('n', get_key('snippets'), function() vim.cmd('Snippets') end, { desc = 'FZF: Snippets' })
    vim.keymap.set('n', get_key('jumps'), function() vim.cmd('Jumps') end, { desc = 'FZF: Jumps' })
    vim.keymap.set('n', get_key('marks-in-buffers'), function() vim.cmd('BMarks') end,
        { desc = 'FZF: Marks in buffers(BMarks)' })
    vim.keymap.set('n', get_key('files'), function() vim.cmd('Files') end, { desc = 'FZF: Files' })

    vim.keymap.set('n', get_key('files-by-path'), function()
        local path = fn.input('请输入搜寻的路径: ', fn.getcwd(), 'dir')
        vim.cmd('Files ' .. fn.fnameescape(path))
    end, { desc = 'FZF: Files by path' })

    if has_rg then
        vim.keymap.set('n', get_key('rg'), function() vim.cmd('Rg') end, { desc = 'FZF: Rg (live grep)' })
    else
        vim.keymap.set('n', get_key('rg'), function() vim.cmd('Files') end, { desc = 'FZF: Files fallback' })
    end

    vim.keymap.set('n', get_key('buffers'), function() vim.cmd('Buffers') end, { desc = 'FZF: Buffers' })
    vim.keymap.set('n', get_key('history'), function() vim.cmd('History') end, { desc = 'FZF: History' })
    vim.keymap.set('n', get_key('commands'), function() vim.cmd('Commands') end, { desc = 'FZF: Commands' })
    vim.keymap.set('n', get_key('lines'), function() vim.cmd('Lines') end, { desc = 'FZF: Lines' })
    vim.keymap.set('n', get_key('lines-in-buffers'), function() vim.cmd('BLines') end, { desc = 'FZF: BLines' })
    vim.keymap.set('n', get_key('tags'), function() vim.cmd('Tags') end, { desc = 'FZF: Tags' })
    vim.keymap.set('n', get_key('tags-in-current-buffer'), function() vim.cmd('BTags') end, { desc = 'FZF: BTags' })

    if fn.exists(':GFiles') == 2 then
        vim.keymap.set('n', get_key('files-in-git-repo'), function() vim.cmd('GFiles') end, { desc = 'FZF: Git files' })
    end

    vim.keymap.set('n', get_key('help'), function()
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
    %s : �
��出并插入代码片段(Snippets)
    %s : 列出并切换窗口(Windows)
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

    -- --- --- --- 自定义命令 --- --- ---
    api.nvim_create_user_command('RgVisual', function()
        local txt = fn.getreg('"') or ''
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

    api.nvim_create_user_command('GrepWord', function(opts)
        local word = (opts.args ~= '' and opts.args) or fn.expand('<cword>')
        if has_rg then
            api.nvim_command('Rg ' .. fn.shellescape(word))
        else
            api.nvim_command('Ag ' .. fn.shellescape(word))
        end
    end, { nargs = '?' })

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

    -- --- --- --- 运行时提示 --- --- ---
    if not has_fzf then
        vim.notify('未检测到 fzf 可执行文件', vim.log.levels.WARN)
    end
    if not has_rg then
        vim.notify('未检测到 ripgrep (rg)，:Rg 将不可用或变慢', vim.log.levels.INFO)
    end
    if not has_fd then
        vim.notify('未检测到 fd/fdfind，可选但推荐', vim.log.levels.DEBUG)
    end
end

return M
