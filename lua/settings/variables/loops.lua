-- loops.lua

local module = {}

-- 循环型语句的引导键
local loop_keys = {}

loop_keys['for'] = 'for'
loop_keys['loop'] = 'loop'
loop_keys['while'] = 'while'
loop_keys['do-while'] = 'do-while'

module.loop_keys = loop_keys

return module

