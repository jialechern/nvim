-- tabs.lua
-- 这里放置标签页相关的符号

local module = {}

-- 引入引导标签也控制的按键
local tab_leader = '|'

module.tab_leader = tab_leader

local function get_key(v)
    if v == 'edit' then
        return tab_leader .. 'E'
    elseif v == 'list' then
        return tab_leader .. 'S'
    elseif v == 'new' then
        return tab_leader .. 'C'
    elseif v == 'close' then
        return tab_leader .. 'X'
    elseif v == 'only' then
        return tab_leader .. 'O'
    elseif v == 'T' then
        return tab_leader .. 'T'
    elseif v == 'next' then
        return tab_leader .. 'N'
    elseif v == 'previous' then
        return tab_leader .. 'P'
    elseif v == 'goto' then
        return tab_leader .. 'G'
    elseif v == 'move' then
        return tab_leader .. 'M'
    elseif v == 'first' then
        return tab_leader .. 'F'
    elseif v == 'last' then
        return tab_leader .. 'L'
    else
        return nil
    end
end

module.get_key = get_key

return module

