--- fuzzy_finder.lua
--- fzf 相关按键 (fuzzy_finder_leader 命名空间), 由 plugins/fzf.lua 注册

local fuzzy_finder_leader = '<C-q>'

---@class Keys.FuzzyFinder
---@field fuzzy_finder_leader string     -- 命名空间前缀
---@field files KeySpec                  -- 查找文件
---@field files_by_path KeySpec          -- 指定路径下查找文件
---@field rg KeySpec                     -- 全文搜索
---@field buffers KeySpec                -- 切换缓冲区
---@field history KeySpec                -- 命令历史
---@field commands KeySpec               -- 查找命令
---@field lines KeySpec                  -- 当前文件行搜索
---@field lines_in_buffers KeySpec       -- 已打开文件行搜索
---@field files_in_git_repo KeySpec      -- git 仓库文件
---@field changes KeySpec                -- 变更列表
---@field marks KeySpec                  -- 标记列表
---@field marks_in_buffers KeySpec       -- 已打开文件中的标记
---@field search KeySpec                 -- 搜索历史
---@field snippets KeySpec               -- 片段列表
---@field windows KeySpec                -- 窗口列表
---@field jumps KeySpec                  -- 跳转列表
---@field tags KeySpec                   -- 标签列表
---@field tags_in_current_buffer KeySpec -- 当前文件标签

---@type Keys.FuzzyFinder
local module = {
    fuzzy_finder_leader = fuzzy_finder_leader,

    files = { lhs = fuzzy_finder_leader .. 'f', desc = 'fzf: 查找文件' },
    files_by_path = { lhs = fuzzy_finder_leader .. 'F', desc = 'fzf: 在指定路径下查找文件' },
    rg = { lhs = fuzzy_finder_leader .. 'G', desc = 'fzf: 全文搜索(rg)' },
    buffers = { lhs = fuzzy_finder_leader .. 'b', desc = 'fzf: 切换缓冲区' },
    history = { lhs = fuzzy_finder_leader .. 'H', desc = 'fzf: 命令历史' },
    commands = { lhs = fuzzy_finder_leader .. 'c', desc = 'fzf: 查找命令' },
    lines = { lhs = fuzzy_finder_leader .. 'l', desc = 'fzf: 当前文件行搜索' },
    lines_in_buffers = { lhs = fuzzy_finder_leader .. 'L', desc = 'fzf: 所有已打开文件的行搜索' },
    files_in_git_repo = { lhs = fuzzy_finder_leader .. 'g', desc = 'fzf: 查找 git 仓库文件' },
    changes = { lhs = fuzzy_finder_leader .. 'C', desc = 'fzf: 变更列表' },
    marks = { lhs = fuzzy_finder_leader .. 'm', desc = 'fzf: 标记列表' },
    marks_in_buffers = { lhs = fuzzy_finder_leader .. 'M', desc = 'fzf: 所有已打开文件中的标记' },
    search = { lhs = fuzzy_finder_leader .. 's', desc = 'fzf: 搜索历史' },
    snippets = { lhs = fuzzy_finder_leader .. 'S', desc = 'fzf: 片段列表' },
    windows = { lhs = fuzzy_finder_leader .. 'w', desc = 'fzf: 窗口列表' },
    jumps = { lhs = fuzzy_finder_leader .. 'j', desc = 'fzf: 跳转列表' },
    tags = { lhs = fuzzy_finder_leader .. 't', desc = 'fzf: 标签列表' },
    tags_in_current_buffer = { lhs = fuzzy_finder_leader .. 'T', desc = 'fzf: 当前文件的标签' },
}

return module