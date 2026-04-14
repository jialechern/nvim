-- vim-variables.lua
-- 这里放置一些 vim/neovim 中自带的变量符号

local module = {}

local meta_leader = '<C-m>'
module.meta_leader = meta_leader

local function get_key(v)
    if v == 'make-program' then
        return meta_leader .. 'm'
    elseif v == 'grep-program' then
        return meta_leader .. 'g'
    elseif v == 'grep-format' then
        return meta_leader .. 'G'
    elseif v == 'shell-pipe' then
        return meta_leader .. 's'
    elseif v == 'shell-redir' then
        return meta_leader .. 'S'
    elseif v == 'content-formater' then
        return meta_leader .. 'f'
    elseif v == 'goto-normal' then
        return '<C-q>'
    elseif v == 'help' then
        return meta_leader .. '?'
    else
        return nil
    end
end

module.get_key = get_key

return module

