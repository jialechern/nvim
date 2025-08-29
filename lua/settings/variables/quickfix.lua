-- quickfix.lua
-- 这里放置 quickfix 相关的符号

local module = {}

-- 引入引导 quickfix 控制的按键
local fix_leader = '<C-d>'

module.fix_leader = fix_leader

local function get_key(v)
    if v == 'open-fixwindow' then
        return fix_leader .. 'o'
    elseif v == 'close-fixwindow' then
        return fix_leader .. 'c'
    elseif v == 'goto' then
        return fix_leader .. 'g'
    elseif v == 'next' then
        return fix_leader .. 'j'
    elseif v == 'previous' then
        return fix_leader .. 'k'
    elseif v == 'first' then
        return fix_leader .. 'f'
    elseif v == 'last' then
        return fix_leader .. 'l'
    elseif v == 'next-file' then
        return fix_leader .. 'J'
    elseif v == 'prev-file' then
        return fix_leader .. 'K'
    elseif v == 'next-quickfix-list' then
        return fix_leader .. 'n'
    elseif v == 'next-quickfix-list-by-index' then
        return fix_leader .. 'N'
    elseif v == 'prev-quickfix-list' then
        return fix_leader .. 'p'
    elseif v == 'prev-quickfix-list-by-index' then
        return fix_leader .. 'P'
    elseif v == 'help' then
        return fix_leader .. '?'
    else
        return nil
    end
end

module.get_key = get_key

return module

