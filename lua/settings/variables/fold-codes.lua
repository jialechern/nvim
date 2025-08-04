-- fold_codes.lua

local module = {}

-- 引入引导代码折叠的变量: 现为 Ctrl + Alt
local fold_key = '<C-f>'

module.fold_key = fold_key

-- 引入一个函数来设置代码折叠的快捷键
local function get_key(v)
    if v == 'close' then
        return fold_key .. 'c'
    elseif v == 'open' then
        return fold_key .. 'o'
    elseif v == 'delect' then
        return fold_key .. 'd'
    elseif v == 'fold' then
        return fold_key .. 'f'
    elseif v == 'expand-all' then
        return fold_key .. 'e'
    elseif v == 'close-all' then
        return fold_key .. 'a'
    else
        return nil
    end
end

module.get_key = get_key

return module

