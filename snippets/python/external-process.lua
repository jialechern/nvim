--- python.lua
--- python 的 branchs snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
local fmt = require('luasnip.extras.fmt').fmt
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

--- 模块定义
local module = {}

--- 解析命令行输入
module[#module+1] = s({
    trig = 'argparse',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'get-args',
    desc = '解析命令行输入',
    }, fmt([[
    import argparse

    def get_args( {1} ) -> argparse.Namespace:
        parser = argparse.ArgumentParser(description="{2}")

        # 位置参数, 位置参数不支持默认值.
        # parser.add_argument("位置参数", help="参数描述", type="参数类型",nargs: int="接受个数" , choices: list[arg_type]="枚举参数")
        parser.add_argument('{3}', help="{4}", type='{5}', default='{6}')

        # 一般参数
        # parser.add_argument("-缩写", "--全称", help="参数表述",nargs: int="接受个数" ,type="参数类型", default="默认值", choices: list[arg_type]="枚举参数")
        parser.add_argument('{7}', '{8}', help="{9}", type='{10}', default='{11}')

        # 开关参数
        # parser.add_argument("-缩写", "--全称", help="参数表述", action='store_true | store_false')
        parser.add_argument('{12}', '{13}', help="{14}", action='{15}')

        return parser.parse_args(){16}
    ]], {
        i(1, '*args, **kwargs'),
        i(2, 'description'),
        i(3, 'positional-arg'),
        i(4, 'help'),
        i(5, 'arg-type'),
        i(6, 'default-value'),
        i(7, 'short-name'),
        i(8, 'long-name'),
        i(9, 'help'),
        i(10, 'arg-type'),
        i(11, 'default-value'),
        i(12, 'short-name-switch'),
        i(13, 'long-name-switch'),
        i(14, 'help'),
        c(15, {t('store_true'), t('store_false')}),
        i(0),
    }))

--- 调用外部命令
module[#module+1] = s({
    trig = 'run',
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'run',
    desc = '调用外部命令',
    }, fmt([[
    import subprocess
    import shlex

    result = subprocess.run(
        # shlex.split(str('cmd')) 会将字符串以 Shell 友好的方式分割成命令和参数
        shlex.split('{1}'),
        # 可以使用 current_return.stdout.decode() 和 current_return.stderr.decode() 获取输出
        # input=str(...).encode() 设置程序的默认输入( 在程序启动后提供 )
        input='{2}'.encode(),
        # 是否捕获 stdout 和 stderr
        capture_output={3},
        # 是否返回字符串
        text={4},
        # 是否抛出异常
        check={5},
        # 超时控制(秒)
        timeout={6}
    )
    ]], {
        i(1, 'command'),
        i(2, 'input'),
        c(3, {t('True'), t('False')}),
        c(4, {t('True'), t('False')}),
        c(5, {t('True'), t('False')}),
        i(0, 'timeout'),
    }))

--- 模块返回
return module

