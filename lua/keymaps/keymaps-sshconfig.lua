-- - keymaps-sshconfig.lua
-- 基本模板
vim.api.nvim_set_keymap('i', '<LEADER>init', 
    "Host "                                         .. "<CR>" ..
        "HostName <++>"                             .. "<CR>" ..
        "IdentityFile <++>"                         .. "<CR>" ..
        "User <++>"                                 .. "<Esc>3kA"
, { noremap = true, silent = true})
