-- tabs.lua
-- 这里放置标签页相关的符号

local module = {}

-- 引入引导标签也控制的按键
local tab_leader = '<C-t>'

module.tab_leader = tab_leader

local function get_key(v)
    if v == 'edit' then
        return tab_leader .. 'e'
    elseif v == 'list' then
        return tab_leader .. 's'
    elseif v == 'new' then
        return tab_leader .. 'c'
    elseif v == 'close' then
        return tab_leader .. 'x'
    elseif v == 'only' then
        return tab_leader .. 'o'
    elseif v == 'T' then
        return tab_leader .. 't'
    elseif v == 'next' then
        return tab_leader .. 'n'
    elseif v == 'previous' then
        return tab_leader .. 'p'
    elseif v == 'goto' then
        return tab_leader .. 'g'
    elseif v == 'move' then
        return tab_leader .. 'm'
    elseif v == 'first' then
        return tab_leader .. 'f'
    elseif v == 'last' then
        return tab_leader .. 'l'
    else
        return nil
    end
end

module.get_key = get_key

return module

