-- mason.lua
return {
    'williamboman/mason.nvim',
    event = { 'BufReadPost', 'BufNewFile', 'VimEnter' },
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
}
