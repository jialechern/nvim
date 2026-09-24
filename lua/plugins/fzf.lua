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
    local map = require('utils.map').map
    local keys = require('keys.fuzzy_finder')

    map(keys.changes, function() vim.cmd('Changes') end)
    map(keys.search, function() vim.cmd('History/') end)
    map(keys.marks, function() vim.cmd('Marks') end)
    map(keys.windows, function() vim.cmd('Windows') end)
    map(keys.snippets, function() vim.cmd('Snippets') end)
    map(keys.jumps, function() vim.cmd('Jumps') end)
    map(keys.marks_in_buffers, function() vim.cmd('BMarks') end)
    map(keys.files, function() vim.cmd('Files') end)

    map(keys.files_by_path, function()
        local path = fn.input('请输入搜寻的路径: ', fn.getcwd(), 'dir')
        vim.cmd('Files ' .. fn.fnameescape(path))
    end)

    if has_rg then
        map(keys.rg, function() vim.cmd('Rg') end)
    else
        map(keys.rg, function() vim.cmd('Files') end)
    end

    map(keys.buffers, function() vim.cmd('Buffers') end)
    map(keys.history, function() vim.cmd('History') end)
    map(keys.commands, function() vim.cmd('Commands') end)
    map(keys.lines, function() vim.cmd('Lines') end)
    map(keys.lines_in_buffers, function() vim.cmd('BLines') end)
    map(keys.tags, function() vim.cmd('Tags') end)
    map(keys.tags_in_current_buffer, function() vim.cmd('BTags') end)

    if fn.exists(':GFiles') == 2 then
        map(keys.files_in_git_repo, function() vim.cmd('GFiles') end)
    end


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
