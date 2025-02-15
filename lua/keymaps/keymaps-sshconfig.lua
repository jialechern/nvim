-- - keymaps-sshconfig.lua
-- 基本模板
vim.api.nvim_set_keymap('i', '<LEADER>init', 
    "# 远程服务器地址别名"                              .. "<CR><C-u>" ..
    "Host "                                             .. "<CR><C-u>" ..
    "   # 远程服务器地址"                               .. "<CR><C-u>" ..
    "   HostName <++>"                                  .. "<CR><C-u>" ..
    "   # 端口号默认为 22"                              .. "<CR><C-u>" ..
    "   Port 22"                                        .. "<CR><C-u>" ..
    "   # 私钥文件路径"                                 .. "<CR><C-u>" ..
    "   IdentityFile <++>"                              .. "<CR><C-u>" ..
    "   # 远程用户名"                                   .. "<CR><C-u>" ..
    "   User <++>"                                      .. "<CR><C-u>" ..
    "   # 是否仅使用指定的 IdentityFile 进行身份验证"   .. "<CR><C-u>" ..
    "   IdentitiesOnly yes"                             .. "<CR><C-u>" ..
    "   # 允许 SSH 代理转发, "                          ..
        "即可以使用本地 ssh-agent 中的密钥进行身份验证" .. "<CR><C-u>" ..
    "   ForwardAgent yes"                               .. "<CR><C-u>" ..
    "   # 开启 SSH 连接压缩，提高低带宽网络的性能"      .. "<CR><C-u>" ..
    "   Compression yes"                                .. "<Esc>15kA" 
, { noremap = true, silent = true})
