-- variables.lua
-- 用于存放一些配置变量

local module = {}

-- 引入一个决定是否加载该配置文件插件的变量(默认是加载插件的)
module.LoadPlugins = true

-- 快速移动所跨越的行数
module.FastMoveLines = 5

-- 引入引导代码折叠的变量: 现为 Ctrl + Alt
module.fold_key = 'C-A'

-- 程序入口点引导键
module.entry_point = 'init'

-- 不同程序的函数代码片段引导键
module.func_key = 'func'

-- 分支型语句的引导键
local branch_keys = {}
branch_keys['if'] = 'if'
branch_keys['if-else'] = 'eif'
branch_keys['if-else_if'] = 'elif'
branch_keys['if-else_if-else'] = 'eelif'

for _, key in ipairs({
    'case',
    'match',
    'switch',
}) do
    branch_keys[key] = 'match'
end

module.branch_keys = branch_keys

-- 循环型语句的引导键
local loop_keys = {}

loop_keys['for'] = 'for'
loop_keys['loop'] = 'loop'
loop_keys['while'] = 'while'
loop_keys['do-while'] = 'dwhile'

module.loop_keys = loop_keys

return module

