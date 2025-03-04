-- - keymaps-python.lua

-- 设置魔法方法快捷键
vim.api.nvim_set_keymap('i', '<LEADER>_', '____' .. _G.Next .. '<Esc>2F_i', { noremap = true, silent = true})

-- base init
vim.api.nvim_set_keymap('i', '<LEADER>init', '#!/usr/bin/env python<CR>', { noremap = true, silent = true})

-- 打印
vim.api.nvim_set_keymap('i', '<LEADER>p', 'print()<Esc>F(a', { noremap = true, silent = true})

-- begin 单元测试
-- 测试初始化(导入依赖库)
vim.api.nvim_set_keymap('i', '<LEADER>tinit', 
'from unittest import TestCase, skip, expectedFailure, main'
, { noremap = true, silent = true})
-- 测试类
vim.api.nvim_set_keymap('i', '<LEADER>test', 
                                                                '<C-u>' ..
'class Test(TestCase):'                                          .. '<CR><C-u>' ..
'    def setUp(self):'                                           .. '<CR><C-u>' ..
'        # 测试初始化'                                           .. '<CR><C-u>' ..
'        pass'                                                   .. '<CR><CR><C-u>' ..

"    @skip('暂时跳过测试')"                                      .. '<CR><C-u>' ..
'    def test_example(self):'                                    .. '<CR><C-u>' ..
"        self.assertTrue(sum(range(101)) == 5050, '计算错误!')"  .. '<CR><CR><C-u>' ..

'    def tearDown(self):'                                        .. '<CR><C-u>' ..
'        # 测试结束, 清理资源'                                   .. '<CR><C-u>' ..
'        pass'                                                   .. '<CR><CR><C-u>' ..

"if __name__ == '__main__':"                                     .. '<CR><C-u>' ..
'    main()'                                                     .. '<Esc>14k$2FT3la'
, { noremap = true, silent = true})
-- end 单元测试

-- begin main 函数
vim.api.nvim_set_keymap('i', '<LEADER>main', 
    'def main():'                                           .. '<CR>' ..
        ''                                                  .. '<CR><C-u>' ..

    'if __name__ == "__main__":'                            .. '<CR>' ..
            'main()'                                        .. '<Esc>2kO'
, { noremap = true, silent = true})
-- end main 函数

-- begin for 循环
vim.api.nvim_set_keymap('i', '<LEADER>for', 
    'for  :'                                                .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end for'                                             .. '<Esc>2k$hi'
, { noremap = true, silent = true})
-- end for 循环

-- begin while 循环
vim.api.nvim_set_keymap('i', '<LEADER>while', 
    'while  :'                                              .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end while'                                           .. '<Esc>2k$hi'
, { noremap = true, silent = true})
-- end while 循环

-- begin loop 循环
vim.api.nvim_set_keymap('i', '<LEADER>loop', 
    'while True :'                                          .. '<CR><BS>' ..
    '# end while'                                           .. '<Esc>O'
, { noremap = true, silent = true})
-- end loop 循环

-- begin match 分支
vim.api.nvim_set_keymap('i', '<LEADER>match', 
    'match  :'                                              .. '<CR>' ..
        'case ' .. _G.Next .. ' :'                          .. '<CR>' ..
                _G.Next                                     .. '<CR><BS>' ..
        'case _ :'                                          .. '<CR>' ..
                _G.Next                                     .. '<CR><BS><BS>' ..
    '# end match'                                           .. '<Esc>5k$hi'
, { noremap = true, silent = true})
-- end match 分支

-- begin if 分支
vim.api.nvim_set_keymap('i', '<LEADER>if', 
    'if  :'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end if'                                              .. '<Esc>3k$hi'
, { noremap = true, silent = true})
-- end if 分支

-- begin if-else 分支
vim.api.nvim_set_keymap('i', '<LEADER>eif', 
    'if  :'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    'else:'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end if'                                              .. '<Esc>4k$hi'
, { noremap = true, silent = true})
-- end if-else 分支

-- begin elif 分支
vim.api.nvim_set_keymap('i', '<LEADER>elif', 
    'if  :'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    'elif ' .. _G.Next .. ' :'                              .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end if'                                              .. '<Esc>5k$hi'
, { noremap = true, silent = true})
-- end elif 分支

-- begin elif-else 分支
vim.api.nvim_set_keymap('i', '<LEADER>eelif', 
    'if  :'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    'elif ' .. _G.Next .. ' :'                              .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    'else:'                                                 .. '<CR>' ..
            _G.Next                                         .. '<CR><BS>' ..
    '# end if'                                              .. '<Esc>6k$hi'
, { noremap = true, silent = true})
-- end elif-else 分支

-- begin 命令行参数处理
vim.api.nvim_set_keymap('i', '<LEADER>argparse', 
'def get_args():'                                                           
                                                            .. '<CR><C-u>' ..
'    # 需要预先导入标准库 argparse' .. _G.Next
                                                            .. '<CR><C-u>' ..
'    parser = argparse.ArgumentParser(description="' .. _G.Next .. '")'     
                                                            .. '<CR><C-u>' ..
'    # 位置参数'                                                            
                                                            .. '<CR><C-u>' ..
'    # parser.add_argument("位置参数", help="参数描述", type="参数类型",nargs: int="接受个数" ,default="默认值", choices: list[arg_type]="枚举参数")'
                                                            .. '<CR><C-u>' ..
'    parser.add_argument("' .. _G.Next .. '", ' .. 
                            'help="' .. _G.Next .. '", ' .. 
                            'type="' .. _G.Next .. '", ' .. 
                            'default="' .. _G.Next .. '")'  .. '<CR><C-u>' ..
'    # 一般参数'                                            .. '<CR><C-u>' ..
'    # parser.add_argument("-缩写", "--全称", help="参数表述",nargs: int="接受个数" ,type="参数类型", default="默认值", choices: list[arg_type]="枚举参数")'
                                                            .. '<CR><C-u>' ..
'    parser.add_argument("' .. _G.Next ..'", ' ..
                            '"' .. _G.Next .. '", ' .. 
                            'help="' .. _G.Next .. '", ' .. 
                            'type="' .. _G.Next .. '", ' .. 
                            'default="' .. _G.Next .. '")'  .. '<CR><C-u>' ..
'    # 开关参数'                                            .. '<CR><C-u>' ..
'    # parser.add_argument("-缩写", "--全称", help="参数表述", action="store_true | store_false")'
                                                            .. '<CR><C-u>' ..
'    parser.add_argument("' .. _G.Next .. '", ' .. 
                            '"' .. _G.Next .. '", ' .. 
                            'help="' .. _G.Next .. '", ' .. 
                            'action="' .. _G.Next .. '")'   .. '<CR><CR><C-u>' .. 

'    return parser.parse_args()'                            .. '<Esc>13k$F(a'
, { noremap = true, silent = true})
-- end 命令行参数处理

-- begin 调用其它程序
-- subprocess.run
vim.api.nvim_set_keymap('i', '<LEADER>run', 
'# 需要导入标准库 subprocess'                                   .. '<CR>' ..
'result = subprocess.run('                                      .. '<CR>' ..
            '# [Command, args: list[str]]'
                                                                .. '<CR>' ..
            '[, ' .. _G.Next .. '],'
                                                                .. '<CR>' ..
            '# 是否捕获 stdout 和 stderr'
                                                                .. '<CR>' ..
            'capture_output=' .. _G.Next
                                                                .. '<CR>' ..
            '# 是否返回字符串'
                                                                .. '<CR>' ..
            'text=' .. _G.Next
                                                                .. '<CR>' ..
            '# 返回码非零时是否抛出异常'
                                                                .. '<CR>' ..
            'check=' .. _G.Next
                                                                .. '<CR>' ..
            '# 超时控制(秒)'
                                                                .. '<CR>' ..
            'timeout=' .. _G.Next                               .. '<CR>' ..
            ')'                                                 .. '<Esc>9k^f,i'
, { noremap = true, silent = true})
-- subprocess.Popen
vim.api.nvim_set_keymap('i', '<LEADER>popen', 
'# 需要导入标准库 subprocess'                                   .. '<CR>' ..
'with subprocess.Popen('                                        .. '<CR>' ..
            '# [Command, args: list[str]]'                      .. '<CR>' ..
            '[, ' .. _G.Next .. '],'                            .. '<CR>' ..
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
                _G.Next                                         .. '<Esc>14k^f,i'
, { noremap = true, silent = true})
-- end 调用其它程序

