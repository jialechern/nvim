-- buffers.lua
-- 这里放置一些缓冲区相关的符号

local module = {}

local buffer_leader = ';'
module.buffer_leader = buffer_leader

local function get_key(v)
    if v == 'previous' then
        return buffer_leader .. 'p'
    elseif v == 'next' then
        return buffer_leader .. 'n'
    elseif v == 'first' then
        return buffer_leader .. 'f'
    elseif v == 'last' then
        return buffer_leader .. 'l'
    elseif v == 'list' then
        return buffer_leader .. 's'
    elseif v == 'goto' then
        return buffer_leader .. 'g'
    elseif v == '#' then
        return buffer_leader .. '/'
    end
end

module.get_key = get_key

return module

