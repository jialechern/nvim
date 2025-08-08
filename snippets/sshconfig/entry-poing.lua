--- sshconfig
--- sshconfig 的 entry_point snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node

local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

--- 模块定义
local module = {}

--- 程序入口点
local entry_point = require('settings.variables.entry-points').entry_point
module[#module+1] = s({
    trig = entry_point,
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'entry-point',
    desc = '程序入口点',
    }, fmt([[
    # 远程服务器地址别名
    Host {1}
        # 远程服务器地址
        HostName {2}
        # 端口号默认为 22
        Port {3}
        # 私钥文件路径
        IdentityFile {4}
        # 远程用户名
        User {5}
        # 是否仅使用指定的 IdentityFile 进行身份验证
        IdentitiesOnly {6}
        # 允许 SSH 代理转发, 即可以使用本地 ssh-agent 中的密钥进行身份验证
        ForwardAgent {7}
        # 开启 SSH 连接压缩，提高低带宽网络的性能
        Compression {8}{9}
    ]], {
        i(1, 'host-alias'),
        i(2, 'host-name'),
        i(3, '22'),
        i(4, '~/.ssh/identity-file'),
        i(5, 'user-name'),
        c(6, { t('yes'), t('no') }),
        c(7, { t('yes'), t('no') }),
        c(8, { t('yes'), t('no') }),
        i(0),
    }))

--- 模块返回
return module


