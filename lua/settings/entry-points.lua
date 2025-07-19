-- entry-points.lua
-- 这是一个配置根据不同程序类型生成不同的入口点的文件

local module = {}

local entry_points = {}

for _, key in ipairs({ 'sh', 'zsh', 'bash', 'fish' }) do
    entry_points[key] = function () return
        '#!/usr/bin/env ' .. key
    end
end

entry_points['sshconfig'] = function () return
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
end

module.entry_points = entry_points

return module

