-- python.lua

-- 导入自定义工具函数
local map = require('utils.map').map

---------------------------- 函数定义 ----------------------------

require('settings.functions').functions['python'] = function () return
'def ' .. _G.CoLeader .. '( ' .. _G.Next ..' ) ' .. _G.Next .. ':'
                                                            .. '<CR>' ..
    _G.Next                                                 .. '<Esc>k0f' .. _G.CoLeader .. 's'
end

---------------------------- 基本定义 ----------------------------

-- 程序入口
require('settings.entry-points').entry_points['python'] = function () return
'def main() -> None:'                                   .. '<CR>' ..
    ''                                                  .. '<CR><BS>' ..

'if __name__ == "__main__":'                            .. '<CR>' ..
    'main()'                                            .. '<Esc>2kO'
end

map('i', '<LEADER>_', function () return
'__' .. _G.CoLeader .. '__' .. _G.Next          .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "魔法变量"})

map('i', '<LEADER>script', function () return
'#!/usr/bin/env python'
end, { expr = true, desc = "python 脚本初始化"})

map('i', '<LEADER>p' .. _G.End, function () return
'print(' .. _G.CoLeader .. ')' .. _G.Next       .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "打印"})

map('i', '<LEADER>S' .. _G.End, function () return
'"""' .. _G.CoLeader .. '"""'                   .. '<Esc>F' .. _G.CoLeader .. 's'
end, { expr = true, desc = "长字符串"})

-------------------------------- 分支语句 ----------------------------------

local branchs = {}

branchs['if'] = function () return
'if ' .. _G.CoLeader .. ' :'                    .. '<CR>' ..
        _G.Next                                 .. '<CR><BS>' ..
'# end if'                                      .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

branchs['if-else'] = function () return
'if ' .. _G.CoLeader .. ' :'                    .. '<CR>' ..
        _G.Next                                 .. '<CR><BS>' ..
'else:'                                         .. '<CR>' ..
        _G.Next                                 .. '<CR><BS>' ..
'# end if'                                      .. '<Esc>4k0f' .. _G.CoLeader .. 's'
end

branchs['if-else_if'] = function () return
'if ' .. _G.CoLeader ..' :'                     .. '<CR>' ..
        _G.Next                                 .. '<CR><BS>' ..
'elif ' .. _G.Next .. ' :'                      .. '<CR>' ..
        _G.Next                                 .. '<CR><BS>' ..
'# end if'                                      .. '<Esc>4k0f' .. _G.CoLeader .. 's'
end

branchs['if-else_if-else'] = function () return
'if ' .. _G.CoLeader .. ' :'                    .. '<CR>' ..
        _G.Next                                 .. '<CR><BS>' ..
'elif ' .. _G.Next .. ' :'                      .. '<CR>' ..
        _G.Next                                 .. '<CR><BS>' ..
'else:'                                         .. '<CR>' ..
        _G.Next                                 .. '<CR><BS>' ..
'# end if'                                      .. '<Esc>6k0f' .. _G.CoLeader .. 's'
end

branchs['match'] = function () return
'match ' .. _G.CoLeader .. ' :'                 .. '<CR>' ..
    'case ' .. _G.Next .. ' :'                  .. '<CR>' ..
            _G.Next                             .. '<CR>' ..
    'case _ :'                                  .. '<CR>' ..
            _G.Next                             .. '<CR><BS>' ..
'# end match'                                   .. '<Esc>5k0f' .. _G.CoLeader .. 's'
end

require('settings.branchs').branchs['python'] = branchs

------------------------------- 循环语句 -----------------------------------

local loops = {}

loops['for'] = function () return
'for ' .. _G.CoLeader .. ' :'                   .. '<CR>' ..
        _G.Next                                 .. '<CR><BS>' ..
'# end for'                                     .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

loops['while'] = function () return
'while ' .. _G.CoLeader .. ' :'                 .. '<CR>' ..
        _G.Next                                 .. '<CR><BS>' ..
'# end while'                                   .. '<Esc>2k0f' .. _G.CoLeader .. 's'
end

loops['loop'] = function () return
'while True :'                                          .. '<CR><BS>' ..
'# end while'                                           .. '<Esc>O'
end

require('settings.loops').loops['python'] = loops

------------------------------- 其他语句 -----------------------------------

-- 单元测试
-- 测试初始化(导入依赖库)

map('i', '<LEADER>tinit', function () return
'from unittest import TestCase, skip, expectedFailure, main'
end, { expr = true, desc = "单元测试初始化"})

map('i', '<LEADER>test', function () return
                                                                '<C-u>' ..
'class Test' .. _G.CoLeader .. '(TestCase):'                     .. '<CR><C-u>\t' ..
    'def setUp(self):'                                           .. '<CR><C-u>\t\t' ..
        '# 测试初始化'                                           .. '<CR><C-u>\t\t' ..
        _G.Next                                                  .. '<CR><CR><C-u>\t' ..

    "@skip('暂时跳过测试')"                                      .. '<CR><C-u>\t' ..
    'def test_example(self):'                                    .. '<CR><C-u>\t\t' ..
        "self.assertTrue(sum(range(101)) == 5050, '计算错误!')"  .. '<CR><CR><C-u>\t' ..

    'def tearDown(self):'                                        .. '<CR><C-u>\t\t' ..
        '# 测试结束, 清理资源'                                   .. '<CR><C-u>\t\t' ..
        _G.Next                                                  .. '<CR><CR><C-u>' ..

"if __name__ == '__main__':"                                     .. '<CR><C-u>\t' ..
    'main()'
                                                .. '<Esc>14k0f' .. _G.CoLeader .. 's'
end, { expr = true, desc = "单元测试测试类"})

map('i', '<LEADER>argparse', function () return
'def get_args(' .. _G.CoLeader .. ') -> argparse.Namespace:'
                                                            .. '<CR>' ..
    'parser = argparse.ArgumentParser(description="' .. _G.Next .. '")'
                                                            .. '<CR>\t' ..
    '# 位置参数, 位置参数不支持默认值.'
                                                            .. '<CR>\t' ..
    '# parser.add_argument("位置参数", help="参数描述", type="参数类型",nargs: int="接受个数" , choices: list[arg_type]="枚举参数")'
                                                            .. '<CR>\t' ..
    'parser.add_argument("' .. _G.Next .. '", ' ..
                            'help="' .. _G.Next .. '", ' ..
                            'type="' .. _G.Next .. '")'     .. '<CR>\t' ..
    '# 一般参数'                                            .. '<CR>\t' ..
    '# parser.add_argument("-缩写", "--全称", help="参数表述",nargs: int="接受个数" ,type="参数类型", default="默认值", choices: list[arg_type]="枚举参数")'
                                                            .. '<CR>\t' ..
    'parser.add_argument("' .. _G.Next ..'", ' ..
                            '"' .. _G.Next .. '", ' ..
                            'help="' .. _G.Next .. '", ' ..
                            'type="' .. _G.Next .. '", ' ..
                            'default="' .. _G.Next .. '")'  .. '<CR>\t' ..
    '# 开关参数'                                            .. '<CR>\t' ..
    '# parser.add_argument("-缩写", "--全称", help="参数表述", action="store_true | store_false")'
                                                            .. '<CR>\t' ..
    'parser.add_argument("' .. _G.Next .. '", ' ..
                            '"' .. _G.Next .. '", ' ..
                            'help="' .. _G.Next .. '", ' ..
                            'action="' .. _G.Next .. '")'   .. '<CR><CR>\t' ..

    'return parser.parse_args()'
                                            .. '<Esc>12k0f' .. _G.CoLeader .. 's'
end, { expr = true, desc = "命令行参数处理"})

map('i', '<LEADER>run', function () return
'# 需要导入标准库 subprocess 以及 shlex'                        .. '<CR>' ..
'result = subprocess.run('                                      .. '<CR>' ..
            '# shlex.split(str("cmd")) 会将字符串以 Shell 友好的方式分割成命令和参数'
                                                                .. '<CR>\t' ..
            'shlex.split(' .. _G.CoLeader .. '),'
                                                                .. '<CR><BS>' ..
            '# 可以使用 current_return.stdout.decode() 和 current_return.stderr.decode() 获取输出'
                                                                .. '<CR><BS>' ..
            '# input=str(...).encode() 设置程序的默认输入( 在程序启动后提供 )'
                                                                .. '<CR>\t' ..
            'input=' .. _G.Next .. ','
                                                                .. '<CR><BS>' ..
            '# 是否捕获 stdout 和 stderr'
                                                                .. '<CR>\t' ..
            'capture_output=' .. _G.Next .. ','
                                                                .. '<CR><BS>' ..
            '# 是否返回字符串'
                                                                .. '<CR>\t' ..
            'text=' .. _G.Next .. ','
                                                                .. '<CR><BS>' ..
            '# 返回码非零时是否抛出异常'
                                                                .. '<CR>\t' ..
            'check=' .. _G.Next .. ','
                                                                .. '<CR><BS>' ..
            '# 超时控制(秒)'
                                                                .. '<CR>\t' ..
            'timeout=' .. _G.Next .. ','                        .. '<CR>' ..
            ')'
                                            .. '<Esc>11k0f' .. _G.CoLeader .. 's'
end, { expr = true, desc = "subprocess.run 调用其它程序"})

map('i', '<LEADER>popen', function () return
'# 需要导入标准库 subprocess'                                   .. '<CR>' ..
'with subprocess.Popen('                                        .. '<CR>' ..
            '# [Command, args: list[str]]'                      .. '<CR>' ..
            '[' .. _G.CoLeader .. ', ' .. _G.Next .. '],'       .. '<CR>' ..
            '# 合并 stdout 和 stderr'                           .. '<CR>' ..
            'stdout=subprocess.PIPE,'                           .. '<CR>' ..
            'stderr=subprocess.STDOUT,'                         .. '<CR>' ..
            '# 是否返回字符串'                                  .. '<CR>' ..
            'text=' .. _G.Next                                  .. '<CR>' ..
            '# 行缓冲, 推荐为 1'                                .. '<CR>' ..
            'bufsize=' .. _G.Next                               .. '<CR>' ..
            ') as proc:'                                        .. '<CR>' ..
                'for line in proc.stdout:'                      .. '<CR>' ..
                    'print(f"实时输出: {line.strip()}")'        .. '<CR><CR><BS>' ..

                '# 等待结束并获取返回码'                        .. '<CR>' ..
                'returncode = proc.wait()'                      .. '<CR>' ..
                _G.Next
                                                .. '<Esc>14k0f' .. _G.CoLeader .. 's'
end, { expr = true, desc = "subprocess.Popen 调用其它程序"})

-- 日志模块
map('i', '<LEADER>log', function () return
'import logging'                                    .. '<CR>' ..
'def get_logger('                                   .. '<CR><Esc>0C\t' ..
    'name: str = __name__,'                         .. '<CR><Esc>0C\t' ..
    'level: int = logging.INFO,'                    .. '<CR><Esc>0C\t' ..
    "fmt: str = '%(asctime)s - %(name)s - %(levelname)s - %(message)s',"
                                                    .. '<CR><Esc>0C\t' ..
    "into: str='console',"                          .. '<CR><Esc>0C\t' ..
    ') -> logging.Logger:'                          .. '<CR><CR><Esc>0C\t' ..

    'logger = logging.getLogger(name)'              .. '<CR><Esc>0C\t' ..
    'logger.setLevel(level)'                        .. '<CR><CR><Esc>0C\t' ..

    'formatter = logging.Formatter(fmt)'            .. '<CR><Esc>0C\t' ..
    'handler: logging.Handler'                      .. '<CR><CR><Esc>0C\t' ..

    'match into:'                                   .. '<CR><Esc>0C\t\t' ..
        "case 'console':"                           .. '<CR><Esc>0C\t\t\t' ..
            'handler = logging.StreamHandler()'     .. '<CR><Esc>0C\t\t' ..
        "case 'file':"                              .. '<CR><Esc>0C\t\t\t' ..
            "handler = logging.FileHandler(f'{name}.log', mode='a')"
                                                    .. '<CR><Esc>0C\t\t' ..
        'case _:'                                   .. '<CR><Esc>0C\t\t\t' ..
            "raise ValueError(f'不支持将日志写入到 {into}')"
                                                    .. '<CR><CR><Esc>0C\t' ..
    'handler.setLevel(level)'                       .. '<CR><Esc>0C\t' ..
    'handler.setFormatter(formatter)'               .. '<CR><CR><Esc>0C\t' ..

    'logger.addHandler(handler)'                    .. '<CR><Esc>0C\t' ..
    'return logger'
end, { expr = true, desc = "日志模块"})

