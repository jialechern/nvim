-- - keymaps-sshconfig.lua
-- 基本模板
vim.api.nvim_set_keymap('i', '<LEADER>init',
    '# 远程服务器地址别名'                               .. '<CR><Esc>0C' ..
    'Host '                                              .. '<CR><Esc>0C\t' ..
        '# 远程服务器地址'                               .. '<CR><Esc>0C\t' ..
        'HostName ' .. _G.Next                           .. '<CR><Esc>0C\t' ..
        '# 端口号默认为 22'                              .. '<CR><Esc>0C\t' ..
        'Port 22'                                        .. '<CR><Esc>0C\t' ..
        '# 私钥文件路径'                                 .. '<CR><Esc>0C\t' ..
        'IdentityFile  ' .. _G.Next                      .. '<CR><Esc>0C\t' ..
        '# 远程用户名'                                   .. '<CR><Esc>0C\t' ..
        'User ' .. _G.Next                               .. '<CR><Esc>0C\t' ..
        '# 是否仅使用指定的 IdentityFile 进行身份验证'   .. '<CR><Esc>0C\t' ..
        'IdentitiesOnly yes'                             .. '<CR><Esc>0C\t' ..
        '# 允许 SSH 代理转发, '                          ..
        '即可以使用本地 ssh-agent 中的密钥进行身份验证'  .. '<CR><Esc>0C\t' ..
        'ForwardAgent yes'                               .. '<CR><Esc>0C\t' ..
        '# 开启 SSH 连接压缩，提高低带宽网络的性能'      .. '<CR><Esc>0C\t' ..
        'Compression yes'                                .. '<Esc>14kA'
, { noremap = true, silent = true})
