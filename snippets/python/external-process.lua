--- python.lua
--- python 的 branchs snipets

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

--- 解析命令行输入
module[#module+1] = s('argparse', {
    t({'import argparse', '', '', ''}),

    t('def get_args( '), i(1, '*args, **kwargs'), t({' ) -> argparse.Namespace:', '', ''}),
    t('\tparser = argparse.ArgumentParser(description=\"'), i(2, 'description'), t({'\")', '', ''}),

    t({'\t# 位置参数, 位置参数不支持默认值.', ''}),
    t({'\t# parser.add_argument(\"位置参数\", help=\"参数描述\", type=\"参数类型\",nargs: int=\"接受个数\" , choices: list[arg_type]=\"枚举参数\")', ''}),
    t('\tparser.add_argument(\''), i(3, 'positional_arg'),
                            t({ '\', help=\"'}), i(4, 'help'), t('\", '),
                            t('type=\''), i(5, 'arg_type'), t('\', '),
                            t('default=\''), i(6, 'default_value'), t('\')'), t({'', ''}),

    t({'\t# 一般参数', ''}),
    t({'\t# parser.add_argument(\"-缩写\", \"--全称\", help=\"参数表述\",nargs: int=\"接受个数\" ,type=\"参数类型\", default=\"默认值\", choices: list[arg_type]=\"枚举参数\")', ''}),
    t('\tparser.add_argument(\''), i(7, 'short_name'), t('\', '),
                            t('\''), i(8, 'long_name'), t({'\', help=\"'}), i(9, 'help'), t('\", '),
                            t('type=\''), i(10, 'arg_type'), t('\', '),
                            t('default=\''), i(11, 'default_value'), t({'\')', '', ''}),

    t({'\t# 开关参数', ''}),
    t({'\t# parser.add_argument(\"-缩写\", \"--全称\", help=\"参数表述\", action=\'store_true | store_false\')', ''}),
    t('\tparser.add_argument(\''), i(12, 'short_name_switch'), t('\', '),
                            t('\''), i(13, 'long_name_switch'), t({'\', help=\"'}), i(14, 'help'), t('\", '),
                            t('action=\''), c(15, {t('store_true'), t('store_false')}), t('\')'), t({'', ''}),
    t({'\treturn parser.parse_args()', ''}), i(0),
    })

--- 调用外部命令
module[#module+1] = s('run', {
    t({'import subprocess',
    'import shlex', '', ''}),

    t({'result = subprocess.run(', ''}),
    t({'\t\t\t# shlex.split(str(\'cmd\')) 会将字符串以 Shell 友好的方式分割成命令和参数', ''}),
    t('\t\t\tshlex.split(\''), i(1, 'command'), t({'\'), ', ''}),
    t({'\t\t\t# 可以使用 current_return.stdout.decode() 和 current_return.stderr.decode() 获取输出', '',
    '\t\t\t# input=str(...).encode() 设置程序的默认输入( 在程序启动后提供 )', ''}),
    t('\t\t\tinput=\''), i(2, 'input'), t({'\'.encode(),', ''}),
    t({'\t\t\t# 是否捕获 stdout 和 stderr', ''}),
    t('\t\t\tcapture_output='), c(3, {t('True'), t('False')}), t({',', ''}),
    t({'\t\t\t# 是否返回字符串', ''}),
    t('\t\t\ttext='), c(4, {t('True'), t('False')}), t({',', ''}),
    t({'\t\t\t# 是否抛出异常', ''}),
    t('\t\t\tcheck='), c(5, {t('True'), t('False')}), t({',', ''}),
    t({'\t\t\t# 超时控制(秒)', ''}),
    t('\t\t\ttimeout='), i(0, 'timeout'), t({',', ''}),
    t('\t\t)'),
    })

--- 模块返回
return module

