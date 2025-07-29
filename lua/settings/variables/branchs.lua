-- branchs.lua

local module = {}

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

return module

