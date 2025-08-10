--- fuzzy-finder.lua

local module = {}

local fuzzy_finder_leader = '<C-q>'
module.fuzzy_finder_leader = fuzzy_finder_leader

local function get_key(v)
    if v == 'files' then
        return fuzzy_finder_leader .. 'f'
    elseif v == 'files-by-path' then
        return fuzzy_finder_leader .. 'F'
    elseif v == 'rg' then
        return fuzzy_finder_leader .. 'G'
    elseif v == 'buffers' then
        return fuzzy_finder_leader .. 'b'
    elseif v == 'history' then
        return fuzzy_finder_leader .. 'h'
    elseif v == 'commands' then
        return fuzzy_finder_leader .. 'c'
    elseif v == 'lines' then
        return fuzzy_finder_leader .. 'l'
    elseif v == 'lines-in-buffers' then
        return fuzzy_finder_leader .. 'L'
    elseif v == 'files-in-git-repo' then
        return fuzzy_finder_leader .. 'g'
    elseif v == 'changes' then
        return fuzzy_finder_leader .. 'C'
    elseif v == 'marks' then
        return fuzzy_finder_leader .. 'm'
    elseif v == 'marks-in-buffers' then
        return fuzzy_finder_leader .. 'M'
    elseif v == 'search' then
        return fuzzy_finder_leader .. 's'
    elseif v == 'snippets' then
        return fuzzy_finder_leader .. 'S'
    elseif v == 'windows' then
        return fuzzy_finder_leader .. 'w'
    elseif v == 'jumps' then
        return fuzzy_finder_leader .. 'j'
    elseif v == 'tags' then
        return fuzzy_finder_leader .. 't'
    elseif v == 'tags-in-current-buffer' then
        return fuzzy_finder_leader .. 'T'
    else
        return nil
    end
end

module.get_key = get_key

return module

