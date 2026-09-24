--- telescope.lua
--- 模糊查找: telescope.nvim(取代原来的 fzf + fzf.vim)
--- 依赖(nix 提供, 名字见 plugins.lua 的对照表): plenary.nvim, telescope-fzf-native.nvim
--- 键位见 keys/fuzzy_finder.lua


vim.cmd.packadd('telescope.nvim')
vim.cmd.packadd('plenary.nvim')

-- 原生排序器(可选): 装上才启用, 缺失时回退到 telescope 自带排序器
local has_fzf_native = pcall(vim.cmd.packadd, 'telescope-fzf-native.nvim')

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        -- 布局: 对应原 fzf 的 down = '40%'(底部弹出, 预览在右侧)
        layout_strategy = 'horizontal',
        layout_config = {
            width = 0.9,
            height = 0.4,
            anchor = 'S',
            preview_width = 0.55,
        },
        sorting_strategy = 'ascending',
        -- 圆角边框, 与全局 winborder = 'rounded' 保持一致
        border = true,
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        -- 未安装 nvim-web-devicons, 不做图标着色(装上后可改成 true)
        color_devicons = false,
        -- 忽略噪声目录(对应原 FZF_DEFAULT_COMMAND 里的 glob)
        file_ignore_patterns = { '^%.git/', '^node_modules/' },
        -- live_grep / grep_string 走 ripgrep, 同样跳过噪声目录
        vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename', '--line-number',
            '--column', '--smart-case', '--hidden', '--glob', '!{.git,node_modules}/*',
        },
        mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
            },
        },
    },
    pickers = {
        find_files = { hidden = true },
        buffers = { sort_mru = true },
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- 模糊匹配交给 fzf-native
            override_generic_sorter = true, -- 覆盖通用排序器
            override_file_sorter = true,    -- 覆盖文件排序器
            case_mode = 'smart_case',
        },
    },
})

if has_fzf_native then
    telescope.load_extension('fzf')
end

-- --- --- --- 键位 --- --- ---
local map = require('utils.map').map
local keys = require('keys.fuzzy_finder')
local builtin = require('telescope.builtin')
local fn = vim.fn

map(keys.files, builtin.find_files)
map(keys.files_by_path, function()
    local path = fn.input('请输入搜寻的路径: ', fn.getcwd(), 'dir')
    if path ~= '' then
        builtin.find_files({ cwd = path })
    end
end)
map(keys.files_in_git_repo, builtin.git_files)
map(keys.changes, builtin.git_status)
map(keys.buffers, builtin.buffers)
map(keys.lines, builtin.current_buffer_fuzzy_find)
map(keys.tags, builtin.tags)
map(keys.tags_in_current_buffer, builtin.current_buffer_tags)
map(keys.marks, builtin.marks)
map(keys.jumps, builtin.jumplist)
map(keys.history, builtin.command_history)
map(keys.search, builtin.search_history)
map(keys.commands, builtin.commands)
map(keys.snippets, function()
    -- 片段不经过 telescope: 交给 mini.snippets 的选择 UI(由 noice 渲染)
    local ok, snippets = pcall(require, 'mini.snippets')
    if ok and #snippets.expand({ insert = false }) > 0 then
        snippets.expand()
    else
        vim.notify('当前上下文没有可用片段', vim.log.levels.INFO, { title = 'snippet' })
    end
end)

-- ripgrep 缺失时全文搜索退化为文件查找(与原 fzf 配置一致)
if fn.executable('rg') == 1 then
    map(keys.rg, builtin.live_grep)
else
    map(keys.rg, builtin.find_files)
    vim.notify('未检测到 ripgrep (rg), 全文搜索将退化为文件查找', vim.log.levels.INFO, { title = 'telescope' })
end

-- --- --- --- 自定义命令(沿用原 fzf 配置里的三个) --- --- ---
vim.api.nvim_create_user_command('GrepWord', function(opts)
    local word = (opts.args ~= '' and opts.args) or fn.expand('<cword>')
    builtin.grep_string({ search = word })
end, { nargs = '?', desc = '用 ripgrep 搜索光标下的词(或指定词)' })

vim.api.nvim_create_user_command('RgVisual', function()
    local txt = fn.getreg('"')
    if txt == '' then
        txt = fn.getreg('v')
    end
    if txt ~= '' then
        builtin.grep_string({ search = txt:gsub('\n', '\\n') })
    else
        builtin.live_grep()
    end
end, { nargs = 0, desc = '搜索最近一次复制/选中的文本' })

vim.api.nvim_create_user_command('FilesCwd', function()
    -- 优先从 git 仓库根目录开始查找(等价于原来 lcd 到仓库根再查文件)
    local git_root = fn.systemlist('git rev-parse --show-toplevel')[1]
    if git_root and git_root ~= '' then
        builtin.find_files({ cwd = git_root })
    else
        builtin.find_files()
    end
end, { nargs = 0, desc = '从 git 仓库根目录查找文件' })
