--- sshconfig
--- sshconfig 的 entry_point snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

--- 模块定义
local module = {}

--- 程序入口点
local entry_point = require('settings.variables.entry-points').entry_point
module[#module+1] = s({
    trig = entry_point,
    snippetType = 'autosnippet',
    }, {
        t({'# 远程服务器地址别名', ''}),
        t('Host '), i(1, 'host-alias'),
        t({'', '\t# 远程服务器地址', ''}),
        t('\tHostName '), i(2, 'host-name'),
        t({'', '\t# 端口号默认为 22', ''}),
        t('\tPort '), i(3, '22'),
        t({'', '\t# 私钥文件路径', ''}),
        t('\tIdentityFile '), i(4, '~/.ssh/identity-file'),
        t({'', '\t# 远程用户名', ''}),
        t('\tUser '), i(5, 'user-name'),
        t({'', '\t# 是否仅使用指定的 IdentityFile 进行身份验证', ''}),
        t('\tIdentitiesOnly ', ''), c(6, { t('yes'), t('no') }),
        t({'', '\t# 允许 SSH 代理转发, 即可以使用本地 ssh-agent 中的密钥进行身份验证', ''}),
        t('\tForwardAgent '), c(7, { t('yes'), t('no') }),
        t({'', '\t# 开启 SSH 连接压缩，提高低带宽网络的性能', ''}),
        t('\tCompression '), c(8, { t('yes'), t('no') }),
        i(0),
    })

--- 模块返回
return module


