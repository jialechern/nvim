-- - map.lua
-- Description: 给出一个 vim.keymap.set 的一个基本抽象

_G.utils = _G.utils or {}

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true, desc = "unknown" }

    -- 合并配置
	if opts then
		options = vim.tbl_deep_extend('force', options, opts)
	end

	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

_G.utils.map = map

