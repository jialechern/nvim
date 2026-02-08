-- mason.lua

local M = {}
M[1] = {}
local mason = M[1]


mason[1] = 'williamboman/mason.nvim'
mason.event = { 'BufReadPost', 'BufNewFile', 'VimEnter' }


mason.opts = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
}


return M

