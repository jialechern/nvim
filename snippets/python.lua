--- python.lua
--- python 的 snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node

--- 模块定义
local module = {}

--- 基本代码片段
-- module[#module+1] = s({
--     trig      = '(_+)',
--     regTrig   = true,
--     replaceTrig = false,
--     wordTrig  = false,
-- }, {
--     t('__'), i(1, 'magic'), t('__'), i(0),
-- })

-- 魔法变量
module[#module+1] = s('_', {
    t('__'), i(1, 'magic'), t('__'), i(0),
})

-- 脚本初始化
module[#module+1] = s('script', {
    t('#!/usr/bin/env python3'),
})

-- 打印
module[#module+1] = s('print', {
    t('print('), i(1, 'message'), t(')'), i(0),
})

-- 长字符串
module[#module+1] = s('str', {
    t('\'\'\''), i(1, 'message'), t('\'\'\''), i(0),
})

module[#module+1] = s('string', {
    t('\"\"\"'), i(1, 'message'), t('\"\"\"'), i(0),
})

--- 程序入口点
local entry_point = require('settings.variables.entry-points').entry_point
module[#module+1] = s(entry_point, {
    t({'def main() -> None:', ''}),
    t('\t'), i(0),
    t({'', 'if __name__ == \'__main__\':', ''}),
    t('\tmain()'),
    })

--- 函数模板
local func_key = require('settings.variables.functions').func_key
module[#module+1] = s(func_key, {
    t('def '), i(1, 'name'), t('('), i(2, '*args, **kwargs'), t({ '):', '' }),
    t('\t'), i(0),
    })

--- 分支型语句
local branch_keys = require('settings.variables.branchs').branch_keys

module[#module+1] = s(branch_keys['if'], {
    t('if '), i(1, 'condition'), t({ ' :', '' }),
    t('\t'), i(0),
    t({ '', '# end if' }),
    })

module[#module+1] = s(branch_keys['if-else'], {
    t('if '), i(1, 'condition1'), t({ ' :', '' }),
    t('\t'), i(2),
    t({ '', 'else:', '' }),
    t('\t'), i(0),
    t({ '', '# end if' }),
    })

module[#module+1] = s(branch_keys['if-else_if'], {
    t('if '), i(1, 'condition1'), t({ ' :', '' }),
    t('\t'), i(2),
    t({ '', 'elif '}), i(3, 'condition2'), t({ ' :', '' }),
    t('\t'), i(0),
    t({ '', '# end if' }),
    })

module[#module+1] = s(branch_keys['if-else_if-else'], {
    t('if '), i(1, 'condition1'), t({ ' :', '' }),
    t('\t'), i(2),
    t({ '', 'elif '}), i(3, 'condition2'), t({ ' :', '' }),
    t('\t'), i(4),
    t({ '', 'else:', '' }),
    t('\t'), i(0),
    t({ '', '# end if' }),
    })

module[#module+1] = s(branch_keys['match'], {
    t('match '), i(1, 'expr'), t({ ' :', '' }),
    t('\tcase '), i(2, 'pattern1'), t({ ' :', '' }),
    t('\t\t'), i(3),
    t({'', '\tcase _:', ''}),
    t('\t\t'), i(0),
    t({ '', '# end match' }),
    })

--- 循环型语句
local loop_keys = require('settings.variables.loops').loop_keys

module[#module+1] = s(loop_keys['for'], {
    t('for '), i(1, 'elem'), t(' in '), i(2, 'iterable'), t({ ' :', '' }),
    t('\t'), i(0),
    t({ '', '# end if' }),
    })

module[#module+1] = s(loop_keys['loop'], {
    t({'while True:', ''}),
    t('\t'), i(0),
    t({ '', '# end while' }),
    })

module[#module+1] = s(loop_keys['while'], {
    t('while '), i(1, 'condition'), t({ ' :', '' }),
    t('\t'), i(0),
    t({ '', '# end while' }),
    })

--- 其他语句
-- 单元测试测试类
module[#module+1] = s('test', {
    t({'# 单元测试初始化',
        'from unittest import TestCase, skip, expectedFailure, main', ''}),
    t('class '), i(1, 'TestClassName'), t({'(TestCase):', ''}),
    t({'\tdef setUp(self):', ''}),
    t('\t\t'), i(2, 'setup code'), t({ '', '' , ''}),

    t({'\t@skip(\'暂时跳过测试\')', ''}),
    t({'\tdef test_example(self):', ''}),
    t({'\t\tself.assertTrue(sum(range(101)) == 5050, \'计算错误!\')', '', ''}),

    t({'\tdef tearDown(self):', ''}),
    t('\t\t'), i(0, 'teardown code'),
    })

-- 解析命令行输入
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

-- 调用外部命令
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

-- 日志处理
module[#module+1] = s('log', {
    t({'import logging', '', ''}),

    t({'def get_logger(', ''}),
    t({'\tname: str = __name__,', ''}),
    t({'\tlevel: int = logging.INFO,', ''}),
    t({'\tfmt: str = \'%(asctime)s - %(name)s - %(levelname)s - %(message)s\',', ''}),
    t({'\tinto: str=\'console\',', ''}),
    t({'\t) -> logging.Logger:', '', ''}),

    t({'\tlogger = logging.getLogger(name)', ''}),
    t({'\tlogger.setLevel(level)', '', ''}),

    t({'\tformatter = logging.Formatter(fmt)', ''}),
    t({'\thandler: logging.Handler', '', ''}),

    t({'\tmatch into:', ''}),
    t({'\t\tcase \'console\':', ''}),
    t({'\t\t\thandler = logging.StreamHandler()', ''}),
    t({'\t\tcase \'file\':', ''}),
    t({'\t\t\thandler = logging.FileHandler(f\'{name}.log\', mode=\'a\')', '', ''}),

    t({'\t\tcase _:', ''}),
    t({'\t\t\traise ValueError(f\'不支持将日志写入到 {into}\')', '', ''}),

    t({'\thandler.setLevel(level)', ''}),
    t({'\thandler.setFormatter(formatter)', '', ''}),
    t({'\tlogger.addHandler(handler)', ''}),
    t('\treturn logger'),
})

--- 模块返回
return module

