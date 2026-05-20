-- map.lua
-- 给出一个 vim.keymap.set 的一个基本抽象

local module = {}

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true, desc = "unknown" }

    -- 合并配置
    if opts then
        options = vim.tbl_deep_extend('force', options, opts)
    end

    vim.keymap.set(mode, lhs, rhs, options)
end

local function map_by_modes(modes, lhs, rhs, opts)
    local options = { noremap = true, silent = true, desc = "unknown" }

    -- 合并配置
    if opts then
        options = vim.tbl_deep_extend('force', options, opts)
    end

    for _, mode in ipairs(modes) do
        map(mode, lhs, rhs, options)
    end
end

module.map = map
module.map_by_modes = map_by_modes

return module
