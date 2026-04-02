-- vimtex

local M = {}
M[1] = {}
local vimtex = M[1]


vimtex[1] = "lervag/vimtex"
-- vimtex.tag = "v2.15"
vimtex.lazy = false


vimtex.init = function()
	-- VimTeX configuration goes here, e.g.
	vim.g.vimtex_view_method = "zathura"
end


return M

