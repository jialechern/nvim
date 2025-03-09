-- - keymaps-sshconfig.lua
-- 基本模板
vim.api.nvim_set_keymap('i', '<LEADER>init', 
    '# 远程服务器地址别名'                               .. '<CR><C-u>' ..
    'Host '                                              .. '<CR><C-u>\t' ..
        '# 远程服务器地址'                               .. '<CR><C-u>\t' ..
        'HostName ' .. _G.Next                           .. '<CR><C-u>\t' ..
        '# 端口号默认为 22'                              .. '<CR><C-u>\t' ..
        'Port 22'                                        .. '<CR><C-u>\t' ..
        '# 私钥文件路径'                                 .. '<CR><C-u>\t' ..
        'IdentityFile  ' .. _G.Next                      .. '<CR><C-u>\t' ..
        '# 远程用户名'                                   .. '<CR><C-u>\t' ..
        'User ' .. _G.Next                               .. '<CR><C-u>\t' ..
        '# 是否仅使用指定的 IdentityFile 进行身份验证'   .. '<CR><C-u>\t' ..
        'IdentitiesOnly yes'                             .. '<CR><C-u>\t' ..
        '# 允许 SSH 代理转发, '                          ..
        '即可以使用本地 ssh-agent 中的密钥进行身份验证'  .. '<CR><C-u>\t' ..
        'ForwardAgent yes'                               .. '<CR><C-u>\t' ..
        '# 开启 SSH 连接压缩，提高低带宽网络的性能'      .. '<CR><C-u>\t' ..
        'Compression yes'                                .. '<Esc>14kA\t' 
, { noremap = true, silent = true})
